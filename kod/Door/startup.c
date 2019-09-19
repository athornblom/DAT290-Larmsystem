/*
 * 	startup.c
 *
 */
#include "stm32f4xx_gpio.h"
#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"

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

void init_GPIOA(){
/*  Function used to set the GPIO configuration to the default reset state ****/
	GPIO_InitTypeDef init;

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_OType = GPIO_OType_PP;

//konfigurerar inport
	GPIO_StructInit(&init);

void app_init()
{
}

void app_init() {
	door door1 = {1, 0,1,2,1234};
}

void alarm_TurnOff(door d) {
	
}

void main(void)
{	
//	app_init();  Vad ska hända här? //nästan allt för början av uppstart
	app_init();
	init_GPIOA();

	// För iteration av samtliga GPIO_pins i loopar.
	uint16_t GPIO_Pins[] = {
		GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3,
		GPIO_Pin_4, GPIO_Pin_5, GPIO_Pin_6, GPIO_Pin_7,
		GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
		GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15
		};	
	// Main Loop
	while(1) {
		for (int i = 0; i < sizeof(GPIO_Pins); i+=2) 
		{
			if(GPIO_ReadInputDataBit(GPIOA,GPIO_Pins[i])) {
				GPIO_ResetBits(GPIOA,GPIO_Pins[i+1]);
			} else {
				GPIO_SetBits(GPIOA,GPIO_Pins[i+1]);
				//if (kontroll bit dörren är inte uppställd)
				//else{
					//if är dörren upplåst ctrl bit 2
						//delay door.get(time_alarm)
						
					//else annars LARM DIREKT


				//}
			}
		}	
}


typedef struct door {
	char id;
	char controlbits;		// 8 kontrollbitar tex den minst signifikanta biten är ifall dörren är upplåst eller ej
	char time_larm;			// tid i 10 sekunders intervall innan dörr larmar lokalt
	char time_central_larm; // tid i 10 sekunders intervall innan dörr larmar centralenheten
	short password; //4 sifferig kod för att låsa upp dörrarna
} door;
