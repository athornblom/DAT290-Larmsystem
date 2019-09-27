/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

#include "stdio.h"
#include "stm32f4xx_gpio.h"
#include "core_cm4.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_syscfg.h"



void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}



		
typedef struct MotionSensors {
	char id;
	char controlbits;		// 8 kontrollbitar tex den minst signifikanta biten är ifall sensorn är aktiv eller ej
	short password;			// 4 sifferig kod för att aktivera/avaktivera sensorn
	uint16_t trig, echo;	// Pinnar för trig och echo, t.ex GPIO_Pin_0 och GPIO_Pin_1
} MotionSensor; 
MotionSensor motion1;


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


void init_Sensors(){
	motion1.id = 0;
	motion1.controlbits = 1;
	motion1.password = 2389;
	motion1.trig = GPIO_Pin_0;
	motion1.echo = GPIO_Pin_1;
	
}


void init_GPIO_Ports(){
	/*  Function used to set the GPIO configuration to the default reset state ****/
	GPIO_InitTypeDef init;
	//GPIO A UTPORTAR
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = motion1.echo | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_OType = GPIO_OType_PP;
	GPIO_Init(GPIOA, &init);

	//konfigurerar inport GPIO A
	GPIO_StructInit(&init);
	init.GPIO_Pin = motion1.trig | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOA, &init);
}




void main(void)
{
	init_Sensors();
	init_GPIO_Ports();

	
	//Systick
	*((void (**)(void) ) 0x2001C03C ) = SysTick_Handler;
	uint32_t returnCode;
  	returnCode = SysTick_Config(168000000/1000);      /* Configure SysTick to generate an interrupt every millisecond */
	
	
}

