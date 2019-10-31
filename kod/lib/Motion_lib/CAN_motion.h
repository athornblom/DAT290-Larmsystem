#ifndef CAN_MOTION_H
#define CAN_MOTION_H


#include "CAN.h"
#include "CANEncodeDecode.h"
#include "main_motion.h"


uint32_t MD407_ID;
char noID;



/**
 * @brief Tar emot ett id från Centralenheten.
 * 
 */
void idAssign_Handler(CanRxMsg* msg);



/**
 * @brief Hanterar att ta emot konfigurationer för rörelsesenorer från centralenheten
 * 
 * 
 * Byte 0: Typ av sensor, 0 = rörelse, 1 = vibration. (Vid kalibrering = ID).
 * 
 * Byte 1: Är konfigurationen för kalibrering av rörelsesensor? 0 = Nej, 1 = Ja.
 * 
 * Ej kalibrering:
 * 
 * 		Byte 2: Början av indexet till 'sensors' som skall konfigureras.
 * 
 *		Byte 3: Slutet av indexet till 'sensors' som skall konfigureras.
 * 
 * 		Byte 4: Ska sensorerna vara aktiva eller ej? 0 = inaktiv, 1 = aktiv. Ifall Byte[4] = 0 kommer senare bytes ej kollas.
 * 
 * 		Byte 5+6 (Rörelse): 'alarmDistance' i cm, upp till 400 cm. Om Byte[5] >= 400 så kommer 'serAlarmDistance' alltid sättas till 400. 0 = ändra inte värdet.
 * 
 * 		Byte 7: 0 = gör inget, 1 = avlarma
 * 
 * Kalibrering:
 * 
 * 		Byte 2: Indexet till 'sensors' som skall kalibreras.
 * 
 * 		Byte 5+6: Uppmätta värdet från centralenheten.
 */
void CANGetConfig_handler();



/**
 * @brief Begär ett id från Centralenheten. Mainloopen starar ej utan ett id.
 * 
 * 
 */void getId();



/**
 * @brief Initierar en slumptalsgenerator.
 * 
 */
void init_rng();



/**
 * @brief Skickar larm till Centralenheten 
 * 
 */
void alarm(Sensor* sensor);



/**
 * @brief Centralenheten avlarmar sensorn.
 * 
 */
void disarm(Sensor* sensor);


#endif