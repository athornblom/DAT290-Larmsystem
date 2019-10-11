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

// Struct för motionsensorer
typedef struct MotionSensors {								
	uint16_t pinTrig, pinEcho;					// Pinnar för trig, echo t.ex GPIO_Pin_4, GPIO_Pin_5.
	uint32_t pulseTrig, pulseEcho, pulseDelay;	// Längd på triggerpuls(10µs), tid tills pulsen kommer tillbaks och fördröjning mellan pulser.
	float cm, alarmDistance; 					// Avstånd till föremål och larmavstånd.
} MotionSensor;

//	Struct för vibrationssensor
typedef struct VibrationSensors{
	uint16_t pinD0;	// Pin för vibrationssensorns 'digital output'.
} VibrationSensor;

/**
 * @brief	Struct för alla sensorer
 * @var 	controlbits: Kontrollbitar för diverse användningsområden:
 * 				0: Aktiv eller ej
 * 				1: 0 = Motionssensor, 1 = Vibrationssensor
 * 				2: (Motion) Stigande kant på echo puls mätning, (Vibration) @todo
 * 				3-6: @todo
 *				7: Sensorn larmar
 * @var		VibrationSensor: struct av vibrationssensor med vibrationssensor konfiguration. (pinD0)
 * @var		MotionSensor: struct av motionsensor med motionssensor konfiguration. (pinTrig, pinEcho, pulseTrig, pulseEcho, pulseDelay, cm, alarm)
 */
typedef struct Sensors {
	char 			id, controlbits;	// ID och 8 kontrollbitar
	short 			password;			// 4 sifferig kod för att aktivera/avaktivera sensorn.
	
	GPIO_TypeDef*	port;				// Porten sensorn är kopplad till
	uint16_t 		pinLamp;			// Pin för lysdiod för sensorn
	
	VibrationSensor vibration;
	MotionSensor 	motion;
} Sensor;

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

// För testning
Sensor motion1;
MotionSensor motion1m;
Sensor motion2;
MotionSensor motion2m;

Sensor vibration1;
VibrationSensor vibration1v;
	
void init_Sensors(){
	motion1.id 			= 0;
	motion1.controlbits = 0x1 | 1 << 1;  // Sensorn är aktiv och är av typen motion
	motion1.password 	= 2389;
	motion1.port 		= GPIOA;
	motion1.pinLamp 	= GPIO_Pin_5;
	motion1.motion 		= motion1m;
	
	motion1m.pinTrig 	= GPIO_Pin_3;
	motion1m.pinEcho 	= GPIO_Pin_4;
	motion1m.pulseTrig 	= 0;
	motion1m.pulseEcho 	= 0;
	motion1m.pulseDelay = 0;
	motion1m.cm 		= 400;
	motion1m.alarmDistance = 20;
}

void init_MotionSensors(){
	/*motion1.id = 0;
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
	motion2.alarm = 20;*/
	
}

void init_VibrationSensor(){/*
	vibration1.id = 0;
	vibration1.controlbits = 1;
	vibration1.pinDO = GPIO_Pin_2;
	vibration1.pinLamp = GPIO_Pin_0;*/
}

void init_app(){
	init_Timer();	
	init_GPIO_Ports();
	init_Sensors();
	// init_MotionSensors();
	// init_VibrationSensor();
	DebugPrintInit();
}

void alarm(Sensor* sensor) {
	sensor->controlbits |= 1 << 7; 					// Markera att larmet går
	GPIO_SetBits(sensor->port, sensor->pinLamp); 	// Tänd lampa
	// Todo notifiera centralneheten via CAN
}

void main(void){
	init_app();
	Sensor sensors[1] = {motion1};

	while(1){
	// Polling
	// Itererar över alla sensorer
	for(int i = 0; i*sizeof(sensors[0]) < sizeof(sensors); i++){
		// Är sensorn aktiverad och av typen motion? (controlbit 1 && 2)
		if(sensors[i].controlbits & (1 | 1 << 1)){
			MotionSensor* sensor = &sensors[i].motion;
			
			// Är triggfördröjningen klar?
			if(microTicks >= sensor->pulseDelay){  					
				GPIO_SetBits(sensors[i].port, sensor->pinTrig);		// Aktivera triggerpuls
				sensor->pulseTrig  = microTicks + 10; 				// Triggpuls 10µs
				sensor->pulseDelay = microTicks + 60000;			// Fördröjning mellan triggerpulserna, 60ms
			}
			
			// Är trigpulsen klar?
			if(microTicks >= sensor->pulseTrig){ 					
				GPIO_ResetBits(sensors[i].port, sensor->pinTrig);	// Avaktivera triggerpuls
			}
			
			// Är echo hög för första gången?
			if(!(sensors[i].controlbits & (1 << 2)) && GPIO_ReadInputDataBit(sensors[i].port, sensor->pinEcho)){
				sensor->pulseEcho = microTicks; 					// Början av echopulsen.
				sensors[i].controlbits |= 1 << 2;  					// Ettställer kontrollbit 2.
			}
			// Är echo låg för första gången?
			else if (sensors[i].controlbits & (1 << 2) && !GPIO_ReadInputDataBit(sensors[i].port, sensor->pinEcho)) {	
				sensor->cm = (microTicks - sensor->pulseEcho)/58; 	// Tid tills echo kommer tillbaks.
				sensors[i].controlbits &= ~(1 << 2);				// Nollställer kontrollbit 2.
			}
			
			// Upptäcker sensorn något som är för nära?
			if(sensor->cm < sensor->alarmDistance){					
				GPIO_SetBits(sensors[i].port, sensors[i].pinLamp);	// Tänd lampa.
			}
			else{
				GPIO_ResetBits(sensors[i].port, sensors[i].pinLamp);// Släck lampa.
			}
		}
		
		// Är sensorn aktiverad och av typen vibration? (controlbit 1 && !2)
		else if(sensors[i].controlbits & 1 && !sensors[i].controlbits & 1 << 1) {
			VibrationSensor* sensor = &sensors[i].vibration;
			
			if(!GPIO_ReadInputDataBit(sensors[i].port, sensor->pinD0)){
				GPIO_SetBits(sensors[i].port, sensors[i].pinLamp);
			}
			else{
				GPIO_ResetBits(sensors[i].port, sensors[i].pinLamp);
			}
		}
	}
	}
}
