#ifndef STRINGFUNC_H
#define STRINGFUNC_H

#include <stdint.h>

//Jämför två strängar. Returnerar 1 om de är lika. 0 annars.
uint8_t strEqual(uint8_t *str1, uint8_t *str2);

//Kollar om str1 börjar med str2. Returnerar 1 om det är så. 0 annars.
uint8_t strStartsWith(uint8_t *str1, uint8_t *str2);

#endif