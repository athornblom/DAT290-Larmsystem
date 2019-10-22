#include "USART.h"

#include "delay.h"
#include "misc.h"
#include "CAN.h"
#include "printMsg.h"
#include "CANEncodeDecode.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_rng.h"

uint8_t larmAck = 0;
uint8_t counter = 0;

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void ) {
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

void help(uint16_t delay){
    USARTPrintNumBase(delay,10);
    USARTWaitPrint(" ms delay\nx for att toggla on/off\ns/f for att andra delay\np for att toggla tx print\nl for att toggla lyssnare\ne for att skicka ett rnd meddelande\n");
    USARTWaitPrint("c for clear\n1 for larm\n3 for idbegaran\n? for att se denna hjalp\n\n");
}

void msgPrint(CanRxMsg *msg){
    USARTPrint("\n");
    printRxMsg(msg, 16);
}

//Slumpar ett meddelande, RNG måste ha initsieras innan användning
void tryRandomizeCANMsg(CanTxMsg *msg){
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
                    //Ca var 8onde meddelande är remote
                    if (!(rand & 0b1110)){
                        msg->RTR = CAN_RTR_Remote;
                    }
                    //Resten är data. rand skiftas för att inte använda
                    //samma bitar som ovan för att bestämma hur långt
                    else {
                        msg->RTR = CAN_RTR_Data;
                        msg->DLC = (rand >> 4) % 9;
                        for (uint8_t i = 0; i < msg->DLC; i++){
                            msg->Data[i] = ((uint8_t *) &rand)[i%4];
                        }
                    }
    }
}

void sendRnd(uint8_t print){
    static CanTxMsg msg;
    tryRandomizeCANMsg(&msg);
    //Prova att skicka
    if (CANsendMessage(&msg) != CAN_TxStatus_NoMailBox){
        if (print){
            USARTPrint("\n");
            printTxMsg(&msg, 16);
        }
    }
}

//ack handler
void handler_larmAck(CanRxMsg *msg){
    larmAck = 1;
}

void main(void) {
    USARTConfig();
    can_init();
    
    //Initsierar random number generator
    RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
    RNG_Cmd(ENABLE);
    
    uint8_t usartRead;
    uint8_t spammerActive = 0;
    uint16_t delay = 128;
    uint8_t listnerHandlerIndex;
    uint8_t listnerActive = 0;
    uint8_t outputPrint = 1;
    
    USARTPrint("\n");
    help(delay);
    
    while (1) {
        if (USARTGet(&usartRead)){
            if (usartRead == 'x'){
                if(spammerActive){
                    spammerActive = 0;
                    USARTPrint("off\n");
                } else {
                    spammerActive = 1;
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
            
            //Togglar lyssnare
            else if (usartRead == 'l'){
                if (listnerActive){
                    CANdisableFilterHandler(listnerHandlerIndex);
                    USARTPrint("Lyssnare off\n");
                    listnerActive = 0;
                } else {
                    //Matchar allt
                    CANFilter mask = empty_mask;
                    if (CANhandlerListNotFull()){
                        listnerHandlerIndex = CANaddFilterHandler(msgPrint, &mask, &mask);
                        USARTPrint("Lyssnare on\n");
                        listnerActive = 1;
                    }
                }
            }

            //p för att toggla output print
            else if (usartRead == 'p'){
                if (outputPrint){
                    outputPrint = 0;
                    USARTPrint("Tx print off\n");
                } else {
                    outputPrint = 1;
                    USARTPrint("Tx print on\n");
                }
            }
            
            //c för clear
            else if (usartRead == 'c'){
                USARTPrint("\n\n\n\n\n\n\n\n\n\n\n\n");
            }
            
            //e för att skicka ett meddelande
            else if (usartRead == 'e'){
                sendRnd(outputPrint);
            }
            
            //? för hjälp
            else if (usartRead == '?'){
                help(delay);
            }

            //1 för larmmedelande
            else if (usartRead == '1'){
               CanTxMsg msg;
               const uint8_t ID = 0;
               encode_larm_msg(&msg, ID, counter);
               larmAck = 0;

               CANFilter filter = empty_mask;
                CANFilter mask = empty_mask;
                Header header = empty_header;
                
                //Skriver mask
                mask.IDE = 1;
                mask.RTR = 1;
                header.msgType = ~0;
                header.ID = ~0;
                header.toCentral = ~0;
                header.msgNum = ~0;
                HEADERtoUINT32(header, mask.ID);

                //Skriver filter
                filter.IDE = 1;
                filter.RTR = 1;
                header.msgType = larm_msg_type;
                header.ID = ID;
                header.toCentral = 1;
                header.msgNum = counter;
                HEADERtoUINT32(header, filter.ID);

                if (CANhandlerListNotFull()){
                    uint8_t handlerIndex = CANaddFilterHandler(handler_larmAck, &filter, &mask);
                    uint8_t read = 0;
                    while (!larmAck){
                        if (CANsendMessage(&msg) != CAN_TxStatus_NoMailBox){
                            if (outputPrint){
                                USARTPrint("\n");
                                printTxMsg(&msg, 16);
                            }
                        }
                        //Avbryt med q
                        if (USARTGet(&read)){
                            if (read == 'q'){
                                break;
                            }
                        }

                        blockingDelayMs(1000);
                    }
                    CANdisableFilterHandler(handlerIndex);
                    counter++;
                }
            }

            //3 för id begäran
            else if (usartRead == '3'){
               CanTxMsg msg;
               static uint8_t counter;
               static uint32_t rand;
                if (RNG_GetFlagStatus(RNG_FLAG_DRDY) == SET && //Nytt meddelande finns
                 RNG_GetFlagStatus(RNG_FLAG_CECS) == RESET && //Inget klockfel
                 RNG_GetFlagStatus(RNG_FLAG_SECS) == RESET){ //Inget seedfel
                        rand = RNG_GetRandomNumber();
                 }
               encode_door_request_id(&msg, rand, 0x69);
               if (CANsendMessage(&msg) != CAN_TxStatus_NoMailBox){
                    if (outputPrint){
                        USARTPrint("\n");
                        printTxMsg(&msg, 16);
                    }
                }
            }
        }

        if (spammerActive){
            //Ändra fördröjningen för att justera hur mycket snabbt data som skickas
            blockingDelayMs(delay);
            sendRnd(outputPrint);
        }
    }
}