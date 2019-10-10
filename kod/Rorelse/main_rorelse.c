/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

#define DEBUG


#include <stdio.h>
#include "string.h"
#include "stm32f4xx_gpio.h"
#include "core_cm4.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_syscfg.h"
#include "USARTDebug.h"



void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}



// Struct för avståndsmätare
typedef struct MotionSensors {
	char id, controlbits;							// Id och 8 kontrollbitar tex den minst signifikanta biten är ifall sensorn är aktiv eller ej.
	short password;									// 4 sifferig kod för att aktivera/avaktivera sensorn.
	uint16_t trig, echo, lamp;						// Pinnar för trig, echo och lampa, t.ex GPIO_Pin_2, GPIO_Pin_3 och GPIO_Pin_4.
	uint32_t pulseTrig, pulseEcho, pulseDelay;		// Längd på triggerpuls(10µs), tid tills pulsen kommer tillbaks och fördröjning mellan pulser.
	float cm, alarm; 								// Avstånd till föremål och larmavstånd.
} MotionSensor;
/* Controbits olika bitar:
 * Bit 0: Aktiv eller ej.
 * Bit 1: Förhindrar upprepad omstart av mätningen på echopulsen genom att biten sätts till 1 när mätningen startar och sätts till 0 när mätningen avslutas.
 * TODO
 */


MotionSensor motion1;
MotionSensor motion2;



volatile uint32_t microTicks = 0;		 // Variabel för microsekunder.
  
void SysTick_Handler(void)  {			 // SysTick interrupt Handler.
	microTicks++;
}


void init_Timer(){
	//Systick
	*((void (**)(void) ) 0x2001C03C ) = SysTick_Handler;
	uint32_t returnCode;
  	returnCode = SysTick_Config(168000000/1000000);      // Konfigurera SysTick att generera avbrott varje mikrosekund 
	if (returnCode) {
		DebugPrint("SysTick Fail");
	}
	
}

// Fördröjningsfunktion i mikrosekunder.
void delay_micro(uint32_t micros){
	uint32_t wait = microTicks + micros;
	while(wait > microTicks){
	}
}


void init_Sensors(){
	motion1.id = 0;
	motion1.controlbits = 1;
	motion1.password = 2389;
	motion1.trig = GPIO_Pin_2;
	motion1.echo = GPIO_Pin_3;
	motion1.lamp = GPIO_Pin_0;
	motion1.pulseTrig = 0;
	motion1.pulseEcho = 0;
	motion1.pulseDelay = 0;
	motion1.cm = 400;
	motion1.alarm = 20;
		
	motion2.id = 1;
	motion2.controlbits = 1;
	motion2.password = 2389;
	motion2.trig = GPIO_Pin_4;
	motion2.echo = GPIO_Pin_5;
	motion2.lamp = GPIO_Pin_6;
	motion2.pulseTrig = 0;
	motion2.pulseEcho = 0;
	motion2.pulseDelay = 0;
	motion2.cm = 400;
	motion2.alarm = 20;
	
}


void init_GPIO_Ports(){
	/*  Funktion för att sätta GPIO till standard konfigurationer */
	GPIO_InitTypeDef init;
	//konfigurerar inportar GPIO A
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = motion1.echo | motion2.echo;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	init.GPIO_Speed = GPIO_Fast_Speed; // 50 Mhz
	GPIO_Init(GPIOA, &init);

	//konfigurerar utportar GPIO A
	GPIO_StructInit(&init);
	init.GPIO_Pin = motion1.trig | motion1.lamp | motion2.trig | motion2.lamp;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_OType = GPIO_OType_PP;
	init.GPIO_Speed = GPIO_Fast_Speed;
	GPIO_Init(GPIOA, &init);
		
	//konfigurerar inport GPIO B
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = motion2.echo;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	init.GPIO_Speed = GPIO_Fast_Speed;
	GPIO_Init(GPIOB, &init);

}



void init_app(){
	init_Timer();
	init_Sensors();
	DebugPrintInit();
	init_GPIO_Ports();
}



