#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_rcc.c"
#include "core_cm4.h"
#include "stm32f4xx_gpio.h"
#include "system_stm32f4xx.h"
#include "startup.h"
#include "delay.h"
#include "init.h"

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
// ========================================= DOOOOOORS INIT =================================================
uint16_t GPIO_Pins[] = {
	GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3, GPIO_Pin_4, GPIO_Pin_5,
	GPIO_Pin_6, GPIO_Pin_7, GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
	GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15};

// ========================================= SYSTICK ================================================
volatile uint32_t msTicks = 0; /* Variable to store millisecond ticks */
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
	{   // Om inte SysTick_Config lyckas...
		//typ reboot? bootloops är alltid kul
	}
}

void main(void)
{
	init_GPIO_Ports();
	systick_Init();
	while(msTicks < 2000);

	door door1, door2, door3, door4, door5, door6, door8, door9 ,door10, door11, door12, door13,door14,door15,door16;
	door all_doors[16] = {door1, door2, door3, door4, door5, door6, door8, door9 ,door10, door11, door12, door13,door14,door15,door16};

	int amountOfActiveDoors = 0;
	for (int i = 0; i < sizeof(GPIO_Pins) / sizeof(uint16_t); i = i + 2)
	{
		if(!GPIO_ReadInputDataBit(GPIOE, GPIO_Pins[i])){
			amountOfActiveDoors++;
		}
	}
	door active_doors[amountOfActiveDoors];
	int counter = 0;
	
	for (int i = 0; i < sizeof(GPIO_Pins) / sizeof(uint16_t); i = i + 2)
	{
		if(!GPIO_ReadInputDataBit(GPIOE, GPIO_Pins[i])){
			all_doors[counter].GPIO_read = GPIO_Pins[i];
			all_doors[counter].GPIO_lamp = GPIO_Pins[i+1];
			all_doors[counter].controlbits = 0;
			all_doors[counter].time_larm = 0;
			all_doors[counter].time_central_larm = 2;
			active_doors[counter] = all_doors[counter];
			counter++;
		}
	}

	/*door test1 = {.id = 0, .controlbits = 0, .time_larm = 0, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_3, .GPIO_read = GPIO_Pin_2, .larmTick = 0};
	door test2 = {.id = 1, .controlbits = 0, .time_larm = 0, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_5, .GPIO_read = GPIO_Pin_4, .larmTick = 0};
	door test3 = {.id = 2, .controlbits = 0, .time_larm = 0, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_9, .GPIO_read = GPIO_Pin_8, .larmTick = 0};
	door test4 = {.id = 3, .controlbits = 0, .time_larm = 0, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_7, .GPIO_read = GPIO_Pin_6, .larmTick = 0};
	*/
	//door active_doors[4] = {test1,test2,test3,test4};
	GPIO_SetBits(GPIOA, GPIO_Pin_2);
	
	while (1)
	{
		for (int i = 0; i < sizeof(active_doors)/sizeof(active_doors[0]); i++)
		{
			if (!GPIO_ReadInputDataBit(GPIOE, active_doors[i].GPIO_read)){ //GPIO pinnen är noll ifall dörren är stängd därför !
				active_doors[i].controlbits &= 0xFFFE; //Nollställer kontrollbiten för ifall en dörr är öppen, när den detekteras som stängd
			}
			else{
				if (!active_doors[i].controlbits & 1) // Kollar så att dörren inte larmar sen innan så larmtick inte uppdateras hela tiden
				{
					active_doors[i].larmTick = msTicks;
				}
				active_doors[i].controlbits |= 1; // sätter dörrens larm kontrollbit till 1.
			}
			for (int i = 0; i < sizeof(active_doors)/sizeof(active_doors[0]); i++)
			{
				if (active_doors[i].controlbits & 1 && msTicks > (active_doors[i].larmTick + 1000 * 10 * active_doors[i].time_larm))
				{
					GPIO_SetBits(GPIOE, active_doors[i].GPIO_lamp); // tänder lampan ifall tiden för att dörren ska larma har gått
				}
				else
				{
					GPIO_ResetBits(GPIOE, active_doors[i].GPIO_lamp);	// släcker lampan annars
				}
				if (active_doors[i].controlbits & 1 && msTicks > (active_doors[i].larmTick + 1000 * 10 * active_doors[i].time_central_larm))
				{
					// Något med CAN
				}
			}
		}
	}
}