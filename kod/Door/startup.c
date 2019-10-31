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
door doors[32];
int amountOfActiveDoors = 0;
int maxDoors = 32;
uint32_t timeOutId = 0;
// Två listor som behövs för att dörrenheten ska kunna detektera dörrar vid uppstart.
uint16_t GPIO_Pins[] = {
	GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3, GPIO_Pin_4, GPIO_Pin_5,
	GPIO_Pin_6, GPIO_Pin_7, GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
	GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15};

GPIO_TypeDef* GPIO_Ports[] = {GPIOE, GPIOA, GPIOD, GPIOC};

// ========================== Dynamisk Dörr initiering =================================
//Funktion vars uppgift är att räkna hur många stängda dörrar som är inkopplade till kortet
// Funktion som lägger in standard värden för varje detekterad dörr och vilken pin de sitter på
void active_doors_add_doors(){
	int counter = 0;
	for (int j = 0; j < (sizeof(GPIO_Ports) /sizeof(GPIO_TypeDef *)); j++)
	{
		for (int i = 0; i < sizeof(GPIO_Pins) / sizeof(uint16_t); i = i + 2)
		{
			if(GPIO_Ports[j] == GPIOC && GPIO_Pins[i] == GPIO_Pin_4){
			 // detta är för att port c pinne 4 icke funkar för oss.
			}
			else if(!GPIO_ReadInputDataBit(GPIO_Ports[j], GPIO_Pins[i])){
				doors[counter].id = counter;
				doors[counter].GPIO_read = GPIO_Pins[i];
				doors[counter].GPIO_lamp = GPIO_Pins[i+1];
				doors[counter].controlbits = 0;
				doors[counter].time_larm = 1;
				doors[counter].time_central_larm = 2;
				doors[counter].waitOutTime = 0;
				doors[counter].GPIO_type = GPIO_Ports[j];
				counter++;
				amountOfActiveDoors++;
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
	returnCode = SysTick_Config(168000000 / 10000); // Genererar ett SysTick-avbrott varje mikro s.

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

	//ökar ammountOFactiveDoors till så många stängda dörrar som är inkopplade
		
	active_doors_add_doors(); // initierar standard värden och portar
	getId(amountOfActiveDoors); //Skickar till centralenheten hur många aktiva dörrar dörrenheten har och får ett id
	startup_lights(); // Mest för cool het's faktorns skull ingen riktigt funktionallitet
	GPIO_SetBits(GPIOB, GPIO_Pin_2); // Lampa som lyser när systemet är färdig initierat.
	while (1)
	{
		check_door_status(); // Uppdatterar kontrollbitarna för varje dörr.
		check_door_sound (); // kollar ifall någon dörr är öppen
		for (int i = 0; i < amountOfActiveDoors; i++)
			{
				door_uppdate_lamps(i);
				if (central_larm(i)) //kollar ifall dörren vart upppe längre än den inställda tiden för centralt larm.
				{
					sendAlarm(i);
				}
			}
		if(nocid && msTicks > timeOutId){
			timeOutId = msTicks + 100000; // ifall dörreneheten inte fått ett id så testar den att kolla ifall det finns en centralenhet var 10:e sekund
			tryGetId();
		}
	}
}
	
