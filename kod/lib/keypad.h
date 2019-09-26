#ifndef KEYPAD_H
#define KEYPAD_H

#include <stdint.h>

//Initierar keypad för port PE8-15 med avbrott kopplat till PE0
void keypadnit();

//Läser senaste tecknet från keypaden till dest
//Returnerar 1 om det fanns att läsa 0 annars
uint8_t readKeypad(uint8_t *dest);

#endif
