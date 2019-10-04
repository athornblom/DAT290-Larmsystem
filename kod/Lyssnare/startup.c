//Centralenhet

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
    USARTPrint("new msg:\n");
    USARTPrintNumBase(msg->StdId,16);
    USARTPrint("\n");
    for (uint8_t i = 0; i < msg->DLC; i++){
        USARTPrintNumBase(msg->Data[i],16);
    }
    USARTPrint("\n\n");
}

void main(void) {
    USARTConfig();
    can_init();
    USARTPrint("start\n");
    CanTxMsg canMsg;
    uint8_t USARTmsg;
    
    CANFilter testFilter;
    testFilter.STDID = 0;
    testFilter.EXDID = 0;
    testFilter.IDE = 0;
    testFilter.RTR = 0;
    uint8_t testIndex;
    
    CANFilter testMask;
    testMask.STDID = 0;
    testMask.EXDID = 0;
    testMask.IDE = 0;
    testMask.RTR = 0;
    
    filterUnion test;
    test.filter = testFilter;
    USARTPrint("filter\n");
    USARTPrintNumBase(test.u16bits[1], 2);
    USARTPrint("-");
    USARTPrintNumBase(test.u16bits[0], 2);
    USARTPrint("\n");
    
    test.filter = testMask;
    USARTPrint("mask\n");
    USARTPrintNumBase(test.u16bits[1], 2);
    USARTPrint("-");
    USARTPrintNumBase(test.u16bits[0], 2);
    USARTPrint("\n");
    
    if (CANhandlerListNotFull()){
        USARTPrint("handler list not full\n");
        testIndex = CANaddFilterHandler(msgPrint, &testFilter, &testMask);
        USARTPrintNum(testIndex);
    }
    

    while (1) {
        
    }
}