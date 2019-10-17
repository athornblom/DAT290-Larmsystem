#include "USART.h"

#include "delay.h"
#include "misc.h"
#include "CAN.h"
#include "printMsg.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_rng.h"

uint8_t tryRandomizeCANMsg(CanTxMsg *msg);

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void ) {
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

void main(void) {
    USARTConfig();
    can_init();
    
    //Initsierar random number generator
    RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
    RNG_Cmd(ENABLE);
    
    CanTxMsg canMsg;
    uint8_t usartRead;
    uint8_t active = 0;
    uint16_t delay = 128;

    USARTPrint("\nStarar med ");
    USARTPrintNumBase(delay,10);
    USARTPrint(" ms delay\nAnvand x for att toggle on/off\nAnvand s/f for att andra delay\n");
                    
    while (1) {
        if (USARTGet(&usartRead)){
            if (usartRead == 'x'){
                if(active){
                    active = 0;
                    USARTPrint("off\n");
                } else {
                    active = 1;
                    USARTPrint("on\n");
                }
            }
            //Minskar spamhastigheten 's' som i slower
            else if (usartRead == 's'){
                delay = delay == (1 << 11) ? delay : (delay << 1);
                USARTPrintNumBase(delay,10);
                USARTPrint(" ms delay\n");
            }

            //Ökar spamhastigheten 'f' som i faster
            else if (usartRead == 'f'){
                delay = delay == 1 ? 1 : (delay >> 1);
                USARTPrintNumBase(delay,10);
                USARTPrint(" ms delay\n");
            }
        }

        if (active){
            //Ändra fördröjningen för att justera hur mycket snabbt data som skickas
            blockingDelayMs(delay);

            tryRandomizeCANMsg(&canMsg);

            //Prova att skicka
            if (CANsendMessage(&canMsg) != CAN_TxStatus_NoMailBox){
                USARTPrint("Msg sent:\n");
                printTxMsg(&canMsg, 16);
            } else {
                USARTPrint("no mailbox empty\n");
            }
        }
    }
}

//Slumpar ett meddelande, RNG måste ha initsieras innan användning
uint8_t tryRandomizeCANMsg(CanTxMsg *msg){
    //kollar om vi kan hämta ett nytt slumptal
     if (RNG_GetFlagStatus(RNG_FLAG_DRDY) == SET && //Nytt meddelande finns
             RNG_GetFlagStatus(RNG_FLAG_CECS) == RESET && //Inget klockfel
             RNG_GetFlagStatus(RNG_FLAG_SECS) == RESET){ //Inget seedfel
                    uint32_t rand = RNG_GetRandomNumber();
                    //skriv meddelande
                    if (rand & 1){
                        msg->IDE = CAN_Id_Standard;
                        msg->StdId = rand & 0x7FF;
                    } else {
                        msg->IDE = CAN_Id_Extended;
                        msg->ExtId = rand & 0x1FFFFFFF;
                    }
                    msg->RTR = CAN_RTR_Data;
                    msg->DLC = rand % 9;
                    for (uint8_t i = 0; i < msg->DLC; i++){
                        msg->Data[i] = ((uint8_t *) &rand)[i%4];
                    }

                    return 1;
    }
    return 0;
}