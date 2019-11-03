#include "CAN_motion.h"


uint32_t MD407_ID = 0;
char noID = 1;	// Är 1 så länge enheten ej tilldelats ett id.



// Hanterar larm-ACK.
void alarmAck_Handler(CanRxMsg* msg){
	Header header;
	UINT32toHEADER(msg->ExtId, header);
	sensors[header.msgNum].controlbits &= ~bit7;	// Nollställer bit 7.
}



/**
 * @brief Tar emot ett id från Centralenheten.
 *
 */
void idAssign_Handler(CanRxMsg* msg){
	uint32_t rndID = decode_tempID(msg);
	
	if(rndID == MD407_ID){
		MD407_ID = decode_ID(msg);
		noID = 0;

        //Avaktiverar alla handlers, dvs bara idAssign_Handler
        CANdisableAllFilterHandlers();

        //Aktiverar samma sessionID som skickades i id-tilldelningen
        copySessionID(msg);

        //Aktiverar handler för ack för larm
        activate_larmAck_handler(alarmAck_Handler, MD407_ID);

        //Aktiverar handler för konfigurationsmeddelnaden
        activate_receive_motion_config_handler(CANGetConfig_handler, MD407_ID);
	}
}



/**
 * @brief Hanterar att ta emot konfigurationer för rörelsesenorer från centralenheten
 *
 *
 * Byte 0: Typ av sensor, 0 = rörelse, 1 = vibration. (Vid kalibrering = ID).
 *
 * Byte 1: Är konfigurationen för kalibrering av rörelsesensor? 0 = Nej, 1 = Ja.
 *
 * Ej kalibrering:
 *
 * 		Byte 2: Början av indexet till 'sensors' som skall konfigureras.
 *
 *		Byte 3: Slutet av indexet till 'sensors' som skall konfigureras.
 *
 * 		Byte 4: Ska sensorerna vara aktiva eller ej? 0 = inaktiv, 1 = aktiv. Ifall Byte[4] = 0 kommer senare bytes ej kollas.
 *
 * 		Byte 5+6 (Rörelse): 'alarmDistance' i cm, upp till 400 cm. Om Byte[5] >= 400 så kommer 'serAlarmDistance' alltid sättas till 400. 0 = ändra inte värdet.
 *
 * 		Byte 7: 0 = gör inget, 1 = avlarma
 *
 * Kalibrering:
 *
 * 		Byte 2: Indexet till 'sensors' som skall kalibreras.
 *
 * 		Byte 5+6: Uppmätta värdet från centralenheten.
 */
