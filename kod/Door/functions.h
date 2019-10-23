#ifndef FUNCTIONS_H_INCLUDED
#define FUNCTIONS_H_INCLUDED
/* ^^ these are the include guards */
#include "startup.h"
//int is_door_armed(int controlbitts);
void delay (int mili);
void check_door_status ();
void door_uppdate_lamps (char);
int central_larm(char);
void startup_lights ();
void check_door_sound ();

#endif