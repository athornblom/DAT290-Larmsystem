#ifndef PRINTMSG_H
#define PRINTMSG_H

#include <stdint.h>
#include "stm32f4xx_can.h"

//OBS USART måste vara initierat innan användning av dessa funktioner

//Skriver ut ett rx meddelande  i base base
void printRxMsg(CanRxMsg *msg, uint8_t base);

//Skriver ut ett tx meddelande  i base base
void printTxMsg(CanTxMsg *msg, uint8_t base);

#endif