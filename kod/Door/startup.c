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
// GLOBAL VARIABLES
uint32_t id = 0;
char nocid = 1;
// ========================================= DOOOOOORS INIT =================================================
uint16_t GPIO_Pins[] = {
	GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3, GPIO_Pin_4, GPIO_Pin_5,
	GPIO_Pin_6, GPIO_Pin_7, GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
	GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15};

GPIO_TypeDef* GPIO_Ports[] = {GPIOE, GPIOA, GPIOD, GPIOC};

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
void SysTick_Handler(void)
{ /* SysTick interrupt Handler. */
	msTicks++;
}

void systick_Init(void)
{
	// Initiera SysTick.
	*((void (**)(void))0x2001C03C) = SysTick_Handler;
	uint32_t returnCode;
	returnCode = SysTick_Config(168000000 / 1000); // Genererar ett SysTick-avbrott varje ms.

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
	delay(2000);

	int amountOfActiveDoors = 0;
	num_active_doors(&amountOfActiveDoors);
	door active_doors[amountOfActiveDoors];
	active_doors_add_doors(&active_doors[0], amountOfActiveDoors);
	
	//getId(amountOfActiveDoors);

	startup_lights(&active_doors[0],amountOfActiveDoors);
	GPIO_SetBits(GPIOB, GPIO_Pin_2); // tells system is ready

	while (1)
	{
		check_door_status(&active_doors[0],amountOfActiveDoors);
		for (int i = 0; i < amountOfActiveDoors; i++)
			{
				door_uppdate_lamps(&active_doors[i]);
				if (central_larm(&active_doors[i]))
				{
					sendAlarm((active_doors[i].id));
				}
			}
	}
}
	
