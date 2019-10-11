#include "buffer.h"

//Nollställer bufferten
void bufferInit(FIFO *buffer) {
    buffer->count = 0;
    buffer->in = 0;
    buffer->out = 0;
}

//Lägger till ett elem i buffern.
//Returnerar 1 om det lyckades, 0 annars.
uint8_t bufferPut ( FIFO *buffer, uint8_t elem) {
    //Kollar om bufferten är full.
    if (buffer->count == BUFFERSIZE){
        return 0;
    }

    //Lägger elem i bufferten
    buffer->buff[buffer->in++] = elem;
    buffer->count++;

    //Justerar pekaren om vi nått slutet
    if (buffer->in == BUFFERSIZE)
        buffer->in = 0;

    return 1;
}

//Skriver över föregående elem i buffern.
//Ändrar inga indexeringsvariabler
void bufferOverrideLast ( FIFO *buffer, uint8_t elem) {
    //Index för föregående element i buffern
    uint8_t prevIndex;

    //Om index för nästa element är 0 så blir föregående BUFFERSIZE - 1
    //annars buffer->in - 1
    prevIndex =  (buffer->in == 0) ? BUFFERSIZE - 1 : buffer->in - 1;

    //Skriver över elem i bufferten
    buffer->buff[prevIndex] = elem;
}

//Hämtar ett element från buffern till dest.
//Returnerar 1 om det lyckades, 0 annars.
uint8_t bufferGet ( FIFO *buffer, uint8_t *dest) {
    //Kollar om bufferten är tom
    if (!buffer->count){
        return 0;
    }

    //Hämtar element ur buffern till dest
    *dest = buffer->buff[buffer->out++];
    buffer->count--;

    //Justerar pekaren om vi nått slutet
    if (buffer->out == BUFFERSIZE)
        buffer->out = 0;

    return 1;
}