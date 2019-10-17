#include "misc.h"

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