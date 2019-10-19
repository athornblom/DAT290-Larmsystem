#ifndef DOOR_CAN_H_INCLUDED
#define DOOR_CAN_H_INCLUDED
#include "stm32f4xx_can.h"
#include "startup.h"
/* ^^ these are the include guards */

/* Prototypes for the functions */
/* Sums two ints */
void idAssign_Handler(CanRxMsg* msg);
void getId (int nDoors);
void sendAlarm (door alarming_door);

#endif