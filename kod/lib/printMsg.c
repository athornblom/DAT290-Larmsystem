#include "printMsg.h"
#include "CAN.h"
#include "USART.h"

void printRxMsg(CanRxMsg *msg, uint8_t base){
    USARTPrint("Rx msg:\n");

    //Skriver ut ID
    if (msg->IDE == CAN_Id_Standard) {
        USARTPrint("STD ID: \n");
        USARTPrintNumBase(msg->StdId & 0x7FF, base);
    } else {
        USARTPrint("Ext ID: \n");
        USARTPrintNumBase(msg->ExtId & 0x1FFFFFFF, base);
    }
    //Förhindrar för stora DLC
    msg->DLC %= 9;
    USARTPrint("\nData (");
    USARTPrintNumBase(msg->DLC, base);
    USARTPrint(" bytes): \n");
    for (uint8_t i = msg->DLC ; i > 0; i--){
        USARTPrintNumBase(msg->Data[i -1],base);
        if(i > 1){
            USARTPrint("-");
        }
    }
    USARTPrint("\n\n");
}

void printTxMsg(CanTxMsg *msg, uint8_t base){
    printRxMsg((CanRxMsg *)msg, base);
}


