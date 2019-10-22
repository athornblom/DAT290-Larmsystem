#include "door_can.h"

//======================================== Slumptals generator CAN =========================================
//funktion som generar ett 32bitars slumptal
void init_rng(void){
	RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
    RNG_Cmd(ENABLE);
}
// funktion som genererar avbrott när centralenheten skicakr tillbaka ett id
void idAssign_Handler(CanRxMsg* msg){
		uint32_t rndid = decode_tempID(msg);
		if(rndid == id){
			id = decode_ID(msg);
			nocid = 0;
            //Aktiverar samma sessionID som skickades i id-tilldelningen
            copySessionID(msg);
		}
	}
//funktion som förfrågar efter ett id 
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


    int timeStamp = msTicks + 30 * 10000; 
    if (RNG_GetFlagStatus(RNG_FLAG_DRDY) == SET && //Nytt meddelande finns
        RNG_GetFlagStatus(RNG_FLAG_CECS) == RESET && //Inget klockfel
        RNG_GetFlagStatus(RNG_FLAG_SECS) == RESET){ //Inget seedfel
            id = RNG_GetRandomNumber();
            CanTxMsg idRequest;
            
            encode_door_request_id(&idRequest,id,nDoors);
            while (msTicks < timeStamp && nocid)
            {
                CANsendMessage(&idRequest);
                delay(10000);
            }
        }
}

//funktion för att skicka larm till centralenheten.
void sendAlarm (char Doorid){
    CanTxMsg AMsg;
    encode_larm_msg(&AMsg,(char) id,Doorid);	
    CANsendMessage(&AMsg);
}