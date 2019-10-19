#include "CANEncodeDecode.h"
#include "misc.h"
#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"


uint8_t encode_door_time_config(CanTxMsg *msg, uint8_t to_central, uint8_t door_id_0, uint8_t door_id_1, uint16_t time_0, uint16_t time_1, uint8_t locked){
    if(door_id_0 > door_id_1 || door_id_1 > 31){
        return 0;
    }
    
    uint8_t *data_pointer =  &(msg->Data);
    
    
    Header header = empty_header;
    header.msgType = 2;
    header.toCentral = to_central;
    HEADERtoUINT32(header, msg->ExtId);
    
    msg->DLC = 7;
    msg->IDE = CAN_Id_Extended;
    msg->RTR = CAN_RTR_Data;
    
    //Dörrintervall skrivs till de 16 första databitarna
    *data_pointer = door_id_0;
    *(data_pointer + 1) = door_id_1;
    
    
    //De två tidsvärdena skrivs till bit 16-47
    *(data_pointer + 2) = time_0;
    *(data_pointer + 4) = time_1;
    
    //Låsflagga skrivs till bit 48-55
    *(data_pointer + 6) = locked;
    
    return 1;
}

/*
 * CanTxMsg *msg: förslagsvis tomt meddeleande som görs till id-förfrågan
 * uint32_t temp_id: temporärt, förslagsvis slumpgenererat id
 * uint8_t device_type: 0 för dörrenhet, 1 för rörelseenhet
 * uint8_t value_0: antal dörrar eller rörelsesensorer
 * uint8_t value_1: antal vibrationssensorer
 */
uint8_t encode_request_id(CanTxMsg *msg, uint32_t temp_id, uint8_t device_type, uint8_t value_0, uint8_t value_1){
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
    
    return 1;
}

//Encodar en id-tilldelning
//msg är en pektare till meddelande som ska skickas
//request är en pekare till förfrågan
//id är id man tilldelar enheten
//Returnerar 1 om det lyckade 0 annars
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

uint8_t encode_distance_config(CanTxMsg *msg, uint32_t dist){
    uint8_t *data_pointer =  &(msg->Data[0]);
    
    msg->DLC = 4;
    
    //Avstånd skrivs in i bytearrayen för data
    *data_pointer = dist;
}

uint8_t decode_door_config_msg(CanRxMsg *msg, uint8_t *door_id_0, uint8_t *door_id_1, uint16_t *time_0, uint16_t *time_1, uint8_t *locked) {
    uint8_t *data_pointer =  &(msg->Data);
    
    door_id_0 = data_pointer;
    door_id_1 = data_pointer + 1;
    
    time_0 = data_pointer + 2;
    time_1 = data_pointer + 4;
    
    locked = data_pointer + 6;
    
    
    return 1;
}

//Returnerar tempID ur ett ID-tilldelings meddelande
//Filtrering av header måste redan ha gjorts
uint32_t decode_tempID(CanRxMsg *msg){
    if (msg->DLC == assignID_msg_length){
        return (((uint32_t)msg->Data[0])) | (((uint32_t)msg->Data[1]) << 8) | (((uint32_t)msg->Data[2]) << 16) | (((uint32_t)msg->Data[3]) << 24);
    }
    return 0;
}

//Returnerar ID ur ett ID-tilldelings meddelande
//Filtrering av header och rätt tempID måste redan ha gjorts
uint8_t decode_ID(CanRxMsg *msg){
    if (msg->DLC == assignID_msg_length){
        return msg->Data[4];
    }
}
