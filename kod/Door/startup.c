/*
 * 	startup.c
 *
 */

//#define DEBUG

#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_rcc.c"
#include "core_cm4.h"
#include "stm32f4xx_gpio.h"
#include "system_stm32f4xx.h"
#include "startup.h"
//#include "USARTDebug.h"

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

uint16_t GPIO_Pins[] = {
	GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3, GPIO_Pin_4, GPIO_Pin_5,
	GPIO_Pin_6, GPIO_Pin_7, GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
	GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15
	};


volatile uint32_t msTicks = 0; /* Variable to store millisecond ticks */
int activeDoors = 0;

void number_of_activeDoors (void){

	for (int i = 0; i < sizeof(GPIO_Pins); i = i+2)
	{
		if (GPIO_ReadInputDataBit(GPIOA, GPIO_Pins[i]));
		{
			activeDoors++;
		}
		
	}
}



void app_init2(door **array, int length) {
	free(*array);
	*array = malloc(length * sizeof(door));
	for (int i = 0; i < length; i++) {
		(*array)[i] = {.controlbits = i}
	}
}

/*
void app_init(door active_doors[]){
	int a = 0;
	int c = 0;
	for (int i = 0; i < sizeof(GPIO_Pins); i = i+2)
	{
		if (GPIO_ReadInputDataBit(GPIOA, GPIO_Pins[i]));
		{
			active_doors[a] = {.id = a, .controlbits = 0, .time_larm = 1, .time_central_larm = 2, .password = 4444, .GPIO_lamp = GPIO_Pins[i+1], .GPIO_read = GPIO_Pins[i], .larmTick = 0};
			a++;
			c++;
		}
		
	}
	*/
	
}
void init_GPIO_Ports()
{
	/*  Function used to set the GPIO configuration to the default reset state ****/
	GPIO_InitTypeDef init;
	//GPIO A UTPORTAR
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_OType = GPIO_OType_PP;
	GPIO_Init(GPIOA, &init);

	//konfigurerar inport GPIO A
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOA, &init);
}
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
	number_of_activeDoors();			// Hur många dörrar är aktiva?
	door activeDoors[activeDoors];		// Skapa en array med tillräckligt stor size.
	app_init2(&activeDoors,active_doors);				// Initiera tillräckligt många structs och lägg till i arrayen.
	systick_Init();
//	DebugPrintInit();
	//door test1 = {.id = 0, .controlbits = 0, .time_larm = 1, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_3, .GPIO_read = GPIO_Pin_2, .larmTick = 0};
	//door test2 = {.id = 1, .controlbits = 0, .time_larm = 1, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_5, .GPIO_read = GPIO_Pin_4, .larmTick = 0};
	//door test3 = {.id = 2, .controlbits = 0, .time_larm = 1, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_1, .GPIO_read = GPIO_Pin_0, .larmTick = 0};
	//door test4 = {.id = 3, .controlbits = 0, .time_larm = 1, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_7, .GPIO_read = GPIO_Pin_6, .larmTick = 0};
//
	//door active_doors[4] = {test1,test2,test3,test4};

	while (1)
	{
		for (int i = 0; i < sizeof(active_doors); i++)
		{
			if(GPIO_ReadInputDataBit(GPIOA, active_doors[i].GPIO_read)){
				active_doors[i].controlbits &= 0xFFFE; //borde va så!
				//GPIO_ResetBits(GPIOA, active_doors[i].GPIO_lamp);
			} else{
				if(!active_doors[i].controlbits & 1){
					active_doors[i].larmTick = msTicks;
				}
				active_doors[i].controlbits |= 1;

				//GPIO_SetBits(GPIOA, active_doors[i].GPIO_lamp);
				}
				
		for (int i = 0; i < sizeof(active_doors); i++)
		{ 
			if (active_doors[i].controlbits & 1 && msTicks > (active_doors[i].larmTick + 1000*10* active_doors[i].time_larm))
			{
				GPIO_SetBits(GPIOA, active_doors[i].GPIO_lamp);
			}
			
			else{
				GPIO_ResetBits(GPIOA, active_doors[i].GPIO_lamp);
			}
			if (active_doors[i].controlbits & 1 && msTicks > (active_doors[i].larmTick + 1000*10* active_doors[i].time_central_larm))
			{
				//Larma central enheten
			}	
		}
	}
}
}

// Lösenord?
// Detektera dörrar automatiskt.
//
