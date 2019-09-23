/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );


#include "stm32f4xx_gpio.h"

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}



void main(void)
{
	GPIO_InitTypeDef init = {GPIO_Pin_0, GPIO_Mode_OUT, GPIO_Low_Speed, GPIO_OType_PP, GPIO_PuPd_DOWN};
	GPIO_Init(GPIOA, &init);
	
	
}

