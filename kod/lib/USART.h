#ifndef USART_H
#define USART_H

//USART använder Port A pinnarna 9 och 10

/*Guide:
 * Börja med att konfigurera USART med USARTConfig()
 * Nu kan du använda funktionerna nedan
 */

#include <stdint.h>

//Sätter upp USART1
void USARTConfig(void);

//Lägger till list till kön för att skicka
//Sköter omvandling mellan sträng i c till rätt tecken i USART.
//Returnerar 1 om det lyckades, 0 annars.
uint8_t USARTPrint(uint8_t *list);

//Lägger till num som enskilda nummer
//0-9 till kön för att skicka (bas 10)
//Returnerar 1 om det lyckades, 0 annars.
uint8_t USARTPrintNum(uint32_t num);

//Lägger till num som enskilda nummer
//base anger vilken bas
//Returnerar 1 om det lyckades, 0 annars.
uint8_t USARTPrintNumBase(uint32_t num, uint8_t base);

//Hämta senaste mottagna meddelandet till dest
//Gör ingen omvandling, dvs returnerar det tal som skickades över USART
//Returnerar 1 om det lyckades, dvs det fanns ett meddelande att hämta 0 annars.
uint8_t USARTGet (uint8_t *dest);

#endif