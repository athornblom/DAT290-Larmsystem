#ifndef CAN_MOTION_H
#define CAN_MOTION_H


#include "CAN.h"
#include "CANEncodeDecode.h"
#include "main_motion.h"


uint32_t MD407_ID;
char noID;



// Hanterar larm-ACK.
void alarmAck_Handler(CanRxMsg* msg);



// Hanterar ID:et från centralenheten.
void idAssign_Handler(CanRxMsg* msg);



// Hanterar att ta emot konfigurationer för rörelsesenorer från centralenheten.
void CANGetConfig();



// Begär ett ID från centralenheten. Mainloopen startar ej utan ID.
void getId();



// Initierar en slumptalsgenerator.
void init_rng();



// Larmar centralenheten.
void alarm(Sensor* sensor);



// Avlarmar en sensor
void disarm(Sensor* sensor);


#endif