#ifndef MAIN_MOTION_H
#define MAIN_MOTION_H

#define DEBUG

#include <stdio.h>
#include "string.h"
#include "stm32f4xx_gpio.h"
#include "core_cm4.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_rng.h"
#include "USARTDebug.h"
#include "misc.h"
#include "SysTick_motion.h"

#define bit0 1
#define bit1 (1 << 1)
#define bit2 (1 << 2)
#define bit3 (1 << 3)
#define bit4 (1 << 4)
#define bit5 (1 << 5)
#define bit6 (1 << 6)
#define bit7 (1 << 7)



// Struct för motionsensorer
typedef struct MotionSensors {
	uint16_t pinTrig, pinEcho;	// Pinnar för trig, echo t.ex GPIO_Pin_4, GPIO_Pin_5.
	uint32_t pulseTrig, pulseEcho, pulseDelay, timeOut;	  // Längd på triggerpuls(10µs), tid tills pulsen kommer tillbaks, fördröjning mellan pulser och timeOut ifall sensorn blir ifrånkopplad under drift.
	float cm, multiple, centralAlarmDistance, localAlarmDistance;	// Avstånd till föremål samt centralt- och lokaltlarmavstånd, multipel av avstånded för kalibrering. 
} MotionSensor;



//	Struct för vibrationssensor
typedef struct VibrationSensors{
	uint16_t pinDO;								// Pin för vibrationssensorns 'digital output'.
} VibrationSensor;

/**
 * @brief	Struct för alla sensorer
 * @var 	controlbits: Kontrollbitar för diverse användningsområden:
 * 				0: Finns en sensor?
 * 				1: 0 = Motionssensor, 1 = Vibrationssensor
 * 				2: Aktiv eller ej?
 * 				3: (Motion) Stigande kant på echo puls mätning
 * 				4-5: @todo
 *				6: Sensorn larmar
 *				7: Har centralenheten fått larmet?
 * @var		VibrationSensor: struct av vibrationssensor med vibrationssensor konfiguration. (pinDO)
 * @var		MotionSensor: struct av motionsensor med motionssensor konfiguration. (pinTrig, pinEcho, pulseTrig, pulseEcho, pulseDelay, cm, alarm)
 */
typedef struct Sensors {
	char 			id, controlbits;	// ID och 8 kontrollbitar
	
	GPIO_TypeDef*	port;				// Porten sensorn är kopplad till
	uint16_t 		pinLamp;			// Pin för lysdiod för sensorn
	
	uint32_t		alarmDelay;			// Fördröjning mellan att skicka larm
	
	VibrationSensor vibration;
	MotionSensor 	motion;
} Sensor;


// =============================== Globala Variabler ================================================================

GPIO_TypeDef* ports[5];

// Dessa är konfigurerbara
GPIO_TypeDef* motionPorts[3];
GPIO_TypeDef* vibrationPorts[2];

// Maximalt antal sensorer, använder #define för att kunna använda värden till arrayen 'sensors'.
#define nMaxMotionSensors 	 sizeof(motionPorts)/sizeof(motionPorts[0])*5			// Max 5 sensorer per port
#define nMaxVibrationSensors sizeof(vibrationPorts)/sizeof(vibrationPorts[0])*8		// Max 8 sensorer per port



// Alla sensorer, denna initieras under init_Sensors.
Sensor sensors[nMaxMotionSensors + nMaxVibrationSensors];	// Array för max antalet sensorer.
Sensor initMotionSensors[nMaxMotionSensors];	// Lista som används i början vid initiering av rörelsesensorerna.

char connectedCounter;	// Antalet inkopplade sensorer.

uint8_t nMotionSensors;		// Antalet rörelsesensorer kopplade till MD407-kortet.
uint8_t nVibrationSensors;	// Antalet vibrationssensorer kopplade till MD407-kortet.


uint16_t GPIO_Pins[16];	// Array för alla pins.

//===================================================================================================================

/**
 * @brief Pollingfunktion för att pinga & mäta distans.
 * @param Rörelsesensor.
 */
char motionMeasure(Sensor *sensor);


#endif