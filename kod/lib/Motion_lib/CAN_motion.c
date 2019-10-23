#include "CAN_motion.h"


uint32_t MD407_ID = 0;
char noID = 1;


/**
 * @brief Hanterar CAN meddelanden
 * 
 * 
 */
void CANMsg_Handler() {
	// switch
	
}


void alarmAck_Handler(CanRxMsg* msg){
	Header header;
	UINT32toHEADER(msg->ExtId, header);
	sensors[connectedSensors[header.msgNum]].controlbits &= ~bit7;
}


void idAssign_Handler(CanRxMsg* msg){
	uint32_t rndID = decode_tempID(msg);
	DebugPrint("\nrndID:");
	DebugPrintNumBase(rndID,16);
	if(rndID == MD407_ID){
		MD407_ID = decode_ID(msg);
		noID = 0;
        //Aktiverar samma sessionID som skickades i id-tilldelningen
        copySessionID(msg);
	}
}


void CANSendMeasurement(Sensor motionSensor) {
	while (!motionMeasure(&motionSensor)) {};
	char distance = motionSensor.motion.cm;
	char id = motionSensor.id;
}

void CANGetCalibration() {
	char data[8];
	char id = data[0];
	float multiple = data[1];
	
	sensors[id].motion.multiple = multiple;
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
	
	if(ID_Byte == MD407_ID){
		
		// Typen rörelsesensor
		if(!sensorType){
			for(int i = startIndex; i <= endIndex && i >= 0 && i < connectedCounter; i++){
				char index = connectedSensors[i];
				if(sensorType == (sensors[index].controlbits & bit1)){
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


	uint32_t timeOut = microTicks + 60 * 1000000; 
	if (RNG_GetFlagStatus(RNG_FLAG_DRDY) == SET &&		//Nytt meddelande finns
		RNG_GetFlagStatus(RNG_FLAG_CECS) == RESET && 	//Inget klockfel
		RNG_GetFlagStatus(RNG_FLAG_SECS) == RESET){ 	//Inget seedfel
		MD407_ID = RNG_GetRandomNumber();
		CanTxMsg idRequest;
				
		encode_motion_request_id(&idRequest, MD407_ID, nMotionSensors, nVibrationSensors);
		DebugPrint("\nnMotionsensors:");
		DebugPrintNum(nMotionSensors);
		DebugPrint("\nnVibrationsensors:");
		DebugPrintNum(nVibrationSensors);
		while (noID) {
			CANsendMessage(&idRequest);
			delayMicro(1000000);
		}
	}
}

void alarm(int i) {
	Sensor* sensor = &(sensors[connectedSensors[i]]);
	
	sensor->controlbits |= bit6 | bit7; 			// Markera att larmet går
	GPIO_SetBits(sensor->port, sensor->pinLamp); 	// Släck lampa
	// Todo notifiera centralneheten via CAN
	
	CanTxMsg msg;
	encode_larm_msg(&msg, MD407_ID, i);
	
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
	header.ID = MD407_ID;
	header.toCentral = 1;
	HEADERtoUINT32(header, filter.ID);

	if (CANhandlerListNotFull()){
		CANaddFilterHandler(alarmAck_Handler, &filter, &mask);	
	}
	
	CANsendMessage(&msg);
}

void disarm(int i) {
	Sensor* sensor = &(sensors[connectedSensors[i]]);
	
	sensor->controlbits &= ~bit6; 					// Markera att larmet inte längre går
	GPIO_ResetBits(sensor->port, sensor->pinLamp);	
}
