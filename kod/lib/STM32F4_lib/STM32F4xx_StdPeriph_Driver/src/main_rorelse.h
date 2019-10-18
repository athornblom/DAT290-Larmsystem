#ifndef MAIN_RORELSE_H
#define MAIN_RORELSE_H

#define bit0 1
#define bit1 (1 << 1)
#define bit2 (1 << 2)
#define bit3 (1 << 3)
#define bit4 (1 << 4)
#define bit5 (1 << 5)
#define bit6 (1 << 6)
#define bit7 (1 << 7)

// Maximalt antal sensorer, använder #define för att kunna använda värden till arrayen 'sensors'.
#define nMaxMotionSensors 	 sizeof(motionPorts)/sizeof(motionPorts[0])*5			// Max 5 sensorer per port
#define nMaxVibrationSensors sizeof(vibrationPorts)/sizeof(vibrationPorts[0])*8		// Max 8 sensorer per port


// Struct för motionsensorer
typedef struct MotionSensors {
	uint16_t pinTrig, pinEcho;					// Pinnar för trig, echo t.ex GPIO_Pin_4, GPIO_Pin_5.
	uint32_t pulseTrig, pulseEcho, pulseDelay;	// Längd på triggerpuls(10µs), tid tills pulsen kommer tillbaks och fördröjning mellan pulser.
	float cm, alarmDistance; 					// Avstånd till föremål och larmavstånd.
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
 * 				4-6: @todo
 *				7: Sensorn larmar
 * @var		VibrationSensor: struct av vibrationssensor med vibrationssensor konfiguration. (pinDO)
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


uint16_t GPIO_Pins[] = {
	GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3, GPIO_Pin_4, GPIO_Pin_5,
	GPIO_Pin_6, GPIO_Pin_7, GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
	GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15};



#endif