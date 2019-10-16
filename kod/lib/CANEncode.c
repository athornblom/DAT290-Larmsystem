#include "CANEncode.h"
#include "misc.h"
#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"


uint8_t encode_door_time_config(CanTxMsg *msg, uint32_t time0, uint32_t time1){
    uint8_t *data_pointer =  &(msg->Data);
    
    msg->DLC = 8;
    
    //De två tidsvärdena skrivs in i bytearrayen för data
    *data_pointer = time0;
    *(data_pointer + 4) = time1;
    
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
    uint8_t *data_pointer =  &(msg->Data);
    
    
    Header header = empty_header;
    header.msgType = 4;
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
    
}

uint8_t encode_assign_id(CanTxMsg *msg, uint8_t id){
    uint8_t *data_pointer =  &(msg->Data);
    
    
    Header header = empty_header;
    header.msgType = 3;
    header.toCentral = 0;
    HEADERtoUINT32(header, msg->ExtId);
    
    msg->DLC = 2;
    
    msg->IDE = CAN_Id_Extended; //Alternativen är CAN_Id_Standard eller FCAN_Id_Extended
    msg->RTR = CAN_RTR_Data;
    
    //Id skrivs in i bytearrayen för data
    *data_pointer = id;
}

uint8_t encode_distance_config(CanTxMsg *msg, uint32_t dist){
    uint8_t *data_pointer =  &(msg->Data[0]);
    
    msg->DLC = 4;
    
    //Avstånd skrivs in i bytearrayen för data
    *data_pointer = dist;
}