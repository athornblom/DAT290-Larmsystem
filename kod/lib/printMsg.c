#include "printMsg.h"
#include "CAN.h"
#include "USART.h"

void printMsg(CanRxMsg *msg, uint8_t base){
    //Skriver ut ID
    if (msg->IDE == CAN_Id_Standard) {
        USARTPrint("STD ID: \n");
        USARTPrintNumBase(msg->StdId & 0x7FF, base);
    } else {
        USARTPrint("Ext ID: \n");
        USARTPrintNumBase(msg->ExtId & 0x1FFFFFFF, base);
        //Skriver ut header enl vårat protokoll
        Header header;
        UINT32toHEADER(msg->ExtId, header);
        USARTPrint("\nMsg type: ");
        USARTPrintNumBase(header.msgType, base);
        USARTPrint("\nTo central: ");
        USARTPrintNumBase(header.toCentral, base);
        USARTPrint("\nID: ");
        USARTPrintNumBase(header.ID, base);
        USARTPrint("\nSession ID: ");
        USARTPrintNumBase(header.sessionID, base);
        USARTPrint("\nMsg Num: ");
        USARTPrintNumBase(header.msgNum, base);
    }
    USARTPrint("\n");

    if(msg->RTR == CAN_RTR_Remote){
        USARTPrint("Remote frame\n");
    } else if (msg->RTR == CAN_RTR_Data){
            //Förhindrar för stora DLC
            msg->DLC %= 9;
            USARTPrint("Data (");
            USARTPrintNumBase(msg->DLC, base);
            USARTPrint(" bytes): \n");
            for (uint8_t i = msg->DLC ; i > 0; i--){
                USARTPrintNumBase(msg->Data[i -1],base);
                if(i > 1){
                    USARTPrint("-");
                }
            }
    }
    USARTPrint("\n");
}

void printRxMsg(CanRxMsg *msg, uint8_t base){
    USARTPrint("Rx msg:\n");
    printMsg(msg, base);
}

void printTxMsg(CanTxMsg *msg, uint8_t base){
    USARTPrint("Tx msg:\n");
    printMsg((CanRxMsg *)msg, base);
}


