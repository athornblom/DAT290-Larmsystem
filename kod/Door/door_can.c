//====================================================================================
// Everything with can should be here for the door
//====================================================================================
#include "door_can.h"
#include "can.h"
#include "CANEncode.h"
#include "stm32f4xx_rng.h"
#include "stm32f4xx_rcc.h"
#include "globalVar.h"


//======================================== Slumptals generator CAN =========================================
void init_rng(void){
	RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
    RNG_Cmd(ENABLE);
}


void idAssign_Handler(CanRxMsg* msg){
		uint32_t rndid = *(uint32_t *)(&(msg->Data[0]));
		if(rndid == id){
			id = msg->Data[1];
			nocid = 0;

		}
	}

void getId (int nDoors){
    CANFilter filter = empty_mask;
    CANFilter mask = empty_mask;

    //används för omvandling
    Header header = empty_header;

    //skriver mask
    mask.IDE = 1;
    mask.RTR = 1;
    header.msgType = ~0;
    header.ID = ~0;
    header.toCentral = ~0;
    HEADERtoUINT32(header, mask.ID);

    //Skriver filter
    filter.IDE = 1;
    filter.RTR = 0;
    header.msgType = assignID_msg_type;
    header.ID = 0;
    header.toCentral = 0;
    HEADERtoUINT32(header, filter.ID);

    if (CANhandlerListNotFull()){
        CANaddFilterHandler(idAssign_Handler, &filter, &mask);
    }


    int timeStamp = msTicks + 60 * 1000; 
    if (RNG_GetFlagStatus(RNG_FLAG_DRDY) == SET && //Nytt meddelande finns
            RNG_GetFlagStatus(RNG_FLAG_CECS) == RESET && //Inget klockfel
            RNG_GetFlagStatus(RNG_FLAG_SECS) == RESET){ //Inget seedfel
                id = RNG_GetRandomNumber();
                CanTxMsg idRequest;
                
                encode_request_id(&idRequest,id,0, nDoors, 69);
                while (msTicks < timeStamp && nocid)
                {
                    CANsendMessage(&idRequest);
                    delay(1000);
                }
            }
}

void sendAlarm (door alarming_door){
    CanTxMsg testMsg = {
                        0, 0x4, CAN_Id_Extended, CAN_RTR_DATA, 4, {0xa,0xb,0xc,1} 
                    };
                    CANsendMessage(&testMsg);
}