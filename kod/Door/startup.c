/*
 * 	startup.c
 *
 */
#include "stm32f4xx_gpio.h"
#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"


void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

void app_init(){
/*  Function used to set the GPIO configuration to the default reset state ****/
	GPIO_InitTypeDef init;
	
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_OType = GPIO_OType_PP;
	GPIO_Init(GPIOA,&init);
	


//konfigurerar inport
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOA,&init);
	
	
}
void main(void)
{
	app_init();

	while (1) {
		if (GPIO_ReadInputData(GPIOA) & (1<<2)) {
			GPIO_ResetBits(GPIOA,GPIO_Pin_1);
		} else {
			GPIO_SetBits(GPIOA,GPIO_Pin_1);
		}
		if (GPIO_ReadInputData(GPIOA) & (1<<4)) {
			GPIO_ResetBits(GPIOA,GPIO_Pin_3);
		} else {
			GPIO_SetBits(GPIOA,GPIO_Pin_3);
		}
		if (GPIO_ReadInputData(GPIOA) & (1<<6)) {
			GPIO_ResetBits(GPIOA,GPIO_Pin_5);
		} else {
			GPIO_SetBits(GPIOA,GPIO_Pin_5);
		
		}
	}
	
	//struct door* newItem = malloc(sizeof(struct door));
	
	
}

	
	


/*inline struct door* door(char id, char controlbits, char time_larm,char time_central_larm, short password)
{
    return (struct my*)(id, controlbits, time_larm,time_central_larm,password);
}
*/

struct door {
	char id;
	char controlbits; // 8 kontrollbitar tex den minst signifikanta biten är ifall dörren är upplåst eller ej
	char time_larm; // tid i 10 sekunders intervall innan dörr larmar lokalt
	char time_central_larm; // tid i 10 sekunders intervall innan dörr larmar centralenheten
	short password; //4 sifferig kod för att låsa upp dörrarna
};



// Array av arrayer för Centralenheten, 2d, en siffra för kortet, en siffra för dörrarna, 