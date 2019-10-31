#include "door_can.h"

//======================================== Slumptals generator CAN =========================================
//funktion som generar ett 32bitars slumptal
void init_rng(void){
	RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
    RNG_Cmd(ENABLE);
}

//handler för ack för larmmedelande
void alarmAck_Handler(CanRxMsg* msg){
	Header header;
	UINT32toHEADER(msg->ExtId, header);
	doors[header.msgNum].controlbits |= 2;
}

void receiveConfig_handler(CanRxMsg* msg){
    uint8_t *door_id_0, *door_id_1, *locked;
    uint16_t *time_0, *time_1;
    //Tolkar meddelandet och skriver värden till pekarna
    decode_door_config_msg(msg, door_id_0, door_id_1, time_0, time_1, locked);
    
    for (int i = *door_id_0; i <= *door_id_1; i++)
    {
        doors[i].time_larm = *time_0;
        doors[i].time_central_larm = *time_1;
        if(*locked){
            doors[i].controlbits |= 4;
        }
        else{
            doors[i].controlbits &= ~4;
        }
    }
	CanTxMsg ackMsg;
	encode_ack_msg(&ackMsg, msg);
	CANsendMessage(&ackMsg);
	
}

// funktion som genererar avbrott när centralenheten skicakr tillbaka ett id
void idAssign_Handler(CanRxMsg* msg){
		uint32_t rndid = decode_tempID(msg);
		if(rndid == id){
			id = decode_ID(msg);
			nocid = 0;
            //Avaktiverar alla handlers, dvs bara idAssign_Handler
            CANdisableAllFilterHandlers();
            
            //Aktiverar samma sessionID som skickades i id-tilldelningen
            copySessionID(msg);

            //Aktiverar handler för ack för larm
            activate_larmAck_handler(alarmAck_Handler, id);
            
            //Aktiverar handler för konfigurationsmeddelnaden
            activate_receiveConfig_handler(receiveConfig_handler, id);
		}
	}
//funktion som förfrågar efter ett id 
void getId (int nDoors){
    //Aktiverar handler för mottagen ID-tilldelning
    activate_assignID_handler(idAssign_Handler);

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
                delay(1000);
            }
        }
}

//funktion för att skicka larm till centralenheten.
void sendAlarm (char Doorid){
    CanTxMsg AMsg;
    encode_larm_msg(&AMsg,(char) id,Doorid);	
    CANsendMessage(&AMsg);

}




