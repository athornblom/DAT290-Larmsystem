#include "CANEncodeDecode.h"
#include "misc.h"
#include "CAN.h"
#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"


uint8_t encode_door_config(CanTxMsg *msg, uint8_t id, uint8_t door_id_0, uint8_t door_id_1, uint16_t time_0, uint16_t time_1, uint8_t locked){
    if(door_id_0 > door_id_1 || door_id_1 > 31){
        return 0;
    }
    
    uint8_t *data_pointer =  (uint8_t*)&(msg->Data);
    
    
    Header header = empty_header;
    header.msgType = conf_msg_type;
    header.toCentral = 0;
    header.ID = id;
    HEADERtoUINT32(header, msg->ExtId);
    
    msg->DLC = door_config_msg_length;
    msg->IDE = CAN_Id_Extended;
    msg->RTR = CAN_RTR_Data;
    
    //Dörrintervall skrivs till de 16 första databitarna
    *data_pointer = door_id_0;
    *(data_pointer + 1) = door_id_1;
    
    
    //De två tidsvärdena skrivs till bit 16-47
    *(data_pointer + 2) = time_0 >> 8;
    *(data_pointer + 3) = time_0;
    *(data_pointer + 4) = time_1 >> 8;
    *(data_pointer + 5) = time_1;
    
    //Låsflagga skrivs till bit 48-55
    *(data_pointer + 6) = locked;
    
    return 1;
}

uint8_t encode_motion_config(CanTxMsg *msg, uint8_t id, uint8_t sensor_type, uint8_t calibration, uint8_t sensor_id_0, uint8_t sensor_id_1, uint8_t active, uint16_t distance, uint8_t disArm){
    Header header = empty_header;
    header.msgType = conf_msg_type;
    header.toCentral = 0;
    header.ID = id;
    HEADERtoUINT32(header, msg->ExtId);
    
    msg->DLC = motion_config_msg_length;
    msg->IDE = CAN_Id_Extended;
    msg->RTR = CAN_RTR_Data;
    
    
    msg->Data[0] = sensor_type;
    msg->Data[1] = calibration;
    
    msg->Data[2] = sensor_id_0;
    msg->Data[3] = sensor_id_1;
    
    msg->Data[4] = active;
    
    msg->Data[5] = distance;
    msg->Data[6] = distance << 8;
    
    msg->Data[7] = 0;
}

uint8_t encode_distance_value(CanTxMsg *msg, uint8_t sensor_id, uint8_t distance){
    uint8_t *data_pointer = (uint8_t*)&(msg->Data);
    
    
    Header header = empty_header;
    header.msgType = conf_msg_type;
    header.toCentral = 1;
    HEADERtoUINT32(header, msg->ExtId);
    
    msg->DLC = 2;
    msg->IDE = CAN_Id_Extended;
    msg->RTR = CAN_RTR_Data;
    
    
    *data_pointer = sensor_id;
    
    *(data_pointer + 1) = distance;
}

/*
 * CanTxMsg *msg: förslagsvis tomt meddeleande som görs till id-förfrågan
 * uint32_t temp_id: temporärt, förslagsvis slumpgenererat id
 * uint8_t device_type: 0 för dörrenhet, 1 för rörelseenhet
 * uint8_t value_0: antal dörrar eller rörelsesensorer
 * uint8_t value_1: antal vibrationssensorer
 */
void encode_request_id(CanTxMsg *msg, uint32_t temp_id, uint8_t device_type, uint8_t value_0, uint8_t value_1){
    Header header = empty_header;
    header.msgType = reqID_msg_type;
    header.toCentral = 1;
    HEADERtoUINT32(header, msg->ExtId);

    msg->DLC = reqID_msg_length;
    msg->IDE = CAN_Id_Extended;
    msg->RTR = CAN_RTR_Data;
    
    //Id skrivs in i bytearrayen för data
    msg->Data[0] = (uint8_t)temp_id;
    msg->Data[1] = (uint8_t)(temp_id >> 8);
    msg->Data[2] = (uint8_t)(temp_id >> 16);
    msg->Data[3] = (uint8_t)(temp_id >> 24);

    msg->Data[4] = device_type;
    msg->Data[5] = value_0;
    msg->Data[6] = value_1;
}

/*
 *  * skapar meddelnade för IDbegäran för dörr
 * CanTxMsg *msg: förslagsvis tomt meddeleande som görs till id-förfrågan
 * uint32_t temp_id: temporärt, förslagsvis slumpgenererat id
 * uint32_t tmpID slumptal för idbegäran
 * uint8_t nDoors: antal dörrar
 */
