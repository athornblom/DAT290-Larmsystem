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

uint16_t GPIO_Pins[] = {
		GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3,
		GPIO_Pin_4, GPIO_Pin_5, GPIO_Pin_6, GPIO_Pin_7,
		GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
		GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15
		};

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

volatile uint32_t msTicks = 0;                              /* Variable to store millisecond ticks */
  
void SysTick_Handler(void)  {                               /* SysTick interrupt Handler. */
	msTicks++;
	if (msTicks % 1000 == 0) {
		GPIO_SetBits(GPIOA,GPIO_Pin_1);
	}
	if (msTicks % 2000 == 0) {
		GPIO_ResetBits(GPIOA,GPIO_Pin_1);
	}
	// Gör en ny Array med dörrar som larmar.
}

void main(void)
{
	//app_init();
	init_GPIO_Ports();
	
	//Systick
	*((void (**)(void) ) 0x2001C03C ) = SysTick_Handler;
	uint32_t returnCode;
  	returnCode = SysTick_Config(168000000/1000);      /* Configure SysTick to generate an interrupt every millisecond */
  
  if (returnCode != 0)  {                                   /* Check return code for errors */
    // Error Handling
	//typ reboot? bootloops är alltid kul 
  }
  //lista för gpio pins
  uint16_t alarm_pins[] = {uint16_t t,uint16_t t, uint16_t t,uint16_tt};
  uint32_t alarm_time[] = {uint32_t t,uint32_t t, uint32_t t,uint32_t t};
  //lista för msticks (VIKTIGT ATT DESSA HAR SAMMA INDEX)
  
  while (1)
	{
		for (int i = 0; i < sizeof(GPIO_Pins); i = i ssad hej + 2)
		{
			for (size_t i = 0; i < count; i++)
			{
				/* code */
			}
			
			
			/*if(larmande.length > 0)
				for (hela listan){
					if (mstick[i] == i)¨
					LARMA lokalt
					
				}
			}*/
			if (GPIO_ReadInputDataBit(GPIOA, GPIO_Pins[i]))
			{
				//tarbort larmad GPIO PIN ur listan med larmade
				
				//GPIO_ResetBits(GPIOA, GPIO_Pins[i + 1]);
			}
			else
			{
				//GPIO_SetBits(GPIOA, GPIO_Pins[i + 1]);
				 //Lägger till larmande GPIO PIN i en lista för dörrar som larmar
				 //lägger till mstick + larm lokalt tid i listan
			}
		}
	}


typedef struct door
{
	char id;
	char controlbits;		// 8 kontrollbitar tex den minst signifikanta biten är ifall dörren är upplåst eller ej
	char time_larm;			// tid i 10 sekunders intervall innan dörr larmar lokalt
	char time_central_larm; // tid i 10 sekunders intervall innan dörr larmar centralenheten
	short password;			//4 sifferig kod för att låsa upp dörrarna
}door; 
}
	


// Array av arrayer för Centralenheten, 2d, en siffra för kortet, en siffra för dörrarna,