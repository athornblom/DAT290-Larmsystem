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



// Struct för rörelsesensorer
typedef struct MotionSensors {
	char id, controlbits;							// Id och 8 kontrollbitar tex den minst signifikanta biten är ifall sensorn är aktiv eller ej.
	short password;									// 4 sifferig kod för att aktivera/avaktivera sensorn.
	uint16_t pinTrig, pinEcho, pinLamp;				// Pinnar för trig, echo och lampa, t.ex GPIO_Pin_2, GPIO_Pin_3 och GPIO_Pin_4.
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


typedef struct VibrationSensors{
	char id, controlbits;		// Id och 8 kontrollbitar tex den minst signifikanta biten är ifall sensorn är aktiv eller ej.
	short password;				// 4 sifferig kod för att aktivera/avaktivera sensorn.
	uint16_t pinDO, pinLamp;	// Pinnar för vibrationssensorns 'digital output' och en lampa.
} VibrationSensor;

VibrationSensor vibration1;



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

/**
 * @brief Konfigurera GPIO portarna
 *
 * @note
 * Portar A, B, och C används till rörelsesensor; D och E används till vibrationsmätare.
 * För rörelsesensor används pinnar 3n, 3n + 1, 3n + 2, till trigg, echo, respektive lysdioden.
 * För vibrationsmätaren används jämna pinnar till D0 (Sensor avmätning), och udda till lysdioder.
 *
 * Det finns stöd för 5 rörelsesensor per port och 8 vibrationsmätare per port.
 */
void init_GPIO_Ports(){
	// Initiera klockar för alla portar
	uint32_t portClocks[5] = {RCC_AHB1Periph_GPIOA, RCC_AHB1Periph_GPIOB, RCC_AHB1Periph_GPIOC, RCC_AHB1Periph_GPIOD, RCC_AHB1Periph_GPIOE};
	for (int i=0; i*sizeof(portClocks[0]) < sizeof(portClocks); i++) {
		RCC_AHB1PeriphClockCmd(portClocks[i], ENABLE);
	}
	GPIO_InitTypeDef init;

	GPIO_TypeDef* motionPorts[3] = {GPIOA, GPIOB, GPIOC};
	for (int i=0; i*sizeof(motionPorts[0]) < sizeof(motionPorts); i++)
	{
		// Konfigurerar inportar för avståndsmätare
		GPIO_StructInit(&init);  // Default-ställer init konfigurationen
		init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_4 | GPIO_Pin_7 | GPIO_Pin_10 | GPIO_Pin_13;  // Echo pinnar
		init.GPIO_Mode = GPIO_Mode_IN;
		init.GPIO_PuPd = GPIO_PuPd_UP;
		init.GPIO_Speed = GPIO_Fast_Speed; // 50 Mhz
		GPIO_Init(motionPorts[i], &init);

		// Konfigurerar utportar för avståndsmätare
		GPIO_StructInit(&init);
		init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_11 | GPIO_Pin_12 | GPIO_Pin_14;  // Trigg & Lysdiod pinnar
		init.GPIO_Mode = GPIO_Mode_OUT;
		init.GPIO_OType = GPIO_OType_PP;
		init.GPIO_Speed = GPIO_Fast_Speed;
		GPIO_Init(motionPorts[i], &init);
	}

	GPIO_TypeDef*  vibrationPorts[2] = {GPIOD, GPIOE};

	for (int i=0; i*sizeof(vibrationPorts[0]) < sizeof(vibrationPorts); i++) {
		// Konfigurerar inportar vibrationssensor
		GPIO_StructInit(&init);
		init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_10 | GPIO_Pin_12 | GPIO_Pin_14; // D0 pinnar
		init.GPIO_Mode = GPIO_Mode_IN;
		init.GPIO_PuPd = GPIO_PuPd_UP;
		init.GPIO_Speed = GPIO_Fast_Speed; // 50 Mhz
		GPIO_Init(vibrationPorts[i], &init);

		// Konfigurerar utportar vibrationssensor
		GPIO_StructInit(&init);
		init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7 | GPIO_Pin_9 | GPIO_Pin_11 | GPIO_Pin_13 | GPIO_Pin_15; // Lysdiod pinnar
		init.GPIO_Mode = GPIO_Mode_IN;
		init.GPIO_PuPd = GPIO_PuPd_UP;
		init.GPIO_Speed = GPIO_Fast_Speed; // 50 Mhz
		GPIO_Init(vibrationPorts[i], &init);
	}
}



void init_MotionSensors(){
	motion1.id = 0;
	motion1.controlbits = 1;
	motion1.password = 2389;
	motion1.pinTrig = GPIO_Pin_7;
	motion1.pinEcho = GPIO_Pin_3;
	motion1.pinLamp = GPIO_Pin_8;
	motion1.pulseTrig = 0;
	motion1.pulseEcho = 0;
	motion1.pulseDelay = 0;
	motion1.cm = 400;
	motion1.alarm = 20;

	motion2.id = 1;
	motion2.controlbits = 1;
	motion2.password = 2389;
	motion2.pinTrig = GPIO_Pin_4;
	motion2.pinEcho = GPIO_Pin_5;
	motion2.pinLamp = GPIO_Pin_6;
	motion2.pulseTrig = 0;
	motion2.pulseEcho = 0;
	motion2.pulseDelay = 0;
	motion2.cm = 400;
	motion2.alarm = 20;

}

void init_VibrationSensor(){
	vibration1.id = 0;
	vibration1.controlbits = 1;
	vibration1.pinDO = GPIO_Pin_2;
	vibration1.pinLamp = GPIO_Pin_0;
}

void init_app(){
	init_Timer();
	init_GPIO_Ports();
	//init_Sensors():
	// init_MotionSensors();
	// init_VibrationSensor();
	DebugPrintInit();
}



void main(void){
	init_app();
	MotionSensor motionSensors[2] = {motion1, motion2};

	while(1){

		// Pollingverision motionssensor
		for(int i = 0; i*sizeof(motionSensors[0]) < sizeof(motionSensors); i++){ // Itererar koden för alla rörelsesensorer
			if(motionSensors[i].controlbits & 1){ // Är sensorn aktiverad?
				if(microTicks >= motionSensors[i].pulseTrig){ // Är trigpulsen klar?
					GPIO_ResetBits(GPIOA, motionSensors[i].pinTrig);	// Avaktivera triggerpuls
				}
				if(microTicks >= motionSensors[i].pulseDelay){  // Är triggfördröjningen klar?
					GPIO_SetBits(GPIOA, motionSensors[i].pinTrig);	// Aktivera triggerpuls
					motionSensors[i].pulseTrig = microTicks + 10; // Triggpuls 10µs
					motionSensors[i].pulseDelay = microTicks + 60000;	// Fördröjning mellan triggerpulserna, 60ms
				}
				if(!(motionSensors[i].controlbits & (1 << 1)) && GPIO_ReadInputDataBit(GPIOA, motionSensors[i].pinEcho)){ // Är echo hög för första gången?
					motionSensors[i].pulseEcho = microTicks; // Början av echopulsen.
					motionSensors[i].controlbits |= 1 << 1;  // Ettställer kontrollbit 1.
				}
				if ((motionSensors[i].controlbits & (1 << 1)) && !GPIO_ReadInputDataBit(GPIOA, motionSensors[i].pinEcho)) {	// Är echo låg för första gången?
					motionSensors[i].cm = (microTicks - motionSensors[i].pulseEcho)/58; // Sekunder tills echo kommer tillbaks.
					motionSensors[i].controlbits &= 0xFD;	// Nollställer kontrollbit 1.
				}
				if(motionSensors[i].cm < motionSensors[i].alarm){	// Upptäcker sensorn något som är för nära?
					GPIO_SetBits(GPIOA, motionSensors[i].pinLamp);	// Tänd lampa.
				}
				else{
					GPIO_ResetBits(GPIOA, motionSensors[i].pinLamp);	// Släck lampa.
				}
			}
		}

		if(!GPIO_ReadInputDataBit(GPIOA, vibration1.pinDO)){
			GPIO_SetBits(GPIOA, vibration1.pinLamp);
		}
		else{
			GPIO_ResetBits(GPIOA, vibration1.pinLamp);
		}

	}





}