void encode_door_request_id(CanTxMsg *msg, uint32_t tmpID, uint8_t nDoors){
    encode_request_id(msg,tmpID,door_unit,nDoors,0);
}

/*
 * skapar meddelande för idbegäran rörelse
 * CanTxMsg *msg: förslagsvis tomt meddeleande som görs till id-förfrågan
 * uint32_t temp_id: temporärt, förslagsvis slumpgenererat id
 * uint32_t tmpID slumptal för idbegäran
 * uint8_t nMotion: antal rörelsesensorer
 * uint8_t nvib: antalet vibrationssensorer
 */
void encode_motion_request_id(CanTxMsg *msg, uint32_t tmpID, uint8_t nMotion, uint8_t nVib){
    encode_request_id(msg, tmpID, motion_unit, nMotion, nVib);
}

/*Encodar en id-tilldelning
msg är en pekare till meddelande som ska skickas
request är en pekare till förfrågan
id är id man tilldelar enheten
Returnerar 1 om det lyckade 0 annars*/
uint8_t encode_assign_id(CanTxMsg *msg, CanRxMsg *request, uint8_t id){
    //Kollar så längden av request stämmer för idReq
    if (request->DLC == reqID_msg_length){
        Header header = empty_header;
        header.msgType = assignID_msg_type;
        header.toCentral = 0;
        HEADERtoUINT32(header, msg->ExtId);

        msg->DLC = assignID_msg_length;
        msg->IDE = CAN_Id_Extended;
        msg->RTR = CAN_RTR_Data;

        //Första 4 bytes är slumptalet från förfrågan
       msg->Data[0] = request->Data[0];
       msg->Data[1] = request->Data[1];
       msg->Data[2] = request->Data[2];
       msg->Data[3] = request->Data[3];

        //Id skickas i andra byten
        msg->Data[4] = id;

        return 1;
    }
    return 0;
}



/*Encodar ett larmmeddelande
msg är en pekare till meddelandet som ska skickas
unitID är enhetens egna ID
id är idt till sensorn som larmar 
För rörelseenheten ligger ID för rörelse och vibrationssensorer efter varandra.
första röresesensorerna har ID 0 sista ID är antalet rörelsesensorer -1
Första vibrationssensorn har ID antal rörelsesensorer och sista antalt rörelsesensorer +
antalet vibrationssensorer - 1*/
void encode_larm_msg(CanTxMsg *msg, uint8_t uinitID, uint8_t id){
    Header header = empty_header;
    header.msgType = larm_msg_type;
    header.ID = uinitID;
    header.toCentral = 1;
    //msgNum är givarens index. används när vi sedan ackar
    //och periferienheten då vet vilket id acket är för
    header.msgNum = id;
    HEADERtoUINT32(header, msg->ExtId);

    msg->DLC = larm_msg_length;
    msg->IDE = CAN_Id_Extended;
    msg->RTR = CAN_RTR_Data;

    msg->Data[0] = id;
}

/*Encodar ackmeddelande
ackMsg är en pekare till meddelandet som ska skickas
recievedMsg är en pekare till meddelandet som ska ackas*/
void encode_ack_msg(CanTxMsg *ackMsg, CanRxMsg *recievedMsg){
    ackMsg->ExtId = recievedMsg->ExtId;
    ackMsg->DLC = recievedMsg->DLC;
    ackMsg->RTR = CAN_RTR_Remote;
    ackMsg->IDE = CAN_Id_Extended;
}

uint8_t decode_door_config_msg(CanRxMsg *msg, uint8_t *door_id_0, uint8_t *door_id_1, uint16_t *time_0, uint16_t *time_1, uint8_t *locked) {
    *door_id_0 = msg->Data[0];
    *door_id_1 = msg->Data[1];
    
    *time_0 = msg->Data[2] | (msg->Data[3] << 8);
    *time_1 = msg->Data[4] | (msg->Data[5] << 8);
    
    *locked = msg->Data[6];

    return 1;
}

//Returnerar tempID ur ett ID-tilldelnings-meddelande eller id-begäran
//Filtrering av header och datalängd måste redan ha gjorts
uint32_t decode_tempID(CanRxMsg *msg){
    return (((uint32_t)msg->Data[0])) | (((uint32_t)msg->Data[1]) << 8) | (((uint32_t)msg->Data[2]) << 16) | (((uint32_t)msg->Data[3]) << 24);
}

//Returnerar ID ur ett ID-tilldelnings-meddelande
//Filtrering av header, datalängd och rätt tempID måste redan ha gjorts
uint8_t decode_ID(CanRxMsg *msg){
    return msg->Data[4];
}

//Returnerar antalet dörrar i en idbegäran
uint8_t decode_doorNum(CanRxMsg *msg){
    return msg->Data[5];
}

