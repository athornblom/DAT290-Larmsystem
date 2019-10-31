#include "misc.h"
#include "CAN.h"
#include "USART.h"
#include "printMsg.h"
#include "keypad.h"
#include "CANEncodeDecode.h"
#include "stm32f4xx_can.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_rng.h"
#include "stm32f4xx_gpio.h"
#include "delay.h"
#include "stringFunc.h"

//Maxnummer för enheter och givare
#define max_num_of_devs 32
#define max_num_door_sensors 32
#define max_num_motion_sensors 25
#define max_num_vib_sensors 25

//Standardvärden för inställningar för enheter
#define default_time_0 1
#define default_time_1 2
#define default_dist 20

//konstanter för aktiv och låsta enhter
#define ACTIVE 1
#define INACTIVE 0
#define LOCKED 1
#define UNLOCKED 0


//Defines för returnvärden för uint8_t Command(uint8_t *command);
#define RERUN 2
#define OK 1
#define NOCMD 0

typedef struct{
    uint8_t id;
    uint8_t time_0;
    uint8_t time_1;
    uint8_t locked;
} Door;

typedef struct{
    uint8_t num_of_doors;
    Door doors[max_num_door_sensors];
} Door_device;

typedef struct{
    uint8_t id;
    uint16_t dist;
	uint8_t active;
} Dist_sensor;

typedef struct{
    uint8_t id;
	uint8_t active;
} Vib_sensor;

typedef struct{
    uint8_t num_of_motion_sensors;
    uint8_t num_of_vib_sensors;
    Dist_sensor dist_sensors[max_num_motion_sensors];
    Vib_sensor vib_sensors[max_num_vib_sensors];
} Motion_device;

typedef struct {
    uint8_t type;
    uint8_t id;
	uint32_t random_id;
    uint8_t num_of_unacked;
} Device;



Door_device *get_door_device(uint8_t id);

//Denna funktion ska alltid användas för att lägga till en ny dörrenhet
Door_device *add_door_device(uint8_t id, CanRxMsg *msg);

//Denna funktion ska alltid användas för att lägga till en ny rörelseenhet
Motion_device *add_motion_device(uint8_t id, CanRxMsg *msg);

//Denna funktion ska alltid användas för att lägga till en ny rörelseenhet
Motion_device *add_motion_device(uint8_t id, CanRxMsg *msg);

void id_request_handler(CanRxMsg *rxMsgP);

void larmHandler(CanRxMsg *rxMsg);

uint8_t msgPrint(CanRxMsg *msg, uint8_t base);

void confMsg(CanRxMsg *msg);

uint8_t enterConfMode (void);

uint8_t enterStdMode (void);

uint8_t Command(uint8_t *command);

void USARTCommand(void);

uint8_t doors_equal(Door door_0, Door door_1);

uint8_t send_door_configs(Door_device *dev);