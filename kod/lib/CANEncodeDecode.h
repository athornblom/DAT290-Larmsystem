#ifndef CANEncodeDecode_H
#define CANEncodeDecode_H

#include <stdint.h>
#include <stm32f4xx_can.h>
#include <CAN.h>

//Medelandetyper
#define larm_msg_type 0
#define conf_msg_type 1
#define assignID_msg_type 2
#define reqID_msg_type 3

//Meddelande längder
#define reqID_msg_length 7
#define assignID_msg_length 5

uint8_t encode_door_time_config(CanTxMsg *msg, uint8_t to_central, uint8_t door_id_0, uint8_t door_id_1, uint16_t time_0, uint16_t time_1, uint8_t locked);

uint8_t encode_request_id(CanTxMsg *msg, uint32_t temp_id, uint8_t device_type, uint8_t value_0, uint8_t value_1);

uint8_t encode_assign_id(CanTxMsg *msg, CanRxMsg *request, uint8_t id);

uint8_t encode_distance_config(CanTxMsg *msg, uint32_t dist);

uint8_t decode_door_config_msg(CanRxMsg *msg, uint8_t *door_id_0, uint8_t *door_id_1, uint16_t *time_0, uint16_t *time_1, uint8_t *locked);

#endif