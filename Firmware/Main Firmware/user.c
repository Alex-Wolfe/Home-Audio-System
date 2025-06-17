#include <xc.h>

#include "user.h"
#include "pin_definitions.h"


/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

/* Assumes fcy of 16MHz, 1000 ms max */
void delayms(unsigned int ms) {
    T2CONbits.TCKPS0 = 1;       // set to prescalar of 256
    T2CONbits.TCKPS1 = 1;
    unsigned int ticks = ms * 62.5;
    TMR2 = 0x0000;
    while (TMR2 <= ticks);
}

/* Assumes fcy of 16MHz, 4000us max*/
void delayus(unsigned int us) {
    T2CONbits.TCKPS0 = 0;       // change prescalar to 1
    T2CONbits.TCKPS1 = 0;
    unsigned int ticks = us * 16;
    TMR2 = 0x0000;
    while (TMR2 <= ticks);
}

/* Set input source with decoder 
   0 = AUX
   1 = BT
   2 = TV
   3 = FM */
void set_source(unsigned char a) {
    switch (a) {
        case 0:
            IN_SEL_A = 0;
            IN_SEL_B = 0;
            break;
        case 1:
            IN_SEL_A = 1;
            IN_SEL_B = 0;
            break;
        case 2:
            IN_SEL_A = 0;
            IN_SEL_B = 1;
            break;
        case 3:
            IN_SEL_A = 1;
            IN_SEL_B = 1;
            break;
        default:
            break;
    }
}