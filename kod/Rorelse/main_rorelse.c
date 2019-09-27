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
	char id, controlbits;							// Id och 8 kontrollbitar tex den minst signifikanta biten är ifall sensorn är aktiv eller ej.
	short password;									// 4 sifferig kod för att aktivera/avaktivera sensorn.
	uint16_t trig, echo;							// Pinnar för trig och echo, t.ex GPIO_Pin_0 och GPIO_Pin_1.
	uint32_t pulseTrig, pulseEcho, pulseDelay;		// Längd på triggerpuls(10µs), tid tills pulsen kommer tillbaks och fördröjning mellan pulser
	float cm, alarm; 								// Avstånd till föremål och larmavstånd
} MotionSensor;


MotionSensor motion1;


volatile uint32_t microTicks = 0;                              /* Variable för microsekunder*/
  
void SysTick_Handler(void)  {                               /* SysTick interrupt Handler. */
	microTicks++;
}


void init_Timer(){
	//Systick
	*((void (**)(void) ) 0x2001C03C ) = SysTick_Handler;
	uint32_t returnCode;
  	returnCode = SysTick_Config(168000000/1000000);      /* Konfigurera SysTick att generera avbrott varje mikrosekund */
}


void init_Sensors(){
	motion1.id = 0;
	motion1.controlbits = 1;
	motion1.password = 2389;
	motion1.trig = GPIO_Pin_0;
	motion1.echo = GPIO_Pin_1;
	motion1.pulseTrig = 0;
	motion1.pulseEcho = 0;
	motion1.pulseDelay = 0; 
	motion1.cm = 400;
	motion1.alarm = 20;
	
}


void init_GPIO_Ports(){
	/*  Funktion för att sätta GPIO till standard konfigurationer */
	GPIO_InitTypeDef init;
	//konfigurerar inport GPIO A
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = motion1.echo | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_OType = GPIO_OType_PP;
	init.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOA, &init);

	//konfigurerar utport GPIO A
	GPIO_StructInit(&init);
	init.GPIO_Pin = motion1.trig | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	init.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOA, &init);
}



void init_app(){
	init_Timer();
	init_Sensors();
	init_GPIO_Ports();
}



void main(void)
{
	init_app();
	while(1){
		if(microTicks >= motion1.pulseTrig){ // Är trigpulsen klar?
			GPIO_ResetBits(GPIOA, motion1.trig);	// Avaktivera triggerpuls
		}
		else if(microTicks >= motion1.pulseDelay){  // Är triggfördröjningen klar?
			GPIO_SetBits(GPIOA, motion1.trig);	// Aktivera triggerpuls
			motion1.pulseTrig = microTicks + 10; // Triggpuls 10µs
			motion1.pulseDelay = microTicks + 1000;	// Fördröjning mellan triggerpulserna, 1ms
		}
		if(GPIO_ReadInputDataBit(GPIOA, motion1.echo)){ // Är echo hög?
			motion1.pulseEcho = microTicks; // Början av echopulsen
			while(GPIO_ReadInputDataBit(GPIOA, motion1.echo)){ // Medan echo är hög
			}
			motion1.cm = (microTicks - motion1.pulseEcho)/58; // Sekunder tills echo kommer tillbaks
		}
		if(motion1.cm < motion1.alarm){ // Upptäcker sensorn något som är för nära?
			GPIO_SetBits(GPIOA, GPIO_Pin_2);	// Tänd lampa
		}
		else{
			GPIO_ResetBits(GPIOA, GPIO_Pin_2);	// Släck lampa
		}
		
	}
	
	
}