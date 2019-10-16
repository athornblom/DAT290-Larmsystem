#include "CAN.h"
#include "USART.h"
#include "misc.h"
#include "stm32f4xx_can.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"

CanRxMsg RxMessage;
CanTxMsg TxMessage;

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void ) {
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}


void msgPrint(CanRxMsg *msg){
    USARTPrint("New msg:\n");
    uint8_t base = 16;

    //Skriver ut ID
    if (msg->IDE == CAN_Id_Standard) {
        USARTPrint("STD ID: \n");
        USARTPrintNumBase(msg->StdId, base);
    } else {
        USARTPrint("Ext ID: \n");
        USARTPrintNumBase(msg->ExtId, base);
    }

    USARTPrint("\nData: \n");
    for (uint8_t i = msg->DLC ; i > 0; i--){
        USARTPrintNumBase(msg->Data[i -1],base);
    }
    USARTPrint("\n\n");
}

void main(void) {
    USARTConfig();
    can_init();
    USARTPrint("\nstart\n");

    uint8_t testIndex;

    //Matchar allt
    CANFilter mask;
    mask.IDE = 0;
    mask.RTR = 0;
    mask.ID =0;

    if (CANhandlerListNotFull()){
        USARTPrint("handler list not full\n");
        testIndex = CANaddFilterHandler(msgPrint, &mask, &mask);
        USARTPrintNum(testIndex);
    }
    

    while (1) {
    }
}