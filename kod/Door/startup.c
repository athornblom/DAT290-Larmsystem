#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_rcc.c"
#include "core_cm4.h"
#include "stm32f4xx_gpio.h"
#include "system_stm32f4xx.h"
#include "startup.h"
#include "delay.h"

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

void detect_Closed_Doors(int *pointer)
{
	while ((*pointer) == 0) {
	for (int i = 0; i < sizeof(GPIO_Pins); i = i + 2)
	{
		if (!(GPIO_ReadInputDataBit(GPIOE, GPIO_Pins[i])))
		{
			(*pointer)++;
		}
	}
	}
	}


void init_Doors(door *pointer, int length)
{
	int SafetyNum = 0;
	for (int i = 0; i < sizeof(GPIO_Pins); i = i+2)
	{
		if (!(GPIO_ReadInputDataBit(GPIOE, GPIO_Pins[i])))
		{
		
			SafetyNum++;
			pointer->id = i;
			pointer->controlbits = 0;
			pointer->time_larm = 0;
			pointer->time_central_larm = 2;
			pointer->password = 0;
			pointer->GPIO_lamp = GPIO_Pins[i + 1];
			pointer->GPIO_read = GPIO_Pins[i];
			pointer->larmTick = 0;
			pointer++;
			
		}
	}
}

//======================================GPIO=========================================================
void init_GPIO_Ports()
{
	/*  Function used to set the GPIO configuration to the default reset state ****/
	GPIO_InitTypeDef init;
	//GPIO E UTPORTAR
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7 | GPIO_Pin_9 | GPIO_Pin_11 | GPIO_Pin_13 | GPIO_Pin_15;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_OType = GPIO_OType_PP;
	init.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOE, &init);
	
	//konfigurerar inport GPIO E
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_10 | GPIO_Pin_12 |GPIO_Pin_14;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOE, &init);
}


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
/*void main(void){
	init_GPIO_Ports();
	systick_Init;
	while(msTicks < 1000)
	
	for (int i = 0; i < 1; i++)
	{
		if(GPIO_ReadInputDataBit(GPIOE, GPIO_Pin_14)){
		GPIO_SetBits(GPIOE, GPIO_Pin_15);
	}
	}
	else
	{
		GPIO_ResetBits(GPIOE, GPIO_Pin_15);
	}

	
	

}*/
door active_doors[4];
void main(void)
{
	init_GPIO_Ports();
	systick_Init();
	while(msTicks < 2000);
	/*int amountOfActiveDoors = 0;
	for (int i = 0; i < sizeof(GPIO_Pins) / sizeof(uint16_t); i = i + 2)
	{
		if(!GPIO_ReadInputDataBit(GPIOE, GPIO_Pins[i])){
			amountOfActiveDoors++;
		}
	}
	
	//amountOfActiveDoors = 4;
	if(amountOfActiveDoors == 4){
		GPIO_SetBits(GPIOE,GPIO_Pin_15);
	}
	
	//door active_doors[amountOfActiveDoors];
	 */
	
	int counter = 0;
	for (int i = 0; i < sizeof(GPIO_Pins) / sizeof(uint16_t); i = i + 2)
	{
		if((!GPIO_ReadInputDataBit(GPIOE, GPIO_Pins[i])) && (counter < 4 )){
			active_doors[counter].GPIO_read = GPIO_Pins[i];
			active_doors[counter].GPIO_lamp = GPIO_Pins[i+1];
			active_doors[counter].controlbits = 0;
			active_doors[counter].time_larm = 0;
			active_doors[counter].time_central_larm = 2;
			counter++;
		}
	}

	//detect_Closed_Doors(&amountOfActiveDoors); // Hur många dörrar är aktiva?
	//door active_doors[amountOfActiveDoors];	// Skapa en array med tillräckligt stor size.
	//init_Doors(&active_doors[0], amountOfActiveDoors);

	

	/*
	door test1 = {.id = 0, .controlbits = 0, .time_larm = 0, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_3, .GPIO_read = GPIO_Pin_2, .larmTick = 0};
	door test2 = {.id = 1, .controlbits = 0, .time_larm = 0, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_5, .GPIO_read = GPIO_Pin_4, .larmTick = 0};
	door test3 = {.id = 2, .controlbits = 0, .time_larm = 0, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_9, .GPIO_read = GPIO_Pin_8, .larmTick = 0};
	door test4 = {.id = 3, .controlbits = 0, .time_larm = 0, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_7, .GPIO_read = GPIO_Pin_6, .larmTick = 0};
	
	door active_doors[4] = {test1,test2,test3,test4};
	*/
	
	while (1)
	{
		for (int i = 0; i < sizeof(active_doors); i++)
		{
			if (!GPIO_ReadInputDataBit(GPIOE, active_doors[i].GPIO_read))
			{
				active_doors[i].controlbits &= 0xFFFE; //borde va så!
													   //GPIO_ResetBits(GPIOE, active_doors[i].GPIO_lamp);
			}
			else
			{
				if (!active_doors[i].controlbits & 1)
				{
					active_doors[i].larmTick = msTicks;
				}
				active_doors[i].controlbits |= 1;

				//GPIO_SetBits(GPIOE, active_doors[i].GPIO_lamp);
			}

			for (int i = 0; i < sizeof(active_doors); i++)
			{
				if (active_doors[i].controlbits & 1 && msTicks > (active_doors[i].larmTick + 1000 * 10 * active_doors[i].time_larm))
				{
					GPIO_SetBits(GPIOE, active_doors[i].GPIO_lamp);
				}

				else
				{
					GPIO_ResetBits(GPIOE, active_doors[i].GPIO_lamp);
				}
				if (active_doors[i].controlbits & 1 && msTicks > (active_doors[i].larmTick + 1000 * 10 * active_doors[i].time_central_larm))
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