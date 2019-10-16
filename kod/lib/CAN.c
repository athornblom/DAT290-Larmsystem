#include "CAN.h"
#include "misc.h"
#include "stm32f4xx.h"
#include "stm32f4xx_can.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"

//CAN använder Port B pinnarna 8 och 9

#define STDtoEXTLENGTHDIFF 18
#define	CAN1_IRQ_VECTOR		(0x2001C000+0x90)
#define __CAN_IRQ_PRIORITY		2

//Används för omvandla ett filter till uint16_t
typedef union {
    uint16_t u16bits[2];
    CANFilter filter;
} filterUnion;

typedef struct {
    void (*handler)(CanRxMsg *);
    CANFilter filter;
    CANFilter mask;
    FunctionalState state;
} CANFilterHandler;

//Filter handler lista, längd 14 för att vi max kan ha 14 olika
//filter för mottagning av can-meddelanden. Iaf om man använder "Mask mode"
#define HANDLERLISTSIZE 14
CANFilterHandler handlerList[HANDLERLISTSIZE];

//Session ID längd 10
#define SESSIONIDACTIVE 1
#define SESSIONIDINACTIVE 0
uint8_t SessionIDActive;
uint32_t SessionID;

//Kollar om det finns plats i handlerList
//Returnerar 1 om det finns plats, 0 annars
uint8_t CANhandlerListNotFull(void){
    for (uint8_t index = 0; index < HANDLERLISTSIZE; index++){
            if (handlerList[index].state == DISABLE){
                return 1;
            }
    }
    return 0;
}

//Ativerar ett filtet med index från handlerList
void CANactivateFilterHandler (uint8_t index){
            handlerList[index].state = ENABLE;

            //Union för omvandling mellan CANFilter och uint16_t
            filterUnion unionFilter, unionMask;
            unionFilter.filter = handlerList[index].filter;
            unionMask.filter = handlerList[index].mask;

            /* CAN filter init */
            CAN_FilterInitTypeDef CAN_FilterInitStructure;
            CAN_FilterInitStructure.CAN_FilterNumber = index;
            CAN_FilterInitStructure.CAN_FilterMode = CAN_FilterMode_IdMask;
            CAN_FilterInitStructure.CAN_FilterScale = CAN_FilterScale_32bit;
            CAN_FilterInitStructure.CAN_FilterIdHigh = unionFilter.u16bits[1];
            CAN_FilterInitStructure.CAN_FilterIdLow = unionFilter.u16bits[0];
            CAN_FilterInitStructure.CAN_FilterMaskIdHigh = unionMask.u16bits[1];
            CAN_FilterInitStructure.CAN_FilterMaskIdLow = unionMask.u16bits[0];
            CAN_FilterInitStructure.CAN_FilterFIFOAssignment = 0;
            CAN_FilterInitStructure.CAN_FilterActivation = ENABLE;
            CAN_FilterInit(&CAN_FilterInitStructure);
}

//Lägger till ett filter, returnerar index för filtret i handlerList
//Om session ID är aktiverat läggs det automatiskt till i filtret
//Kolla att det finns plats i handlerList innan med handlerListNotFull()
uint8_t CANaddFilterHandler(void (*newHandler)(CanRxMsg *), CANFilter *filter, CANFilter *mask){
    for (uint8_t index = 0; index < HANDLERLISTSIZE; index++){
        if (handlerList[index].state == DISABLE){
            //Aktiverar session ID om det är aktivt
            if (SessionIDActive == SESSIONIDACTIVE){
                //Används för omvandling och tilldeling av sessionID
                Header header;

                //Alla meddelanden med sessionID aktivt måste vara extended
                filter->IDE = 1;
                mask->IDE = 1;

                //Skriver sessionID
                UINT32toHEADER(filter->ID, header);
                header.sessionID = SessionID;
                HEADERtoUINT32(header, filter->ID);

                //Skriver sessionID masken
                UINT32toHEADER(mask->ID, header);
                header.sessionID = ~0;
                HEADERtoUINT32(header, mask->ID);
            }

            handlerList[index].filter = *filter;
            handlerList[index].mask = *mask;
            handlerList[index].handler = newHandler;

            //Aktiverar filtret
            CANactivateFilterHandler(index);

            return index;
        }
    }

    //Detta händer bara om man inte kollat så det finns plats innan man lägger till filtret.
    //Skulle man sedan avaktivera filtret med denna index så händer ingenting, se CANdisableFilterHandler.
    return HANDLERLISTSIZE;
}

//Avaktiverar CANFilterHandler med index index från handlerList
void CANdisableFilterHandler(uint8_t index){
    if (index < HANDLERLISTSIZE){
        handlerList[index].state = DISABLE;

        //Avaktiverar filtret
        CAN_FilterInitTypeDef CAN_FilterInitStructure;
        CAN_FilterInitStructure.CAN_FilterNumber = index;
        CAN_FilterInitStructure.CAN_FilterFIFOAssignment = 0;
        CAN_FilterInitStructure.CAN_FilterActivation = DISABLE;
        CAN_FilterInit(&CAN_FilterInitStructure);
    }
}

