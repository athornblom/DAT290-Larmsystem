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

unsigned int id;
unsigned int messages_to_send;
unsigned char light;
unsigned int counter;

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
    USARTPrint("In irq handler*");
    
    if(CAN_GetITStatus(CAN1, CAN_IT_FMP0)) {
        if (CAN_MessagePending(CAN1, CAN_FIFO0)) {
            CanRxMsg rxMsg;
            CAN_Receive(CAN1, CAN_FIFO0, &rxMsg);
            //TODO hantera meddelandet
            
            
            if(rxMsg.StdId==5){
                USARTPrint("*Jag tilldelades id: ");
                USARTPrintNum((rxMsg.Data[0]));
                USARTPrint("**");
            }
            else{
                USARTPrint("*Neeeej**");
            }
            
        }
    }
}


void main(void) {
    USARTConfig();
    can_init();
    USARTPrint("*start periferi*");
    CanTxMsg canMsg;
    uint32_t temp_id = 5;
    
    while (1) {
        
        //code canMsg
        encode_request_id(&canMsg, temp_id);
        canMsg.IDE = CAN_Id_Standard; //Alternativen är CAN_Id_Standard eller FCAN_Id_Extended
        canMsg.RTR = CAN_RTR_Data;
        if (send_can_message(&canMsg) == CAN_TxStatus_NoMailBox){
            USARTPrint("no mailbox empty*");
        }
        else break;
    }
}