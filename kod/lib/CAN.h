#ifndef CAN_H
#define CAN_H

//CAN använder Port B pinnarna 8 och 9

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

//Struktur för omvandling mellan STDID och våran ID-uppdelning
    typedef struct  {
        //Padding för att hamna rätt i STDID
        uint32_t __unused : 21;

        //De 3 mest signifikanta bitarna beskriver meddelandetyp
        uint8_t msgType : 3;

        //En bit för meddelandets riktning
        //1 om mottagaren är centralenheten, 0 annars
        uint8_t toCentral : 1;

        //7 bitar för ID. Om riktning är till centralenheten är bitarna sändarens ID.
        //Om riktningen är från centralenheten beskriver bitarna mot-tagarens ID.
        uint8_t ID : 7;
    } Header;

//Union för själva omvandlingen
typedef union {
    Header header;
    uint32_t STDID;
} STDIDtoHeader;

//Skickar ett meddelande med extended ID oavsett hur msg ser ut.
uint8_t CANsendMessage(CanTxMsg *msg);

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

//Sätter session ID,  ändra även session ID för aktiva filter
//Använder de första 18 bitarna av ID
void setSessionId(uint32_t ID);

//Avaktiverar session ID för aktiva filter och kommande filter
void noSessionId(void);

//För att initiera can1
uint8_t can_init();

#endif