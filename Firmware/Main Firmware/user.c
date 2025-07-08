#include <xc.h>

#include "user.h"
#include "pin_definitions.h"
#include "debug_uart.h"
#include "display.h"

unsigned char source_setting = 0;
unsigned char volume_setting = 0;
unsigned char tune_setting = 0;

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

/* Assumes fcy of 16MHz, 1000 ms max */
void delayms(unsigned int ms) {
    T2CONbits.TON = 0;
    T2CONbits.TCKPS0 = 1;       // set to prescalar of 256
    T2CONbits.TCKPS1 = 1;
    unsigned int ticks = ms * 62.5;
    T2CONbits.TON = 1;
    TMR2 = 0x0000;
    while (TMR2 <= ticks);
}

/* Assumes fcy of 16MHz, 4000us max*/
void delayus(unsigned int us) {
    T2CONbits.TON = 0;
    T2CONbits.TCKPS0 = 0;       // change prescalar to 1
    T2CONbits.TCKPS1 = 0;
    unsigned int ticks = us * 16;
    T2CONbits.TON = 1;
    TMR2 = 0x0000;
    while (TMR2 <= ticks);
}

/* Assumes fcy of 16MHz, 4000us max
    delay function for used in interrupts so that timers don't collide */
void intdelayms(unsigned int ms) {
    T4CONbits.TON = 0;
    T4CONbits.TCKPS0 = 1;       // set to prescalar of 256
    T4CONbits.TCKPS1 = 1;
    unsigned int ticks = ms * 62.5;
    T4CONbits.TON = 1;
    TMR4 = 0x0000;
    while (TMR4 <= ticks);
}

/* Assumes fcy of 16MHz, 4000us max
    delay function for used in interrupts so that timers don't collide */
void intdelayus(unsigned int us) {
    T4CONbits.TON = 0;
    T4CONbits.TCKPS0 = 0;       // change prescalar to 1
    T4CONbits.TCKPS1 = 0;
    unsigned int ticks = us * 16;
    T4CONbits.TON = 1;
    TMR4 = 0x0000;
    while (TMR4 <= ticks);
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

void toggle_source(void) {
    source_setting = (source_setting + 1) % 4;
    set_source(source_setting);
}

void volume_inc(void) {
    volume_setting++;
//    write_debug_byte(volume_setting);
//    write_debug_newline();
}

void volume_dec(void) {
    volume_setting--;
//    write_debug_byte(volume_setting);
//    write_debug_newline();
}

void tune_inc(void){
    tune_setting++;
//    write_debug_byte(tune_setting);
//    write_debug_newline();
}

void tune_dec(void) {
    tune_setting--;
//    write_debug_byte(tune_setting);
//    write_debug_newline();
}

void debounce(void) {
    intdelayms(1);
}

void write_vol_setting_to_display(void) {
    write_segments("VOL", volume_setting);
}
