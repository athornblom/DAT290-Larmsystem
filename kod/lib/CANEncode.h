#ifndef CANEncode_H
#define CANEncode_H

#include <stdint.h>
#include <stm32f4xx_can.h>
#include <CAN.h>

uint8_t encode_door_time_config(CanTxMsg *msg, uint32_t time0, uint32_t time1);

uint8_t encode_request_id(CanTxMsg *msg, uint32_t temp_id, uint8_t device_type, uint8_t value_0, uint8_t value_1);

uint8_t encode_assign_id(CanTxMsg *msg, uint8_t id);

uint8_t encode_distance_config(CanTxMsg *msg, uint32_t dist);

#endif