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
#define larm_msg_length 1
#define motion_config_msg_length 5

uint8_t encode_door_time_config(CanTxMsg *msg, uint8_t to_central, uint8_t door_id_0, uint8_t door_id_1, uint16_t time_0, uint16_t time_1, uint8_t locked);

/*
 * skapar meddelnade för IDbegäran för dörr
 * CanTxMsg *msg: förslagsvis tomt meddeleande som görs till id-förfrågan
 * uint32_t temp_id: temporärt, förslagsvis slumpgenererat id
 * uint32_t tmpID slumptal för idbegäran
 * uint8_t nDoors: antal dörrar
 */
void encode_door_request_id(CanTxMsg *msg, uint32_t tmpID, uint8_t nDoors);

/*
 * skapar meddelande för idbegäran rörelse
 * CanTxMsg *msg: förslagsvis tomt meddeleande som görs till id-förfrågan
 * uint32_t temp_id: temporärt, förslagsvis slumpgenererat id
 * uint32_t tmpID slumptal för idbegäran
 * uint8_t nMotion: antal rörelsesensorer
 * uint8_t nvib: antalet vibrationssensorer
 */
void encode_motion_request_id(CanTxMsg *msg, uint32_t tmpID, uint8_t nMotion, uint8_t nVib);

//Encodar en id-tilldelning
//msg är en pektare till meddelande som ska skickas
//request är en pekare till förfrågan
//id är id man tilldelar enheten
//Returnerar 1 om det lyckade 0 annars
uint8_t encode_assign_id(CanTxMsg *msg, CanRxMsg *request, uint8_t id);

uint8_t encode_distance_config(CanTxMsg *msg, uint32_t dist);

//Encodar ett larmmeddelande
//msg är en pekare till meddelandet som ska skickas
//unitID är enhetens egna ID
//id är idt till sensorn som larmar 
//För rörelseenheten ligger ID för rörelse och vibrationssensorer efter varandra.
//första röresesensorerna har ID 0 sista ID är antalet rörelsesensorer -1
//Första vibrationssensorn har ID antal rörelsesensorer och sista antalt rörelsesensorer +
//antalet vibrationssensorer - 1
void encode_larm_msg(CanTxMsg *msg, uint8_t uinitID, uint8_t id);

//Encodar ackmeddelande
//msg är en pekare till meddelandet som ska skickas
//larm är en pekare till meddelandet som larmar
void encode_larm_ack(CanTxMsg *msg, CanRxMsg *larm);

uint8_t decode_door_config_msg(CanRxMsg *msg, uint8_t *door_id_0, uint8_t *door_id_1, uint16_t *time_0, uint16_t *time_1, uint8_t *locked);

//Returnerar tempID ur ett ID-tilldelings meddelande
//Filtrering av header måste redan ha gjorts
uint32_t decode_tempID(CanRxMsg *msg);

//Returnerar ID ur ett ID-tilldelings meddelande
//Filtrering av header och rätt tempID måste redan ha gjorts
uint8_t decode_ID(CanRxMsg *msg);

//Aktiverar handler för mottagning av id-tilldelning
//returnerar 1 om det lyckad 0 annars
uint8_t activate_assignID_handler(void (*handler)(CanRxMsg *));

//Aktiverar handler för mottagning av larm-ack
//ID är enehetens ID
//returnerar 1 om det lyckad 0 annars
uint8_t activate_larmAck_handler(void (*handler)(CanRxMsg *), uint8_t ID);

//Aktiverar handler för mottagning av konfiguration
//ID är enehetens ID
//returnerar 1 om det lyckad 0 annars
uint8_t activate_receiveConfig_handler (void (*handler)(CanRxMsg*), uint8_t ID);

#endif