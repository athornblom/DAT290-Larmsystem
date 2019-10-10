#include "CAN.h"
#include "misc.h"
#include "stm32f4xx_can.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"

#define	CAN1_IRQ_VECTOR		(0x2001C000+0x90)
#define __CAN_IRQ_PRIORITY		2

typedef struct {
    void (*handler)(CanRxMsg *);
    FunctionalState state;
} CANFilterHandler;

//Filter handler lista, längd 14 för att vi max kan ha 14 olika
//filter för mottagning av can-meddelanden. Iaf om man använder "Mask mode"
#define HANDLERLISTSIZE 14
CANFilterHandler handlerList[HANDLERLISTSIZE];

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

//Lägger till en CANFilterHandler, returnerar index för newFilter i handlerList
//Kolla att det finns plats i handlerList innan med handlerListNotFull();
uint8_t CANaddFilterHandler(void (*newHandler)(CanRxMsg *), CANFilter *filter, CANFilter *mask){
    for (uint8_t index = 0; index < HANDLERLISTSIZE; index++){
        if (handlerList[index].state == DISABLE){
            handlerList[index].state = ENABLE;
            handlerList[index].handler = newHandler;

            //Union för omvandling mellan CANFilter och uint16_t
            filterUnion unionFilter, unionMask;
            unionFilter.filter = *filter;
            unionMask.filter = *mask;

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

            return index;
        }
    }

    //Detta händer bara om man inte kollat så det finns plats innan kulle man avaktivera
    //filter med denna index så händer ingenting se CANdisableFilterHandler.
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
        handlerList[index].state = DISABLE;
    }
}

uint8_t send_can_message(CanTxMsg *msg){
	return CAN_Transmit(CAN1, msg);
}

void can_irq_handler(void){
    if(CAN_GetITStatus(CAN1, CAN_IT_FMP0)) {
        if (CAN_MessagePending(CAN1, CAN_FIFO0)) {
            CanRxMsg rxMsg;
            CAN_Receive(CAN1, CAN_FIFO0, &rxMsg);

            if (rxMsg.FMI < HANDLERLISTSIZE){
                if (handlerList[rxMsg.FMI].state == ENABLE){
                    handlerList[rxMsg.FMI].handler(&rxMsg);
                }
            }
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
    for (uint8_t index = 0; index < HANDLERLISTSIZE; index++){
        CANdisableFilterHandler(index);
    }

	uint8_t can_init_status = CAN_Init(CAN1, &CAN_InitStructure);

	*((void (**)(void) ) CAN1_IRQ_VECTOR ) = can_irq_handler;
	// We need the following function because it's not equivalent to what NVIC_Init does with respect
	// to IRQ priority. Which seems bananas to me...
    NVIC_SetPriority( CAN1_RX0_IRQn, __CAN_IRQ_PRIORITY);
	CAN_ITConfig(CAN1, CAN_IT_FMP0, ENABLE);
	
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

