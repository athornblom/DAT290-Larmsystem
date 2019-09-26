#ifndef USARTDEBUG_H
#define USARTDEBUG_H

/*Guide:
 * För att aktivera användningen av denna debug utskrift  definera DEBUG (#define DEBUG)
 * Includera denna fil.
 * Initziera mha DebugPrintInit()
 * Därefter kan du använda följande funktioner
    * DebugPrint(uint8_t *str) för att printa text. Accepterade täcken är 0-9 a-z A-Z samt space
    * DebugPrint(uint32_t num) för att printa nummer
 */

#include "USART.h"
#ifdef DEBUG
    #define DEBUG_ENABLE 1
#else
    #define DEBUG_ENABLE 0
#endif

#define DebugPrintInit() do { if (DEBUG_ENABLE) USARTConfig(); } while (0)
#define DebugPrint(str) do { if (DEBUG_ENABLE) USARTPrint(str); } while (0)
#define DebugPrintNum(num) do { if (DEBUG_ENABLE) USARTPrintNum(num); } while (0)


#endif