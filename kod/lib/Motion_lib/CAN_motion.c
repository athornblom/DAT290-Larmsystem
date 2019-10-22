#include "CAN_motion.h"


/**
 * @brief Hanterar CAN meddelanden
 * 
 * 
 */
void CANMsg_handler() {
	// switch
	
}

void CANSendMeasurement(Sensor motionSensor) {
	while (!motionMeasure(&motionSensor)) {};
	char distance = motionSensor.motion.cm;
}

/**
 * @brief Hanterar att ta emot konfigurationer för rörelsesenorer från centralenheten
 * 
 * 
 * Byte 0: 	 ID_Byte
 * 		Bit 0-2: 	Porten, 0 -> GPIOA, 1 -> GPIOB, etc.
 * 		Bit 7: 		Typ av sensor, 0 = rörelse, 1 = vibration.
 * 
 * Byte 1-2:	 Används ej
 * 
 * Byte 3-7: (Rörelse) 		Bytes med konfiguration för rörelsesensorer. n:e byten är till n-3:e sensorn på porten, byte 3 -> sensor 0, byte 4 -> sensor 1, etc.
 * 		Bit 0-6: 	'alarmDistance' / 5
 * 		Bit 7: 		Aktiv eller ej
 * 
 * Byte 7:   (Vibration) 	Byte med konfiguration för vibrationssensorer, n:e biten är till n:e sensorn på porten, bit 0 -> sensor 0, bit 1 -> sensor 1, etc.
 * 		Biten representerar ifall sensorn är aktiv
 */
void CANGetConfig() {
	char data[8]; 	 // todo
	char valid = 0;  // Används för att kolla att konfigurationen är av rätt typ
	
	char ID_Byte = data[0];
	char p = ID_Byte & (bit0 | bit1 | bit2);  // 3 minst signifikanta bitarna representerar portsiffran.
	
	// Vibrationsensor
	if (ID_Byte & bit7) {
		// Kolla ifall porten som skickats faktiskt är av typen vibration
		for (int i=0; i*sizeof(vibrationPorts[0]) < sizeof(vibrationPorts); i++) {
			if (ports[p] == vibrationPorts[i]) {
				valid = 1;
				p = i;	//
				break;
			}
		}
		// Finns ej vibrationssensorer på porten
		if (!valid) {
			return;
		}
		char configurationByte = data[7];
		for (int i=0; i < 8; i++) {
			// Sensorn finns inte
			if(!sensors[nMaxMotionSensors + i + p*8].controlbits & bit0) {
				return;
			}
			// Sätter 'aktiv' biten
			if(configurationByte & bits[i])
				sensors[nMaxMotionSensors + p*8 + i].controlbits |= bit2;
			else
				sensors[nMaxMotionSensors + p*8 + i].controlbits &= 0xFF - bit2;
		}
	}
	// Rörelsesensor
	else {
		for (int i=0; i*sizeof(motionPorts[0]) < sizeof(motionPorts); i++) {
			if (ports[p] == motionPorts[i]) {
				valid = 1;
			}
		}
		if (!valid) {
			return;
		}
		for (int i=0; i < 5; i++) {
			// Sensorn finns inte
			if(!sensors[i + p*5].controlbits & bit0) {
				return;
			}
			
			char configurationByte = data[i+3]; 										// Aktuella konfigurationsbyten
			sensors[i+p*5].motion.alarmDistance = (configurationByte&(0xFF - bit7))*5; 	// 7 minst signifikanta bitarna är 'alarmDistance'/5
			// Sätter 'aktiv' biten
			if(configurationByte & bit7)
				sensors[i+p*5].controlbits |= bit2;
			else
				sensors[i+p*5].controlbits &= 0xFF - bit2;
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


	uint32_t timeOut = microTicks + 60 * 1000000; 
	if (RNG_GetFlagStatus(RNG_FLAG_DRDY) == SET &&		//Nytt meddelande finns
		RNG_GetFlagStatus(RNG_FLAG_CECS) == RESET && 	//Inget klockfel
		RNG_GetFlagStatus(RNG_FLAG_SECS) == RESET){ 	//Inget seedfel
		id = RNG_GetRandomNumber();
		CanTxMsg idRequest;
				
		encode_motion_request_id(&idRequest, id, nMotionSensors, nVibrationSensors);
		DebugPrint("\nnMotionsensors:");
		DebugPrintNum(nMotionSensors);
		DebugPrint("\nnVibrationsensors");
		DebugPrintNum(nVibrationSensors);
		while (microTicks < timeOut && nocid) {
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