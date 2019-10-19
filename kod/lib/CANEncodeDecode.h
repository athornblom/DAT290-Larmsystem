#ifndef CANEncodeDecode_H
#define CANEncodeDecode_H

#include <stdint.h>
#include <stm32f4xx_can.h>
#include <CAN.h>

//Enhetstyper
#define door_unit 0
#define motion_unit 1

//Sensortyper för rörelseenheten
#define motion_sensor 0
#define vibration_sensor 1

//Medelandetyper
#define larm_msg_type 0
#define conf_msg_type 1
#define assignID_msg_type 2
#define reqID_msg_type 3

//Meddelande längder
#define reqID_msg_length 7
#define assignID_msg_length 5
#define door_larm_msg_length 1
#define motion_larm_msg_length 2

uint8_t encode_door_time_config(CanTxMsg *msg, uint8_t to_central, uint8_t door_id_0, uint8_t door_id_1, uint16_t time_0, uint16_t time_1, uint8_t locked);

/*
 * CanTxMsg *msg: förslagsvis tomt meddeleande som görs till id-förfrågan
 * uint32_t temp_id: temporärt, förslagsvis slumpgenererat id
 * uint8_t device_type: 0 för dörrenhet, 1 för rörelseenhet
 * uint8_t value_0: antal dörrar eller rörelsesensorer
 * uint8_t value_1: antal vibrationssensorer
 */
uint8_t encode_request_id(CanTxMsg *msg, uint32_t temp_id, uint8_t device_type, uint8_t value_0, uint8_t value_1);

//Encodar en id-tilldelning
//msg är en pektare till meddelande som ska skickas
//request är en pekare till förfrågan
//id är id man tilldelar enheten
//Returnerar 1 om det lyckade 0 annars
uint8_t encode_assign_id(CanTxMsg *msg, CanRxMsg *request, uint8_t id);

uint8_t encode_distance_config(CanTxMsg *msg, uint32_t dist);

//Encodar ett larmmeddelande från dörrenhet
//msg är en pekare till meddelandet som ska skickas
//unitID är enhetens egna ID
//id är idt till dörren som larmar
void encode_door_larm_msg(CanTxMsg *msg, uint8_t uinitID, uint8_t id);

//msg är en pekare till meddelandet som ska skickas
//unitID är enhetens egna ID
//sensorType är antingen motion_sensor eller vibration_sensor
//id är idt till sensorn som larmar
void encode_motion_larm_msg(CanTx, *msg, uint8_t uinitID, uint8_t sensorType, uint8_t id);

uint8_t decode_door_config_msg(CanRxMsg *msg, uint8_t *door_id_0, uint8_t *door_id_1, uint16_t *time_0, uint16_t *time_1, uint8_t *locked);

//Returnerar tempID ur ett ID-tilldelings meddelande
//Filtrering av header måste redan ha gjorts
uint32_t decode_tempID(CanRxMsg *msg);

//Returnerar ID ur ett ID-tilldelings meddelande
//Filtrering av header och rätt tempID måste redan ha gjorts
uint8_t decode_ID(CanRxMsg *msg);

#endif