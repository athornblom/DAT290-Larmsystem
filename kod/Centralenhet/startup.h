#include "misc.h"
#include "CAN.h"
#include "USART.h"
#include "printMsg.h"
#include "CANEncode.h"
#include "stm32f4xx_can.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"
#include "delay.h"
#include "stringFunc.h"

typedef struct{
    uint8_t id;
    uint8_t time_0;
    uint8_t time_1;
    uint8_t locked;
} Door;

typedef struct{
    uint8_t type;
    uint8_t id;
    uint8_t num_of_doors;
    Door doors[32];
} Door_device;

typedef struct{
    uint8_t id;
    uint8_t dist;
} Dist_sensor;

typedef struct{
    uint8_t id;
} Vib_sensor;

typedef struct{
    uint8_t type;
    uint8_t id;
    Dist_sensor dist_sensors[32];
    Vib_sensor vib_sensors[32];
} Motion_device;



Door_device *get_door_device(uint8_t id);

Door_device *add_door_device(uint8_t id);

Motion_device *get_motion_device(uint8_t id);

Motion_device *add_motion_device(uint8_t id);

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