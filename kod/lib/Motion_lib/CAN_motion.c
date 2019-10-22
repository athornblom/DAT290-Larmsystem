#include "CAN_motion.h"


uint32_t id = 0;
char nocid = 1;


/**
 * @brief Hanterar CAN meddelanden
 * 
 * 
 */
void CANMsg_handler() {
	// switch
	
}

/**
 * @brief Hanterar att ta emot konfigurationer för rörelsesenorer från centralenheten
 * 
 * 
 * Byte 0: ID till MD407-kortet.
 * 
 * Byte 1: Typ av sensor, 0 = rörelse, 1 = vibration.
 * 
 * Byte 2: Början av indexet till 'connectedSensors' som skall konfigureras.
 * 
 * Byte 3: Slutet av indexet till 'connectedSensors' som skall konfigureras.
 * 
 * Byte 4: Ska sensorerna vara aktiva eller ej? 0 = inaktiv, 1 = aktiv. Ifall Byte[4] = 0 kommer senare bytes ej kollas.
 * 
 * Byte 5 (Rörelse): Byte[5]*2 = 'alarmDistance' i cm, upp till 400 cm. Om Byte[5] >= 200 så kommer 'alarmDistance' alltid sättas till 400.
 * 
 * Byte 6&7: Används ej.
 */
void CANGetConfig() {
	char data[8]; 	 // todo
	char valid = 0;  // Används för att kolla att konfigurationen är av rätt typ
	
	char ID_Byte = data[0];
	char sensorType = data[1];
	char startIndex = data[2];
	char endIndex = data[3];
	char active = data[4];
	char setAlarmDistance = data[5]*2;
	
	if(ID_Byte == id){
		
		// Typen rörelsesensor
		if(!sensorType){
			for(int i = startIndex; i <= endIndex; i++){
				char index = connectedSensors[i];
				if(sensorType == (sensors[index].controlbits & bit1) && sensors[index].controlbits & bit0){
					if(active){
					sensors[index].controlbits |= bit2;
					sensors[index].motion.alarmDistance = setAlarmDistance;
					}
					else{
						sensors[index].controlbits &= ~bit2;
					}
				}
			}
		}
		
		// Typen vibrationssensor
		else{
			for(int i = startIndex; i <= endIndex; i++){
				char index = connectedSensors[i];
				if(sensorType == (sensors[index].controlbits & bit1) && sensors[index].controlbits & bit0){
					if(active){
					sensors[index].controlbits |= bit2;
					}
					else{
						sensors[index].controlbits &= ~bit2;
					}
				}
			}
		}
	}
}



void idAssign_Handler(CanRxMsg* msg){
		uint32_t rndID = (((uint32_t)msg->Data[0])) | (((uint32_t)msg->Data[1]) << 8) | (((uint32_t)msg->Data[2]) << 16) | (((uint32_t)msg->Data[3]) << 24);
		DebugPrint("\n");
		DebugPrintNumBase(rndID,16);
		if(rndID == id){
			id = msg->Data[4];
			nocid = 0;
			DebugPrint("\n");
			DebugPrint("Rullar som rullatorn\n");

		}
	}

void init_rng(){
	RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
    RNG_Cmd(ENABLE);
}


void getId(){
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


		uint32_t timeStamp = microTicks + 60 * 1000000; 
		if (RNG_GetFlagStatus(RNG_FLAG_DRDY) == SET && //Nytt meddelande finns
            RNG_GetFlagStatus(RNG_FLAG_CECS) == RESET && //Inget klockfel
            RNG_GetFlagStatus(RNG_FLAG_SECS) == RESET){ //Inget seedfel
			id = RNG_GetRandomNumber();
			CanTxMsg idRequest;
					
			encode_motion_request_id(&idRequest, id, nMotionSensors, nVibrationSensors);
			DebugPrint("\n");
			DebugPrintNum(nMotionSensors);
			DebugPrint("\n");
			DebugPrintNum(nVibrationSensors);
			while (microTicks < timeStamp && nocid) {
				CANsendMessage(&idRequest);
				delayMicro(1000000);
			}
		}
}

void alarm(int i) {
	Sensor* sensor = &(sensors[connectedSensors[i]]);
	
	sensor->controlbits |= 1 << 7; 					// Markera att larmet går
	GPIO_SetBits(sensor->port, sensor->pinLamp); 	// Släck lampa
	// Todo notifiera centralneheten via CAN
	
	CanTxMsg msg;
	encode_larm_msg(&msg, id, i);
	
	// Aktiverar handler för larmmeddelande-ACK.
	CANFilter filter = empty_mask;
	CANFilter mask = empty_mask;
	Header header = empty_header;
	
	//Skriver mask
	mask.IDE = 1;
	mask.RTR = 1;
	header.msgType = ~0;
	header.ID = ~0;
	header.toCentral = ~0;
	HEADERtoUINT32(header, mask.ID);

	//Skriver filter
	filter.IDE = 1;
	filter.RTR = 1;
	header.msgType = larm_msg_type;
	header.ID = id;
	header.toCentral = 1;
	HEADERtoUINT32(header, filter.ID);

	// TODO av CAN.
	/*if (CANhandlerListNotFull()){
		CANaddFilterHandler(handler_larmAck, &filter, &mask);	
	}*/
}

void disarm(int i) {
	Sensor* sensor = &(sensors[connectedSensors[i]]);
	
	sensor->controlbits &= ~(1 << 7); 					// Markera att larmet inte längre går
	GPIO_ResetBits(sensor->port, sensor->pinLamp);	
}