//Avaktiverar alla CANFilterHandlers
void CANdisableAllFilterHandlers(void){
    for (uint8_t index = 0; index < HANDLERLISTSIZE; index++){
        CANdisableFilterHandler(index);
    }
}

//Skickar ett CAN-meddelande
//Omvandlar till extended om det inte redan är det samt session ID är aktivt
//Returnderar numret för mailboxen som används eller CAN_TxStatus_NoMailBox om det misslyckades
uint8_t CANsendMessage(CanTxMsg *msg){
    //Justerar endas medelandet om sessionID är aktivt
    if (SessionIDActive == SESSIONIDACTIVE){
        //Används för omvandling och tilldeling av session ID
        Header header;

        //Om standardmeddelande omvandla till extended
        if (msg->IDE == CAN_Id_Standard){
            msg->IDE = CAN_Id_Extended;

            //Skriver sessionID
            UINT32toHEADER(msg->StdId << STDtoEXTLENGTHDIFF, header);
            header.sessionID = SessionID;
            HEADERtoUINT32(header, msg->ExtId);
        }

        //Annars om det redan är ett meddelande med extended ID
        //justeras endast sessionsbitarna om sessions ID är aktivt
        else if (msg->IDE == CAN_Id_Extended){
            UINT32toHEADER(msg->ExtId, header);
            header.sessionID = SessionID;
            HEADERtoUINT32(header, msg->ExtId);
        }
    }

	return CAN_Transmit(CAN1, msg);
}

//Avbrottshanterare för mottagna meddelanden på FIFO 0.
//Anropar meddelandes hanteringsfunktion.
void can_irq_handler(void){
    //Kollar FIFO 0 pending Interrupt
    if(CAN_GetITStatus(CAN1, CAN_IT_FMP0)) {
        //Kollar så att det finns meddelande som väntar i FIFO0
        if (CAN_MessagePending(CAN1, CAN_FIFO0)) {
            //Läser meddelandet
            CanRxMsg rxMsg;
            CAN_Receive(CAN1, CAN_FIFO0, &rxMsg);

            //Anropar hanteringsfunktionen för meddelandet
            if (rxMsg.FMI < HANDLERLISTSIZE){
                if (handlerList[rxMsg.FMI].state == ENABLE){
                    handlerList[rxMsg.FMI].handler(&rxMsg);
                }
            }
        }
    }
}

//Sätter session ID,  ändra även session ID för aktiva filter
//Använder de första 10 bitarna av ID
void setSessionId(uint16_t ID){
    SessionIDActive = SESSIONIDACTIVE;
    SessionID = ID;

    for (uint8_t index = 0; index < HANDLERLISTSIZE; index++){
        //Justerar filter som är aktiva
        if(handlerList[index].state == ENABLE){
            //Används för omvandling
            Header header;

            //Filtrer och masken måste vara av typ extended
            handlerList[index].filter.IDE = 1;
            handlerList[index].mask.IDE = 1;

            //Ändrar filter
            UINT32toHEADER(handlerList[index].filter.ID, header);
            header.sessionID = SessionID;
            HEADERtoUINT32(header, handlerList[index].filter.ID);

            //Ändrar masken
            UINT32toHEADER(handlerList[index].mask.ID, header);
            header.sessionID = ~0;
            HEADERtoUINT32(header, handlerList[index].mask.ID);

            CANactivateFilterHandler(index);
        }
    }
}

//Avaktiverar session ID för aktiva filter och kommande filter
void noSessionId(void){
    SessionIDActive = SESSIONIDINACTIVE;

    for (uint8_t index = 0; index < HANDLERLISTSIZE; index++){
        //Avaktiverar filtering för sessionID på de aktiva filtren
        if(handlerList[index].state == ENABLE){
            //Används för omvandling
            Header header;

            UINT32toHEADER(handlerList[index].mask.ID, header);
            header.sessionID  = 0;
            HEADERtoUINT32(header, handlerList[index].mask.ID);
            CANactivateFilterHandler(index);
        }
    }
}

