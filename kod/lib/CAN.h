#ifndef CAN_H
#define CAN_H

#define	CAN1_IRQ_VECTOR		(0x2001C000+0x90)
#define __CAN_IRQ_PRIORITY		2

#include "stm32f4xx_can.h"

//För att skicka can meddelande
uint8_t send_can_message(CanTxMsg *msg);

//För att initiera can1
uint8_t can_init();

#endif