#ifndef FUNCTIONS_H_INCLUDED
#define FUNCTIONS_H_INCLUDED
/* ^^ these are the include guards */
#include "startup.h"
//int is_door_armed(int controlbitts);
void delay (int mili);
void check_door_status (door *aDoors, int arrayLength);
void door_uppdate_lamps (door *door);
int central_larm(door *door);
void startup_lights (door *aDoors, int aLength);
void check_door_sound (door *aDoors, int arrayLength);

#endif