void CANGetConfig_handler(CanRxMsg* msg) {
	char *data = (char*)&(msg->Data);
	char sensorType = *data;
	char calibration = *(data+1);
	char startIndex = *(data+2);

	// Ska en rörelsesensor kalibreras?
	if (calibration && !(sensorType)) {
		uint16_t* measuredDistance = (uint16_t*)&msg->Data[5];
		MotionSensor* mSensor = &(sensors[startIndex].motion);

		mSensor->multiple = (*measuredDistance)/mSensor->cm;
		
		DebugPrint("\nHej");
		
		CanTxMsg ackMsg;
		encode_ack_msg(&ackMsg, msg);
		CANsendMessage(&ackMsg);
		
		return;
	}


	char endIndex = *(data+3);
	char active = *(data+4);
	char disarmFlag = *(data+7);

	uint16_t* setCentralAlarmDistance = (uint16_t*)&msg->Data[5];
	
	// Rörelsesensorn har endast en räckvidd på 400 cm.
	if(*setCentralAlarmDistance > 400){
		*setCentralAlarmDistance = 400;
	}
	
	uint16_t setLocalAlarmDistance;
	if((*setCentralAlarmDistance)*2 > 400){
		setLocalAlarmDistance = 400;
	}
	else{
		setLocalAlarmDistance = (*setCentralAlarmDistance)*2;
	}


	// Typen rörelsesensor?
	if(!sensorType){
		for(int i = startIndex; i <= endIndex && i >= 0 && i < connectedCounter; i++){
			if(sensorType == (sensors[i].controlbits & bit1)){

				if(active){
					// Går sensorn från inaktiv till aktiv?
					if(!(sensors[i].controlbits & bit2)){
						sensors[i].motion.timeOut = microTicks + 500000;
					}

					sensors[i].controlbits |= bit2;	  // Aktivera sensorn.

					// Är värdet på setAlarmDistance adress nollskillt?
					if(*setCentralAlarmDistance){
						sensors[i].motion.centralAlarmDistance = *setCentralAlarmDistance;
						sensors[i].motion.localAlarmDistance = setLocalAlarmDistance;
					}
				}

				else{
					sensors[i].controlbits &= ~bit2;	// Inaktivera sensorn.
				}
				
				// Ska det avlarmas?
					if(disarmFlag){
						disarm(&(sensors[i]));	// Avlarma
					}
			}
		}
	}

	// Typen vibrationssensor
	else{
		for(int i = startIndex; i <= endIndex && i >= 0 && i < connectedCounter; i++){
			if(sensors[i].controlbits & bit1 && sensors[i].controlbits & bit0){
				if(active){
					sensors[i].controlbits |= bit2;	// Aktivera sensorn.
					
				}

				else{
					sensors[i].controlbits &= ~bit2;	// Inaktivera sensorn.
				}
				
				// Ska det avlarmas?
					if(disarmFlag){
						disarm(&(sensors[i]));	// Avlarma
					}
			}
		}
	}

	CanTxMsg ackMsg;
	encode_ack_msg(&ackMsg, msg);
	CANsendMessage(&ackMsg);

}



/**
 * @brief Initierar en slumptalsgenerator.
 *
 */
void init_rng(){
	RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
    RNG_Cmd(ENABLE);
}



/**
 * @brief Begär ett id från Centralenheten. Mainloopen startar ej utan ett id.
 *
 *
 */
void getId(){
    //Aktiverar handler för mottagen ID-tilldelning
	activate_assignID_handler(idAssign_Handler);

	uint32_t timeOut = microTicks + 60 * 1000000;
	if (RNG_GetFlagStatus(RNG_FLAG_DRDY) == SET &&		//Nytt meddelande finns
		RNG_GetFlagStatus(RNG_FLAG_CECS) == RESET && 	//Inget klockfel
		RNG_GetFlagStatus(RNG_FLAG_SECS) == RESET){ 	//Inget seedfel
		MD407_ID = RNG_GetRandomNumber();
		CanTxMsg idRequest;

		encode_motion_request_id(&idRequest, MD407_ID, nMotionSensors, nVibrationSensors);
		DebugPrint("\nMotion sensors:");
		DebugPrintNum(nMotionSensors);
		DebugPrint("\nVibration sensors:");
		DebugPrintNum(nVibrationSensors);
		while (noID) {
			CANsendMessage(&idRequest);	// Begär ett id från Centralenheten.
			delayMicro(1000000);	// Vänta 1 sekund.
		}
	}
}



/**
 * @brief Skickar larm till Centralenheten
 *
 */
void alarm(Sensor* sensor) {

	sensor->controlbits |= bit6 | bit7;   // Markera att larmet går
	if(sensor->controlbits & bit1){
		GPIO_SetBits(sensor->port, sensor->pinLamp);
	}
	
	DebugPrint("\nLarm sensor ID:");
	DebugPrintNum(sensor->id);

	CanTxMsg msg;
	encode_larm_msg(&msg, MD407_ID, sensor->id);

	CANsendMessage(&msg);
}



/**
 * @brief Centralenheten avlarmar sensorn.
 *
 */
void disarm(Sensor* sensor) {
	sensor->controlbits &= ~bit6; 	// Markera att larmet inte längre går
	if(sensor->controlbits & bit1){
		GPIO_ResetBits(sensor->port, sensor->pinLamp);
	}
}
