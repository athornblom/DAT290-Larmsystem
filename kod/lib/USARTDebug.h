#ifndef USARTDEBUG_H
#define USARTDEBUG_H

/*Guide:
 * För att aktivera användningen av denna debug utskrift  definera DEBUG (#define DEBUG)
 * Includera denna fil.
 * Initziera mha DebugPrintInit()
 * Därefter kan du använda följande funktioner
    * DebugPrint(uint8_t *str) för att printa text.
    * DebugPrint(uint32_t num) för att printa nummer
    * DebugPrintBase(uint32_t num, uint8_t base) för att printa nummer med bas base
    * DebugPrintPrt(uint8_t *ptr, uint8_t length, uint8_t base) för att printa length bytes från ptr

 */

#include "USART.h"
#inlcude "printMsg.h"
#ifdef DEBUG
    #define DEBUG_ENABLE 1
#else
    #define DEBUG_ENABLE 0
#endif

#define DebugPrintInit() do { if (DEBUG_ENABLE) USARTConfig(); } while (0)
#define DebugPrint(str) do { if (DEBUG_ENABLE) USARTPrint(str); } while (0)
#define DebugWaitPrint(str) do { if (DEBUG_ENABLE) USARTWaitPrint(str); } while (0)
#define DebugPrintNum(num) do { if (DEBUG_ENABLE) USARTPrintNum(num); } while (0)
#define DebugPrintNumBase(num, base) do { if (DEBUG_ENABLE) USARTPrintNumBase(num, base); } while (0)
#define DebugPrintPtr(ptr, length, base) do { if (DEBUG_ENABLE) USARTPrintPtr(ptr, length, base); } while (0)

//Skriver ut meddelanden
#define DebugPrintTxMsg(msgPtr, base) do { if (DEBUG_ENABLE) printTxMsg(msgPtr, base); } while (0)
#define DebugPrintRxMsg(msgPtr, base) do { if (DEBUG_ENABLE) printRxMsg(msgPtr, base); } while (0)


#endif