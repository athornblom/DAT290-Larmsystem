#include "door_can.h"

//======================================== Slumptals generator CAN =========================================
void init_rng(void){
	RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
    RNG_Cmd(ENABLE);
}

void idAssign_Handler(CanRxMsg* msg){
		uint32_t rndid = decode_tempID(msg);
		if(rndid == id){
			id = decode_ID(msg);
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

void sendAlarm (char Doorid){
    CanTxMsg AMsg;
    encode_door_larm_msg(&AMsg,(char) id,Doorid);	
    CANsendMessage(&AMsg);
}