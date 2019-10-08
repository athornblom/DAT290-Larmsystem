#ifndef CAN_H
#define CAN_H

#include "stm32f4xx.h"
#include "stm32f4xx_can.h"

//Strukt för att beskriva bitfördelningen vid ett 32 bitars filter
//med bitmask. Se sida 1071 i ReferenceManual RM0090
//Denna stuktur fungerar både som filter och mask
typedef struct {
    //En bit oanvänd
    uint32_t __unused : 1;

    //0 för data 1 för remote
    uint32_t RTR : 1;

    //0 för standard 1 för extended
    uint32_t IDE : 1;

    uint32_t EXDID : 18;
    uint32_t STDID : 11;
} CANFilter;

//Används för omvandla ett filter till uint16_t
typedef union {
    uint16_t u16bits[2];
    CANFilter filter;
} filterUnion;

//För att skicka can meddelande
uint8_t send_can_message(CanTxMsg *msg);

//Kollar om det finns plats i handlerList
//Returnerar 1 om det finns plats, 0 annars
uint8_t CANhandlerListNotFull(void);

//Lägger till en CANFilterHandler, returnerar index för newFilter i handlerList
//Kolla att det finns plats i handlerList innan med handlerListNotFull();
uint8_t CANaddFilterHandler(void (*newHandler)(CanRxMsg *), CANFilter *filter, CANFilter *mask);

//Avaktiverar CANFilterHandler med index index från handlerList
void CANdisableFilterHandler(uint8_t index);

//Avaktiverar alla CANFilterHandlers
void CANdisableAllFilterHandlers(void);

//För att initiera can1
uint8_t can_init();

#endif