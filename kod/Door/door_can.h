#ifndef DOOR_CAN_H_INCLUDED
#define DOOR_CAN_H_INCLUDED
#include "can.h"
#include "CANEncodeDecode.h"
#include "stm32f4xx_rng.h"
#include "stm32f4xx_rcc.h"
#include "startup.h"
#include "functions.h"
/* ^^ these are the include guards */
void init_rng(void);
void getId (int nDoors);
void sendAlarm (char Doorid);
void tryGetId (void);

#endif