#include "stringFunc.h"

//Jämför två strängar. Returnerar 1 om de är lika. 0 annars.
uint8_t strEqual(uint8_t *str1, uint8_t *str2){
    //Loopa så länge vi inte nått slutet på någon av strängarna
    while (*str1 && *str2) {
        //Skiljer sig tecknen åt, returnera 0
        //Flyttar också pekarna
        if (*str1++ != *str2++){
            return 0;
        }
    }

    //De är endast lika om de hitills varit lika och de slutar samtidigt
    return *str1 == *str2;
}

//Kollar om str1 börjar med str2. Returnerar 1 om det är så. 0 annars.
uint8_t strStartsWith(uint8_t *str1, uint8_t *str2){
    //Loopa tills vi kommer till slutet av str2
    while(*str1 && *str2){
        //Skiljer sig tecknen åt returnera 0
        //Flyttar också pekaren
        if (*str1++ != *str2++){
            return 0;
        }
    }

    //str1 slutar innan str2, returnera 0
    if (*str1 == 0 && *str2 != 0){
        return 0;
    }

    return 1;
}