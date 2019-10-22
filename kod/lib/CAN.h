#ifndef CAN_H
#define CAN_H

//CAN använder Port B pinnarna 8 och 9

#include "stm32f4xx.h"
#include "stm32f4xx_can.h"

//Omvandling mellan uint32 och Header. Kan inte vara vanliga funktioner
//för att vi ska kunna använde tillsammans med bit fields.
#define HEADERtoUINT32(header, filterID) (filterID) = (*(uint32_t *)& (header));
#define UINT32toHEADER(filterID, header) *((uint32_t *)&(header)) = (uint32_t)(filterID);

#define empty_header {0, 0, 0, 0, 0, 0};
//msb
#define full_header {~0, ~0, ~0, ~0, ~0, 0};
#define default_header {0, 0, ~0, ~0, ~0, 0};
#define empty_mask {0, 0, 0, 0};
#define empty_filter empty_mask
#define full_mask {0, ~0, ~0, ~0};
#define full_filter full_mask

//Struktur som beskriver våran ID-uppdelning
typedef struct  {
    //8 bitar för meddelandenummer. Används för att tala om vilket meddelande man bekräftar med ack.
    uint32_t msgNum : 8;

    //10 bitar för session ID. Gemensam för alla enheter under en session
    //Sätts automatiskt sköts automatiskt mha setSessionId och CANsendMessage
    uint32_t sessionID : 10;

    //7 bitar för ID. Om riktning är till centralenheten är bitarna sändarens ID.
    //Om riktningen är från centralenheten beskriver bitarna mot-tagarens ID.
    uint32_t ID : 7;

    //En bit för meddelandets riktning
    //1 om mottagaren är centralenheten, 0 annars
    uint32_t toCentral : 1;

    //De 3 mest signifikanta bitarna beskriver meddelandetyp
    uint32_t msgType: 3;

    //3 oanvända bitar
    uint32_t _unused__ : 3;
} Header;

//Strukt för att beskriva bitfördelningen vid ett 32 bitars filter
//med bitmask. Se sida 1071 i ReferenceManual RM0090
//Denna stuktur fungerar både som filter och mask
typedef struct {
    //En bit oanvänd
    uint32_t __unused__ : 1;

    //0 för data 1 för remote
    uint32_t RTR : 1;

    //0 för standard 1 för extended
    uint32_t IDE : 1;

    uint32_t ID : 29;
} CANFilter;

//Skickar ett CAN-meddelande
//Omvandlar till extended om det inte redan är det samt session ID är aktivt
//Returnderar numret för mailboxen som används eller CAN_TxStatus_NoMailBox om det misslyckades
uint8_t CANsendMessage(CanTxMsg *msg);

//Kollar om det finns plats i handlerList
//Returnerar 1 om det finns plats, 0 annars
uint8_t CANhandlerListNotFull(void);

//Lägger till ett filter, returnerar index för filtret i handlerList
//Om session ID är aktiverat läggs det automatiskt till i filtret
//Kolla att det finns plats i handlerList innan med handlerListNotFull()
uint8_t CANaddFilterHandler(void (*newHandler)(CanRxMsg *), CANFilter *filter, CANFilter *mask);

//Avaktiverar CANFilterHandler med index index från handlerList
void CANdisableFilterHandler(uint8_t index);

//Avaktiverar alla CANFilterHandlers
void CANdisableAllFilterHandlers(void);

//Sätter session ID,  ändra även session ID för aktiva filter
//Använder de första 10 bitarna av ID
void setSessionId(uint16_t ID);

//Avaktiverar session ID för aktiva filter och kommande filter
void noSessionId(void);

//För att initiera can1
uint8_t can_init();

#endif