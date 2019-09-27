/*
 * 	startup.c
 *
 */
#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_rcc.c"
#include "core_cm4.h"
#include "stm32f4xx_gpio.h"
#include "system_stm32f4xx.h"

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
	// Globala variabler.
/*uint16_t GPIO_Pins[] = {
		GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3,
		GPIO_Pin_4, GPIO_Pin_5, GPIO_Pin_6, GPIO_Pin_7,
		GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
		GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15
		};*/

volatile uint32_t msTicks = 0;                              /* Variable to store millisecond ticks */
typedef struct doors
{
	char id;
	char controlbits;		// 8 kontrollbitar tex den minst signifikanta biten är ifall dörren är upplåst eller ej
	char time_larm;			// tid i 10 sekunders intervall innan dörr larmar lokalt
	char time_central_larm; // tid i 10 sekunders intervall innan dörr larmar centralenheten
	int password;			//4 sifferig kod för att låsa upp dörrarna
	int GPIO_lamp;
	int GPIO_read;
	int larmTick;        // msTick == larmState ? Larm
} door; 
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

  
void SysTick_Handler(void)  {                               /* SysTick interrupt Handler. */
	msTicks++;
}

void app_Init(void){
	
	
	// Initiera SysTick.
	*((void (**)(void) ) 0x2001C03C ) = SysTick_Handler;
	uint32_t returnCode;
	returnCode = SysTick_Config(168000000/1000);      // Genererar ett SysTick-avbrott varje ms.
  
	if (returnCode != 0)  {                          // Om inte SysTick_Config lyckas...
	//typ reboot? bootloops är alltid kul 
  }


}

void main(void)
{
	init_GPIO_Ports();
	app_Init();

	door test1 = {.id = 0, .controlbits = 0, .time_larm = 1, .time_central_larm = 3, .password = 0, .GPIO_lamp = GPIO_Pin_3, .GPIO_read = GPIO_Pin_2, .larmTick = 0};
	door test2 = {.id = 1, .controlbits = 0, .time_larm = 1, .time_central_larm = 3, .password = 0, .GPIO_lamp = GPIO_Pin_5, .GPIO_read = GPIO_Pin_4, .larmTick = 0};
	door test3 = {.id = 2, .controlbits = 0, .time_larm = 1, .time_central_larm = 3, .password = 0, .GPIO_lamp = GPIO_Pin_1, .GPIO_read = GPIO_Pin_0, .larmTick = 0};
	door active_doors[3] = {test1, test2,test3};
	
  //lista för msticks (VIKTIGT ATT DESSA HAR SAMMA INDEX)
  
  while (1)
	{
		for (int j = 0; j < sizeof(active_doors); j++)
		{
			if(active_doors[j].controlbits == 1){
				if (active_doors[j].larmTick < msTicks)
				{
					GPIO_SetBits(GPIOA, active_doors[j].GPIO_lamp);
				}else{
					//GPIO_ResetBits(GPIOA, active_doors[j].GPIO_lamp);
				}
				
			}else
			{
			}
			
		}
		
	
		
		for (int i = 0; i < sizeof(active_doors); i = i + 1)
		{
			if (GPIO_ReadInputDataBit(GPIOA, active_doors[i].GPIO_read))
			{
				//tarbort larmad GPIO PIN 
				active_doors[i].controlbits = 0;
				//GPIO_ResetBits(GPIOA, active_doors[i].GPIO_lamp);
			}
			else
			{
				active_doors[i].controlbits = 1;
				active_doors[i].larmTick = msTicks + 10*1000*active_doors[i].time_larm;
				//GPIO_SetBits(GPIOA, active_doors[i].GPIO_lamp);
				 //Lägger till larmande GPIO PIN i en lista för dörrar som larmar
				 //lägger till mstick + larm lokalt tid i listan
			}
		}
	}



}



// Array av arrayer för Centralenheten, 2d, en siffra för kortet, en siffra för dörrarna,