void main(void){
	init_app();
	MotionSensor motionSensors[2] = {motion1, motion2};
	
	while(1){
		//DebugPrint("Start\n");
		// Delayverision
		/*
		GPIO_ResetBits(GPIOA, motion1.trig); // Vill ha en fin hög
		delay_micro(2);
		GPIO_SetBits(GPIOA,motion1.trig); // Aktivera triggpuls
		delay_micro(10);
		GPIO_ResetBits(GPIOA, motion1.trig); // Avaktivera triggpuls 
		
		while(!GPIO_ReadInputDataBit(GPIOA, motion1.echo)){ // Vänta på svar från echo
		}
	
		motion1.pulseEcho = microTicks;
		while(GPIO_ReadInputDataBit(GPIOA, motion1.echo)){ // Mät hur länge echopulsen är hög
			//highcount++;
		}
		
	
		
		motion1.cm = microTicks - motion1.pulseEcho/58;
		if(motion1.cm < motion1.alarm){ // Upptäcker sensorn något som är för nära?
			GPIO_SetBits(GPIOA, GPIO_Pin_4);	// Tänd lampa
			DebugPrint("1\n");
		}
		else{
			GPIO_ResetBits(GPIOA, GPIO_Pin_4);	// Släck lampa
			DebugPrint("0\n");
		}		
		delay_micro(200000);
*/
		
		// Pollingverision
		for(int i = 0; i*4 < sizeof(motionSensors); i++){
		if(motionSensors[i].controlbits & 1){
			if(microTicks >= motionSensors[i].pulseTrig){ // Är trigpulsen klar?
				GPIO_ResetBits(GPIOA, motionSensors[i].trig);	// Avaktivera triggerpuls
			}
			if(microTicks >= motionSensors[i].pulseDelay){  // Är triggfördröjningen klar?
				GPIO_SetBits(GPIOA, motionSensors[i].trig);	// Aktivera triggerpuls
				motionSensors[i].pulseTrig = microTicks + 10; // Triggpuls 10µs
				motionSensors[i].pulseDelay = microTicks + 60000;	// Fördröjning mellan triggerpulserna, 60ms
			}
			if(!(motionSensors[i].controlbits & (1 << 1)) && GPIO_ReadInputDataBit(GPIOA, motionSensors[i].echo)){ // Är echo hög för första gången?
				motionSensors[i].pulseEcho = microTicks; // Början av echopulsen.
				motionSensors[i].controlbits |= 1 << 1;  // Ettställer kontrollbit 1.
			}
			if ((motionSensors[i].controlbits & (1 << 1)) && !GPIO_ReadInputDataBit(GPIOA, motionSensors[i].echo)) {	// Är echo låg för första gången?
				motionSensors[i].cm = (microTicks - motionSensors[i].pulseEcho)/58; // Sekunder tills echo kommer tillbaks.
				motionSensors[i].controlbits &= 0xFD;	// Nollställer kontrollbit 1.
			}
			if(motionSensors[i].cm < motionSensors[i].alarm){	// Upptäcker sensorn något som är för nära?
				GPIO_SetBits(GPIOA, motionSensors[i].lamp);	// Tänd lampa.
			}
			else{
				GPIO_ResetBits(GPIOA, motionSensors[i].lamp);	// Släck lampa.
			}
		}
		
		
		
		//if (GPIO_ReadInputDataBit(GPIOB, motion2.echo) == Bit_RESET) {  // Vibration triggad
		/* Återanvänder variabler i MotionSensor till annat, Todo: i framtiden bör det nog finnas en egen struct för vibration.
		 * pulseEcho  = antal vibrationer
		 * pulseDelay = max antal vibrationer på 1 sekund innan det larmar
		 * pulseTrig  = tidsdelta 
		 * 
		 * Vid mätning utan delay mellan loop-cyklarna verkade 10k vara ett rimligt värde för pulseDelay.
		 * Detta bör mätas om när loopen är färdigskriven då timingen kommer att ha ändrats
		
			if (!motion2.pulseEcho) {
				motion2.pulseTrig = microTicks; // Tidstamp för första vibrationen			
			}
			motion2.pulseEcho++;
		}
			
						
		if (microTicks > (motion2.pulseTrig + 1000000))  {  // 1 Sekund efter första vibration
			if (motion2.pulseEcho > motion2.pulseDelay) {
				// Larma
			}
			motion2.pulseTrig = 0;
			motion2.pulseEcho= 0;
		}
		*/
		// microTicks bör ställas till 0 vid lämpligt tillfälle, max värde = 72 min
		
	}
	}

		
	
	
	
}
