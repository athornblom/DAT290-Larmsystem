#ifndef BUFFER_H
#define BUFFER_H

#include <stdint.h>

#ifndef BUFFERSIZE
//Standard storlek på buffer
#define BUFFERSIZE 400
#endif

//Struktur för buffert
typedef struct {
    //Själva listan
    uint8_t buff[BUFFERSIZE];

    //Antal element i bufferten just nu
    uint16_t count;

    //Index för nästa index för inmatning
    uint16_t in;

    //Index för nästa index för utmatning
    uint16_t out;
} FIFO;

//Nollställer bufferten
void bufferInit(FIFO *buffer);

//Lägger till ett element i buffern.
//Returnerar 1 om det lyckades, 0 annars.
uint8_t bufferPut ( FIFO *buffer, uint8_t elem);

//Skriver över föregående elem i buffern.
//Ändrar inga indexeringsvariabler
void bufferOverrideLast ( FIFO *buffer, uint8_t elem);

//Hämtar ett element från buffern till dest.
//Returnerar 1 om det lyckades, 0 annars.
uint8_t bufferGet ( FIFO *buffer, uint8_t *dest);

#endif