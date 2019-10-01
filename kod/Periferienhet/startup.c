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




can_irq_handler(void){
    //TODO REMOVE
    USARTPrint("In irq handler\n");
    
    if(CAN_GetITStatus(CAN1, CAN_IT_FMP0)) {
        if (CAN_MessagePending(CAN1, CAN_FIFO0)) {
            CanRxMsg rxMsg;
            CAN_Receive(CAN1, CAN_FIFO0, &rxMsg);
            //TODO hantera meddelandet
            
            
            if(rxMsg.StdId==4){
                id = rxMsg.Data[0];
                USARTPrint("Jag tilldelades id: ");
                USARTPrintNum(id);
                USARTPrint("\n");
                requesting_id = 0; //Nollställ flaggan för att sluta begära id
            }
            else{
                USARTPrint("\nNeeeej! rxMsg.StdId: ");
                USARTPrintNum((uint32_t)rxMsg.StdId);
            }
            
        }
    }
}


void main(void) {
    USARTConfig();
    can_init();
    USARTPrint("\nstart periferi\n");
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