uint8_t can_init() {
	CAN_InitTypeDef CAN_InitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;
	GPIO_InitTypeDef GPIO_InitStructure;

	RCC_APB1PeriphClockCmd(RCC_APB1Periph_CAN1, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);

	// Connect CAN pins to AF9. See more below
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource9, GPIO_AF_CAN1);
    GPIO_PinAFConfig(GPIOB, GPIO_PinSource8, GPIO_AF_CAN1);  

	// Configure CAN RX and TX pins
	// See page 41 of MD407 reference manual
	// Connect CAN1 pins to AF
    // PB9 - CAN1 TX
    // PB8 - CAN1 RX
    GPIO_PinAFConfig(GPIOB, GPIO_PinSource9, GPIO_AF_CAN1);  	
    GPIO_PinAFConfig(GPIOB, GPIO_PinSource8, GPIO_AF_CAN1);  

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);	

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;	
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_OType = GPIO_Mode_IN;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;	
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);
    
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);	

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5;	
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_OType = GPIO_Mode_IN;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;	
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	NVIC_InitStructure.NVIC_IRQChannel = CAN1_RX0_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = __CAN_IRQ_PRIORITY;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x2;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);

	/* CAN register init */
	CAN_DeInit(CAN1);

	/* CAN cell init */
	CAN_InitStructure.CAN_TTCM = DISABLE; // time-triggered communication mode = DISABLED
    CAN_InitStructure.CAN_ABOM = DISABLE; // automatic bus-off management mode = DISABLED
    CAN_InitStructure.CAN_AWUM = DISABLE; // automatic wake-up mode = DISABLED
    CAN_InitStructure.CAN_NART = DISABLE; // non-automatic retransmission mode = DISABLED
    CAN_InitStructure.CAN_RFLM = DISABLE; // receive FIFO locked mode = DISABLED
    CAN_InitStructure.CAN_TXFP = DISABLE; // transmit FIFO priority = DISABLED
    CAN_InitStructure.CAN_Mode = CAN_Mode_Normal; // normal CAN mode

	/* CAN Baudrate = 1 MBps (CAN clocked at 30 MHz) */
	CAN_InitStructure.CAN_BS1 = CAN_BS1_3tq;
	CAN_InitStructure.CAN_BS2 = CAN_BS2_4tq;
	CAN_InitStructure.CAN_Prescaler = 7;

    //Avaktiverar alla filter
    CANdisableAllFilterHandlers();

	uint8_t can_init_status = CAN_Init(CAN1, &CAN_InitStructure);

	*((void (**)(void) ) CAN1_IRQ_VECTOR ) = can_irq_handler;
	// We need the following function because it's not equivalent to what NVIC_Init does with respect
	// to IRQ priority. Which seems bananas to me...
    NVIC_SetPriority( CAN1_RX0_IRQn, __CAN_IRQ_PRIORITY);
	CAN_ITConfig(CAN1, CAN_IT_FMP0, ENABLE);

    //Avaktiverar Session ID
    noSessionId();

	return can_init_status;
}

uint8_t encode_door_time_config(CanTxMsg *msg, uint32_t time0, uint32_t time1){
    uint8_t *data_pointer =  &(msg->Data);
    
    msg->DLC = 8;
    
    //De två tidsvärdena skrivs in i bytearrayen för data
    *data_pointer = time0;
    *(data_pointer + 4) = time1;
    
    return 1;
}

uint8_t handle_door_time_msg(CanRxMsg *msg) {
    uint32_t time0, time1;
    uint8_t *data_pointer =  &(msg->Data);
    
    time0 = *data_pointer;
    time1 = *(data_pointer + 4);
    
    //TODO: Gör grejer med tiderna
}

/*
 * CanTxMsg *msg: förslagsvis tomt meddeleande som görs till id-förfrågan
 * uint32_t temp_id: temporärt, förslagsvis slumpgenererat id
 * uint8_t device_type: 0 för dörrenhet, 1 för rörelseenhet
 * uint8_t value_0: antal dörrar eller avståndssensorer
 * uint8_t value_1: antal vibrationssensorer
 */
uint8_t encode_request_id(CanTxMsg *msg, uint32_t temp_id, uint8_t device_type, uint8_t value_0, uint8_t value_1){
    uint8_t *data_pointer =  &(msg->Data);
    
    msg->StdId = 0b10110000000;
    msg->DLC = 7;
    
    msg->IDE = CAN_Id_Standard; //Alternativen är CAN_Id_Standard eller FCAN_Id_Extended
    msg->RTR = CAN_RTR_Data;
    
    //Id skrivs in i bytearrayen för data
    *data_pointer = temp_id;
    *(data_pointer + 4) = device_type;
    *(data_pointer + 5) = value_0;
    *(data_pointer + 6) = value_1;
    
}

uint8_t encode_assign_id(CanTxMsg *msg, uint8_t id){
    uint8_t *data_pointer =  &(msg->Data);
    
    msg->StdId = 0b10000000000;
    msg->DLC = 2;
    
    msg->IDE = CAN_Id_Standard; //Alternativen är CAN_Id_Standard eller FCAN_Id_Extended
    msg->RTR = CAN_RTR_Data;
    
    //Id skrivs in i bytearrayen för data
    *data_pointer = id;
}

uint8_t handle_recieve_id_msg(CanRxMsg *msg) {
    uint16_t id;
    uint8_t *data_pointer =  &(msg->Data);
    
    id = *data_pointer;
    
    //TODO: Gör grejer med id
}

uint8_t encode_distance_config(CanTxMsg *msg, uint32_t dist){
    uint8_t *data_pointer =  &(msg->Data);
    
    msg->DLC = 4;
    
    //Avstånd skrivs in i bytearrayen för data
    *data_pointer = dist;
}

