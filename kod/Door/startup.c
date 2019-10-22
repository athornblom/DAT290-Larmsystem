#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h" //behövs för rng
#include "core_cm4.h"

#include "functions.h"
#include "startup.h"
#include "init_GPIO.h"
#include "door_can.h"
void startup(void) __attribute__((naked)) __attribute__((section(".start_section")));

void startup(void)
{
	__asm volatile(
		" LDR R0,=0x2001C000\n" /* set stack */
		" MOV SP,R0\n"
		" BL main\n"   /* call main */
		"_exit: B .\n" /* never return */
	);
}
// Global
uint32_t id = 0; // Dörrenhetens id, 0 vid uppstart -> randome nr -> asignat nr av centralenheten
char nocid = 1; //Kontrollbit som ettställs ifall dörrenheten har fått ett id.
volatile char annydoorLarm = 0; //kontrollbit ifall någon dörr larmar

// Två listor som behövs för att dörrenheten ska kunna detektera dörrar vid uppstart.
uint16_t GPIO_Pins[] = {
	GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3, GPIO_Pin_4, GPIO_Pin_5,
	GPIO_Pin_6, GPIO_Pin_7, GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
	GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15};

GPIO_TypeDef* GPIO_Ports[] = {GPIOE, GPIOA, GPIOD, GPIOC};

// ========================== Dynamisk Dörr initiering =================================
//Funktion vars uppgift är att räkna hur många stängda dörrar som är inkopplade till kortet
void num_active_doors (int *counter){
	for (int j = 0; j < (sizeof(GPIO_Ports) /sizeof(GPIO_TypeDef *)); j++)
		{
			for (int i = 0; i < sizeof(GPIO_Pins) / sizeof(uint16_t); i = i + 2)
			{
				if(!GPIO_ReadInputDataBit(GPIO_Ports[j], GPIO_Pins[i])){
					(*counter)++;
				}
			}
		}
}
// Funktion som lägger in standard värden för varje detekterad dörr och vilken pin de sitter på
void active_doors_add_doors(door *active_doors,int saftyNum){
	int counter = 0;
	for (int j = 0; j < (sizeof(GPIO_Ports) /sizeof(GPIO_TypeDef *)); j++)
	{
		for (int i = 0; i < sizeof(GPIO_Pins) / sizeof(uint16_t); i = i + 2)
		{
			if(!GPIO_ReadInputDataBit(GPIO_Ports[j], GPIO_Pins[i]) && counter < saftyNum){
				active_doors->id = counter;
				active_doors->GPIO_read = GPIO_Pins[i];
				active_doors->GPIO_lamp = GPIO_Pins[i+1];
				active_doors->controlbits = 0;
				active_doors->time_larm = 0;
				active_doors->time_central_larm = 0;
				active_doors->GPIO_type = GPIO_Ports[j];
				active_doors++;
				counter++;
			}
		}
	}
}


// ========================================= SYSTICK ================================================
volatile uint32_t msTicks = 0;
char control = 0;
void SysTick_Handler(void)
{ /* SysTick interrupt Handler. */
	
	msTicks++;
	if(annydoorLarm){
	if(control){
		GPIO_SetBits(GPIOA, GPIO_Pin_5);
	}else{
		GPIO_ResetBits(GPIOA,GPIO_Pin_5);
	}
	control = ~control;
	}
}

void systick_Init(void)
{
	// Initiera SysTick.
	*((void (**)(void))0x2001C03C) = SysTick_Handler;
	uint32_t returnCode;
	returnCode = SysTick_Config(168000000 / 10000); // Genererar ett SysTick-avbrott varje ms.

	if (returnCode != 0)
	{   
		systick_Init();
	}
}

void main(void)
{
	init_GPIO_Ports();
	systick_Init();
	can_init();
	init_rng();
	delay(2000); // väntar 2s för att säkerhetställa så att GPIO init har hunnit verkställas på kortet

	int amountOfActiveDoors = 0;
	num_active_doors(&amountOfActiveDoors); //ökar ammountOFactiveDoors till så många stängda dörrar som är inkopplade
	door active_doors[amountOfActiveDoors];  
	active_doors_add_doors(&active_doors[0], amountOfActiveDoors); // initierar standard värden och portar
	
	getId(amountOfActiveDoors); //Skickar till centralenheten hur många aktiva dörrar dörrenheten har och får ett id
	startup_lights(&active_doors[0],amountOfActiveDoors); // Mest för cool het's faktorns skull ingen riktigt funktionallitet
	GPIO_SetBits(GPIOB, GPIO_Pin_2); // Lampa som lyser när systemet är färdig initierat.

	while (1)
	{
		check_door_status(&active_doors[0],amountOfActiveDoors); // Uppdatterar kontrollbitarna för varje dörr.
		check_door_sound (&active_doors[0],amountOfActiveDoors); // kollar ifall någon dörr är öppen
		for (int i = 0; i < amountOfActiveDoors; i++)
			{
				door_uppdate_lamps(&active_doors[i]);
				if (central_larm(&active_doors[i])) //kollar ifall dörren vart upppe längre än den inställda tiden för centralt larm.
				{
					sendAlarm((active_doors[i].id));
				}
			}
	}
}
	
