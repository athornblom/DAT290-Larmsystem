#include "CAN.h"
#include "USART.h"
#include "misc.h"
#include "printMsg.h"
#include "stm32f4xx_can.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"

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
    printRxMsg(msg, 16);
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