//Returnerar enhetstypen i en idbegäran
uint8_t decode_deviceType(CanRxMsg *msg){
    return msg->Data[4];
}

//Returnerar antalet rörelsesensorer i en idbegäran
uint8_t decode_motionSensNum(CanRxMsg *msg){
    return msg->Data[5];
}

//Returnerar antalet vibrationssensorer i en idbegäran
uint8_t decode_vibSensNum(CanRxMsg *msg){
    return msg->Data[6];
}

//Aktiverar handler för mottagning av id-tilldelning
//returnerar 1 om det lyckad 0 annars
uint8_t activate_assignID_handler(void (*handler)(CanRxMsg *)){
	CANFilter filter = empty_mask;
	CANFilter mask = empty_mask;
	Header header = empty_header;

	//skriver mask
	mask.IDE = 1;
	mask.RTR = 1;
    mask.DLC = ~0;
	header.msgType = ~0;
	header.ID = ~0;
	header.toCentral = ~0;
	HEADERtoUINT32(header, mask.ID);

	//Skriver filter
	filter.IDE = 1;
	filter.RTR = 0;
    filter.DLC = assignID_msg_length;
	header.msgType = assignID_msg_type;
	header.ID = 0;
	header.toCentral = 0;
	HEADERtoUINT32(header, filter.ID);

	if (CANhandlerListNotFull()){
		CANaddFilterHandler(handler, &filter, &mask);
        return 1;
	}

    return 0;
}

//Aktiverar handler för mottagning av larm-ack
//ID är enehetens ID
//returnerar 1 om det lyckad 0 annars
uint8_t activate_larmAck_handler(void (*handler)(CanRxMsg *), uint8_t ID){
	CANFilter filter = empty_mask;
	CANFilter mask = empty_mask;
	Header header = empty_header;
	
	//Skriver mask
	mask.IDE = 1;
	mask.RTR = 1;
    mask.DLC = ~0;
	header.msgType = ~0;
	header.ID = ~0;
	header.toCentral = ~0;
	HEADERtoUINT32(header, mask.ID);

	//Skriver filter
	filter.IDE = 1;
	filter.RTR = 1;
    filter.DLC = larm_msg_length;
	header.msgType = larm_msg_type;
	header.ID = ID;
	header.toCentral = 1;
	HEADERtoUINT32(header, filter.ID);

	if (CANhandlerListNotFull()){
		CANaddFilterHandler(handler, &filter, &mask);
        return 1;
	}

    return 0;
}

//Aktiverar handler för mottagning av konfiguration dörrenhet
//ID är enehetens ID
//returnerar 1 om det lyckad 0 annars
uint8_t activate_receive_door_config_handler (void (*handler)(CanRxMsg*), uint8_t ID){
    CANFilter filter = empty_mask;
    CANFilter mask = empty_mask;

    //används för omvandling
    Header header = empty_header;

    //skriver mask
    mask.IDE = 1;
    mask.RTR = 1;
    mask.DLC = ~0;
    header.msgType = ~0;
    header.ID = ~0;
    header.toCentral = ~0;
    HEADERtoUINT32(header, mask.ID);

    //Skriver filter
    filter.IDE = 1;
    filter.RTR = 0;
    filter.DLC = door_config_msg_length;
    header.msgType = conf_msg_type;
    header.ID = ID;
    header.toCentral = 0;
    HEADERtoUINT32(header, filter.ID);

    if (CANhandlerListNotFull()){
        CANaddFilterHandler(handler, &filter, &mask);
        return 1;
    }
    return 0;
}

//Aktiverar handler för mottagning av konfiguration för rörelseenhet
//ID är enehetens ID
//returnerar 1 om det lyckad 0 annars
uint8_t activate_receive_motion_config_handler (void (*handler)(CanRxMsg*), uint8_t ID){
    CANFilter filter = empty_mask;
    CANFilter mask = empty_mask;

    //används för omvandling
    Header header = empty_header;

    //skriver mask
    mask.IDE = 1;
    mask.RTR = 1;
    mask.DLC = ~0;
    header.msgType = ~0;
    header.ID = ~0;
    header.toCentral = ~0;
    HEADERtoUINT32(header, mask.ID);

    //Skriver filter
    filter.IDE = 1;
    filter.RTR = 0;
    filter.DLC = motion_config_msg_length;
    header.msgType = conf_msg_type;
    header.ID = ID;
    header.toCentral = 0;
    HEADERtoUINT32(header, filter.ID);

    if (CANhandlerListNotFull()){
        CANaddFilterHandler(handler, &filter, &mask);
        return 1;
    }
    return 0;
}