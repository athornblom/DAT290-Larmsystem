#include "functions.h"

// Variabel där man ställer in vilken bit i kontrollbitarna som representerar vad.
const int open = 1;
const int cLarm = 2;
const int dissarmedBit = 4;
const int addaptS = 10000;
// allmän dynamisk delay funktion.
void delay(int mili)
{
    int time = msTicks + mili * addaptS / 1000;
    while (time > msTicks)
        ;
}

// Kollar så att dörren inte är avlarmad. Returnar 0 ifall avlarmad
int is_door_armed(int controlbitts)
{
    if (controlbitts & dissarmedBit)
    {
        return 0;
    }
    else
    {
        return 1;
    }
}
// Uppdaterar kontrollbitarna för varje dörr.

void check_door_status(void)
{
    for (int i = 0; i < amountOfActiveDoors; i++)
    {
        /* Dorr avlarmad? */
        if (is_door_armed(doors[i].controlbits))
        {
            /* Dorr stangd? */
            if (!GPIO_ReadInputDataBit(doors[i].GPIO_type, doors[i].GPIO_read))
            {
                /* Satt kontrollbitarna */
                doors[i].controlbits &= 0xFFFF - open - cLarm;
                doors[i].waitOutTime = 0;
            }
            /* Dorr oppen */
            else
            {
                if (!doors[i].controlbits & open) // Forsta gangen den oppnas
                {
                    doors[i].larmTick = msTicks; // Startar timer
                }
                doors[i].controlbits |= open; // Satter bit
            }
        }
    }
}
// Funktion som tänder eller släcker den lokala larmnings lampan
void door_uppdate_lamps(char i)
{
    uint32_t larmTime = doors[i].larmTick + 10 * addaptS * doors[i].time_larm; // gångrar med 10 * 1000 eftersom att tiden anges i 10 s interval
    if (doors[i].controlbits & open && msTicks > larmTime)
    {
        GPIO_SetBits(doors[i].GPIO_type, doors[i].GPIO_lamp); // tänder lampan ifall tiden för att dörren ska larma har gått
    }
    else
    {
        GPIO_ResetBits(doors[i].GPIO_type, doors[i].GPIO_lamp); // släcker lampan annars
    }
}
// Funktion som kollar ifall dörren har vart öppen tillräckligt länge för att den ska larma centralt.
int central_larm(char i)
{
    uint32_t larmTime = doors[i].larmTick + 10 * addaptS * doors[i].time_central_larm + (addaptS * doors[i].waitOutTime); // gångrar med 10 * addaptS eftersom att tiden anges i 10 s interval
    if (doors[i].controlbits & open && msTicks > larmTime && !(doors[i].controlbits & cLarm) && !nocid)
    {
        doors[i].waitOutTime++;
        //doors[i].controlbits |= cLarm;    // sätter kontrollbiten som säger att dörren har larmat centralt.
        return 1;
    }
    else
    {
        return 0;
    }
}

void check_door_sound()
{
    int checkV = 0;
    for (int i = 0; i < amountOfActiveDoors; i++)
    {
        uint32_t larmTime = doors[i].larmTick + 10 * addaptS * doors[i].time_larm; // gångrar med 10 * 1000 eftersom att tiden anges i 10 s interval
        if (doors[i].controlbits & open && msTicks > larmTime)
        {
            checkV = 1;
            break;
        }
    }
    annydoorLarm = checkV;
}
// ================================== LIGHTS =========================================================
//bara för cool-het's faktorn.
void startup_lights()
{

    for (int i = 0; i < amountOfActiveDoors; i++)
    {
        GPIO_SetBits(doors[i].GPIO_type, doors[i].GPIO_lamp);
        delay(100);
    }
    for (int i = amountOfActiveDoors; i >= 0; i--)
    {
        GPIO_ResetBits(doors[i].GPIO_type, doors[i].GPIO_lamp);
        delay(100);
    }
    delay(200);
    for (int i = 0; i < amountOfActiveDoors; i++)
    {
        GPIO_SetBits(doors[i].GPIO_type, doors[i].GPIO_lamp);
    }
    delay(3000);
    for (int i = 0; i < amountOfActiveDoors; i++)
    {
        GPIO_ResetBits(doors[i].GPIO_type, doors[i].GPIO_lamp);
    }
}