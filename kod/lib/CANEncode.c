#include "CANEncode.h"
#include "misc.h"
#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"


uint8_t encode_door_config(CanTxMsg *msg, uint8_t to_central, uint8_t door_id_0, uint8_t door_id_1, uint16_t time_0, uint16_t time_1, uint8_t locked){
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
    *(data_pointer + 4) = time_0;
    
    //Låsflagga skrivs till bit 48-55
    *(data_pointer + 6) = locked;
    
    return 1;
}

/*
 * CanTxMsg *msg: förslagsvis tomt meddeleande som görs till id-förfrågan
 * uint32_t temp_id: temporärt, förslagsvis slumpgenererat id
 * uint8_t device_type: 0 för dörrenhet, 1 för rörelseenhet
 * uint8_t value_0: antal dörrar eller avståndssensorer
 * uint8_t value_1: antal vibrationssensorer
 */
uint8_t encode_request_id(CanTxMsg *msg, uint32_t temp_id, uint8_t device_type, uint8_t value_0, uint8_t value_1){
    uint8_t *data_pointer =  &(msg->Data[0]);
    
    
    Header header = empty_header;
    header.msgType = reqID_msg_type;
    header.toCentral = 1;
    HEADERtoUINT32(header, msg->ExtId);

    msg->DLC = 7;
    
    msg->IDE = CAN_Id_Extended;
    msg->RTR = CAN_RTR_Data;
    
    //Id skrivs in i bytearrayen för data
    *data_pointer = temp_id;
    *(data_pointer + 4) = device_type;
    *(data_pointer + 5) = value_0;
    *(data_pointer + 6) = value_1;
    
    return 1;
}

uint8_t encode_assign_id(CanTxMsg *msg, CanRxMsg *request, uint8_t id){
    uint8_t *data_pointer =  &(msg->Data[0]);
    
    
    Header header = empty_header;
    header.msgType = assignID_msg_type;
    header.toCentral = 0;
    HEADERtoUINT32(header, msg->ExtId);
    
    msg->DLC = 5;
    
    msg->IDE = CAN_Id_Extended; //Alternativen är CAN_Id_Standard eller FCAN_Id_Extended
    msg->RTR = CAN_RTR_Data;
    
    //Första 4 bytes är slumptalet från förfrågan
    *data_pointer = *(uint32_t *)(&(request->Data[0]));

    //Id skickas i andra byten
    *(data_pointer + 4) = id;
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
