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
	uint16_t pinD0;								// Pin för vibrationssensorns 'digital output'.
} VibrationSensor;

/**
 * @brief	Struct för alla sensorer
 * @var 	controlbits: Kontrollbitar för diverse användningsområden:
 * 				0: Aktiv eller ej
 * 				1: 0 = Motionssensor, 1 = Vibrationssensor
 * 				2: (Motion) Stigande kant på echo puls mätning, (Vibration) @todo
				3: Sensorn väntar på att ta emot konfiguration ifrån centralenheten
 * 				4-6: @todo
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

// == Globala Variabler ==

// Dessa är konfigurerbara
GPIO_TypeDef* motionPorts[3] 	= {GPIOA, GPIOB, GPIOC};
GPIO_TypeDef* vibrationPorts[2] = {GPIOD, GPIOE};
// todo: ska vi ersätta alla 'GPIO_PIN_n' med 'pins[n]'?
uint16_t pins[16] = {GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3, GPIO_Pin_4, GPIO_Pin_5, GPIO_Pin_6, GPIO_Pin_7, GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11, GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15};

volatile uint32_t microTicks = 0;		 // Variabel för microsekunder.

// Maximalt antal sensorer, använder #define för att kunna använda värden till arrayen 'sensors'.
#define nMaxMotionSensors 	 sizeof(motionPorts)/sizeof(motionPorts[0])*5			// Max 5 sensorer per port
#define nMaxVibrationSensors sizeof(vibrationPorts)/sizeof(vibrationPorts[0])*16	// Max 16 sensorer per port
// Alla sensorer, denna initieras under init_Sensors.
Sensor sensors[nMaxMotionSensors + nMaxVibrationSensors];

void SysTick_Handler(void)  {			 // SysTick interrupt Handler.
	microTicks++;
}

void init_Timer(){
	//Systick
	*((void (**)(void) ) 0x2001C03C ) = SysTick_Handler;
	uint32_t returnCode;
  	returnCode = SysTick_Config(168000000/1000000);      // Konfigurera SysTick att generera avbrott varje mikrosekund 
	if (returnCode) {
		//DebugPrint("SysTick Fail");
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
	// Initiera klockar för alla portar, todo: behöv detta?
	uint32_t portClocks[5] = {RCC_AHB1Periph_GPIOA, RCC_AHB1Periph_GPIOB, RCC_AHB1Periph_GPIOC, RCC_AHB1Periph_GPIOD, RCC_AHB1Periph_GPIOE}; 
	for (int i=0; i*sizeof(portClocks[0]) < sizeof(portClocks); i++) {
		RCC_AHB1PeriphClockCmd(portClocks[i], ENABLE);
	}
	GPIO_InitTypeDef init;
	
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

	for (int i=0; i*sizeof(vibrationPorts[0]) < sizeof(vibrationPorts); i++) {
		// Konfigurerar inportar vibrationssensor
		GPIO_StructInit(&init);
		init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_10 | GPIO_Pin_12 | GPIO_Pin_14; // D0 pinnar
		init.GPIO_Mode = GPIO_Mode_IN;
		init.GPIO_PuPd = GPIO_PuPd_DOWN;
		init.GPIO_Speed = GPIO_Fast_Speed; // 50 Mhz
		GPIO_Init(vibrationPorts[i], &init);
		
		// Konfigurerar utportar vibrationssensor
		GPIO_StructInit(&init);
		init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7 | GPIO_Pin_9 | GPIO_Pin_11 | GPIO_Pin_13 | GPIO_Pin_15; // Lysdiod pinnar
		init.GPIO_Mode = GPIO_Mode_OUT;
		init.GPIO_OType = GPIO_OType_PP;
		init.GPIO_Speed = GPIO_Fast_Speed; // 50 Mhz
		GPIO_Init(vibrationPorts[i], &init);
	}
}
	
void init_MotionSensors(){
	// Iterera genom portarna
	for (int i=0; sizeof(motionPorts[0])*sizeof(motionPorts); i++) {
		// Iterera genom pinnarna
		for (int j=0; sizeof(pins[0])*sizeof(pins);i+=3) {
			//todo
		}
	}
}

void init_VibrationSensor(){
	uint8_t sensorCounter = 0;
	// Iterera genom portarna
	for (int i=0; i*sizeof(vibrationPorts[0]) < sizeof(vibrationPorts); i++) {
		// Iterera genom pinnarna
		for (int j=0; j*sizeof(pins[0]) < sizeof(pins); j += 2) {
			// Är sensorn aktiv?
			if (GPIO_ReadInputDataBit(vibrationPorts[i], pins[j])) {
				VibrationSensor v = {
					.pinD0 = pins[j]
				};
				
				Sensor s = {
					.id 			= 0, // TODO
					.controlbits 	= 1 | (0x1 << 1) | (0x1 << 3),
					/* Bit 0 = 0, Sensorn är ej aktiv (Den har ej tagit emot centralenhets konfiguration än)
					 * Bit 1 = 1, Sensorn är av typen vibration
					 * Bit 2 = 0, används ej
					 * Bit 3 = 1, Sensorn väntar på konfiguration från centralenheten */
					 .port 			= vibrationPorts[i],
					 .pinLamp 		= pins[j+1],
					 .vibration 	= v
					// Resten av structen är tom och fylls på när konfigurationen tas emot från centralenheten */
				};
				// Initiera en sensor i sensors listan efter alla rörelsesensorer
				sensors[nMaxMotionSensors + sensorCounter] = s;
				sensorCounter++;
			}
		}
	}
}

void init_Sensors(){
	init_VibrationSensor();
}

void init_app(){
	DebugPrintInit(); // Todo: ta bort innan slutprodukt

	init_Timer();	
	init_GPIO_Ports();
	init_Sensors();

}

void alarm(Sensor* sensor) {
	sensor->controlbits |= 1 << 7; 					// Markera att larmet går
	GPIO_SetBits(sensor->port, sensor->pinLamp); 	// Tänd lampa
	// Todo notifiera centralneheten via CAN
}

void main(void){
	init_app();
	while(1){
	// Polling
	// Itererar över alla sensorer
	for(int i = 0; i*sizeof(sensors[0]) < sizeof(sensors); i++){
		
		// Är sensorn aktiverad och av typen motion? (controlbit 1 && !2)
		if(sensors[i].controlbits & 1 && !(sensors[i].controlbits & (1 << 1))){
			MotionSensor* sensor = &(sensors[i].motion);
			
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
		
		// Är sensorn aktiverad och av typen vibration? (controlbit 1 && 2)
		else if(sensors[i].controlbits & (1 | 1 << 1)) {
			VibrationSensor* sensor = &(sensors[i].vibration);
			
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
