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
	sensors[header.msgNum].controlbits &= ~bit7;
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

        //Aktiverar handler för ack för larm
        activate_larmAck_handler(alarmAck_Handler, MD407_ID);
	}
}

void CANSendMeasurement(Sensor motionSensor) {
	
	while (!motionMeasure(&motionSensor)) {};
	float distance = motionSensor.motion.cm;
	char id = motionSensor.id;
	
	CanTxMsg msg;
	encode_distance_value(&msg, id, distance);
	CANsendMessage(&msg);

}

void calibrationRecieve(char sensorId, float *multiple) {
	sensors[sensorId].motion.multiple = *multiple;
}


/**
 * @brief Hanterar att ta emot konfigurationer för rörelsesenorer från centralenheten
 * 
 * 
 * Byte 0: Typ av sensor, 0 = rörelse, 1 = vibration. (Vid kalibrering = ID).
 * 
 * Byte 1: Början av indexet till 'connectedSensors' som skall konfigureras. (Vid kalibrering: Byte 1-4: Float multipel).
 * 
 * Byte 2: Slutet av indexet till 'connectedSensors' som skall konfigureras.
 * 
 * Byte 3: Ska sensorerna vara aktiva eller ej? 0 = inaktiv, 1 = aktiv. Ifall Byte[3] = 0 kommer senare bytes ej kollas.
 * 
 * Byte 4 (Rörelse): Byte[4]*2 = 'alarmDistance' i cm, upp till 400 cm. Om Byte[4] >= 200 så kommer 'alarmDistance' alltid sättas till 400.
 * 
 * Byte 5-6: Används ej.
 * 
 * Byte 7: Är konfigurationen till kalibrering? 0 = Nej, 1 = Ja, begär mätning, 2 = Ja, skickar multipel
 */
void CANGetConfig_handler(CanRxMsg* msg) {
	char *data = (char*)&(msg->Data);
	char calibration = *(data+7);
	if (calibration == 1) {
		char sensorId = *data;
		CANSendMeasurement(sensors[sensorId]);
		return;
	}
	else if (calibration == 2) {
		char sensorId   = *data;
		float *multiple = (float*)&msg->Data[1];
		calibrationRecieve(sensorId, multiple);
		return;
	}
	
	char sensorType = *data;
	char startIndex = *(data+1);
	char endIndex = *(data+2);
	char active = *(data+3);
	char setAlarmDistance = (*(data+4))*2;
	
	// Typen rörelsesensor
	if(!sensorType){
		for(int i = startIndex; i <= endIndex && i >= 0 && i < connectedCounter; i++){
			if(sensorType == (sensors[i].controlbits & bit1)){
				if(active){
					sensors[i].controlbits |= bit2;
					sensors[i].motion.alarmDistance = setAlarmDistance;
				}
				else{
					sensors[i].controlbits &= ~bit2;
				}
			}
		}
	}
	
	// Typen vibrationssensor
	else{
		for(int i = startIndex; i <= endIndex; i++){
			if(sensorType == (sensors[i].controlbits & bit1) && sensors[i].controlbits & bit0){
				if(active){
					sensors[i].controlbits |= bit2;
				}
				else{
					sensors[i].controlbits &= ~bit2;
				}
			}
		}
	}
	
	CanRxMsg ackMsg;
	//encode_ack_config(&ackMsg, msg);
	//CANsendMessage(&ackMsg);
	
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

void alarm(Sensor* sensor) {
	
	sensor->controlbits |= bit6 | bit7; 			// Markera att larmet går
	GPIO_SetBits(sensor->port, sensor->pinLamp); 	// Släck lampa

	CanTxMsg msg;
	encode_larm_msg(&msg, MD407_ID, sensor->id);

	CANsendMessage(&msg);
}

void disarm(Sensor* sensor) {
	sensor->controlbits &= ~bit6; 					// Markera att larmet inte längre går
	GPIO_ResetBits(sensor->port, sensor->pinLamp);	
}
