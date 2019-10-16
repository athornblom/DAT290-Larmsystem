//Periferi

#include "CAN.h"
#include "USART.h"
#include "misc.h"
#include "stm32f4xx_can.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"

CanRxMsg RxMessage;
CanTxMsg TxMessage;

typedef struct{
    unsigned int mac;
    unsigned char id;
    unsigned char num_of_doors;
} Door_device;

uint32_t id;
uint32_t messages_to_send;
uint8_t light;
uint32_t counter;
uint8_t requesting_id = 1;

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void ) {
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

void toggle_light() {
	light = ~light;
}



can_handler(void){
    
    CanRxMsg rxMsg;
    CAN_Receive(CAN1, CAN_FIFO0, &rxMsg);
    
    
    
    id = rxMsg.Data[0];
    USARTPrint("Jag tilldelades id: ");
    USARTPrintNum(id);
    USARTPrint("\n");
    requesting_id = 0; //Nollställ flaggan för att sluta begära id
}


void main(void) {
    USARTConfig();
    can_init();
    USARTPrint("\nGod morgon! Jag ar en periferienhet som inte kan saga a, a och o\n");
    blockingDelayMs(400);
    
    
    
    CANFilter filter;
    CANFilter mask;

    //Används för omvandling
    Header header;

    //Skriver mask
    mask.IDE = 1;
    mask.RTR = 1;
    header.msgType = ~0;
    header.toCentral = ~0;
    header.ID = 0;
    //ingorera msgNum
    header.msgNum = 0;
    HEADERtoUINT32(header, mask.ID);

    //Avaktiverar alla filter
    CANdisableAllFilterHandlers();

    //Filter för ID-tilldelning
    filter.IDE = 1;
    filter.RTR = 0;
    header.msgType = 3;
    header.toCentral = 0;
    header.ID = 0;
    HEADERtoUINT32(header, filter.ID);
    
    
    if (CANhandlerListNotFull()){
        USARTPrint("handler list not full\n");
        uint32_t index = CANaddFilterHandler(can_handler, &filter, &mask);
        USARTPrintNum(index);
    }
    
    
    
    CanTxMsg canMsg;
    uint32_t temp_id = 5;
    
    encode_request_id(&canMsg, temp_id, 0,42,0);
    
    while (requesting_id) {
        
        if (CANsendMessage(&canMsg) == CAN_TxStatus_NoMailBox){
            USARTPrint("no mailbox empty\n");
        }
        else{
            USARTPrint("Skickat id-forfragan\n");
        }
        
        blockingDelayMs(1000);
    }
}