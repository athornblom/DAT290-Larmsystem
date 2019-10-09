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
    blockingDelayMs(800);
    
    
    USARTPrint("In irq handler\n");
    
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
    USARTPrint("\nstart periferi\n");
    
    
    
    CANFilter filter;
    filter.STDID = 0b10000000000;
    filter.EXDID = 0;
    filter.IDE = 0;
    filter.RTR = 0;
    uint8_t index;
    
    CANFilter mask;
    mask.STDID = 0b11111111111;
    mask.EXDID = 0;
    mask.IDE = 0;
    mask.RTR = 0;
    
    filterUnion test;
    test.filter = filter;
    USARTPrint("filter\n");
    USARTPrintNumBase(test.u16bits[1], 2);
    USARTPrint("-");
    USARTPrintNumBase(test.u16bits[0], 2);
    USARTPrint("\n");
    
    test.filter = mask;
    USARTPrint("mask\n");
    USARTPrintNumBase(test.u16bits[1], 2);
    USARTPrint("-");
    USARTPrintNumBase(test.u16bits[0], 2);
    USARTPrint("\n");
    
    if (CANhandlerListNotFull()){
        USARTPrint("handler list not full\n");
        index = CANaddFilterHandler(can_handler, &filter, &mask);
        USARTPrintNum(index);
    }
    
    
    
    CanTxMsg canMsg;
    uint32_t temp_id = 5;
    
    encode_request_id(&canMsg, temp_id);
    
    while (requesting_id) {
        
        if (send_can_message(&canMsg) == CAN_TxStatus_NoMailBox){
            USARTPrint("no mailbox empty\n");
        }
        else{
            USARTPrint("Skickat id-forfragan\n");
        }
        
        blockingDelayMs(1000);
    }
}