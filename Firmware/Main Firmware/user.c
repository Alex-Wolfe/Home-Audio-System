#include <xc.h>

#include "user.h"
#include "pin_definitions.h"
#include "debug_uart.h"
#include "display.h"
#include "eeprom.h"

#define SAMPLES_PER_STEP 2
#define DEBOUNCE_DELAY 625      // delay of 10ms assuming 256 prescalar

#define EEPROM_SOURCE_ADD 0x01

unsigned char source_setting = 0;
unsigned char volume_setting = 0;
unsigned char tune_setting = 0;

unsigned char source_button_pressed = 0;
unsigned char display_button_pressed = 0;
unsigned char nMULTI1_pressed = 0;
unsigned char nMULTI2_pressed = 0;

unsigned char volume_encoder_next_state = 0;
unsigned char volume_encoder_previous_state = 0;
unsigned char volume_direction = 0;
char previous_volume_direction = 0;

unsigned char tune_encoder_next_state = 0;
unsigned char tune_encoder_previous_state = 0;
unsigned char tune_direction = 0;
char previous_tune_direction = 0;

const unsigned char transition_table[4][4] = {
    {0, -1, 1, 0},  // 00 -> {00, 01, 10, 11}
    {1, 0, 0, -1},  // 01 -> {00, 01, 10, 11}
    {-1, 0, 0, 1},  // 10 -> {00, 01, 10, 11}
    {0, 1, -1, 0}   // 11 -> {00, 01, 10, 11}
};

unsigned int adc_results[16];

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
    write_eeprom(EEPROM_SOURCE_ADD, source_setting);
}

/* Removed rising/falling edge conditionals, add back in if doesn't work */
void handle_source_button(void) {
    if ((TMR5 > DEBOUNCE_DELAY) || IFS1bits.T5IF) {
        if (source_button_pressed) {
            source_button_pressed = 0;
            toggle_source();
            TMR5 = 0;
            IFS1bits.T5IF = 0;
        }
        else if (!source_button_pressed) {
            source_button_pressed = 1;
    //        toggle_source();
            TMR5 = 0;
            IFS1bits.T5IF = 0;
        }
    }
}

void init_source(void) {
    set_source(read_eeprom(EEPROM_SOURCE_ADD));
}

/* Removed rising/falling edge conditionals, add back in if doesn't work */
void handle_display_button(void) {
    if ((TMR5 > DEBOUNCE_DELAY) || IFS1bits.T5IF) {
        if (display_button_pressed) {
            display_button_pressed = 0;
            display_blank_setting_toggle();
            TMR5 = 0;
            IFS1bits.T5IF = 0;
        }
        else if (!display_button_pressed) {
            display_button_pressed = 1;
//            display_blank_setting_toggle();
            TMR5 = 0;
            IFS1bits.T5IF = 0;
        }
    }
}

/* Removed rising/falling edge conditionals, add back in if doesn't work */
void handle_nMULTI1(void) {
    if ((TMR5 > DEBOUNCE_DELAY) || IFS1bits.T5IF) {
        if (nMULTI1_pressed) {
            nMULTI1_pressed = 0;
            TMR5 = 0;
            IFS1bits.T5IF = 0;
        }
        else if (!nMULTI1_pressed) {
            nMULTI1_pressed = 1;
            TMR5 = 0;
            IFS1bits.T5IF = 0;
        }
    }
}

/* Removed rising/falling edge conditionals, add back in if doesn't work */
void handle_nMULTI2(void) {
    if ((TMR5 > DEBOUNCE_DELAY) || IFS1bits.T5IF) {
        if (nMULTI2_pressed) {
            nMULTI2_pressed = 0;
            TMR5 = 0;
            IFS1bits.T5IF = 0;
        } else if (!nMULTI2_pressed) {
            nMULTI2_pressed = 1;
            TMR5 = 0;
            IFS1bits.T5IF = 0;
        }
    }
}

void handle_volume_encoder(void) {
    if ((TMR5 > DEBOUNCE_DELAY) || IFS1bits.T5IF) {
        volume_encoder_next_state = (VOL_A << 1) + VOL_B;
        volume_direction = transition_table[volume_encoder_previous_state][volume_encoder_next_state];
        if (!volume_direction) {
            return;
        }
        if (volume_direction == previous_volume_direction) {
            volume_setting += volume_direction;
            previous_volume_direction = 0;
        } else {
            previous_volume_direction = volume_direction;
        }
    }
    TMR5 = 0;
    IFS1bits.T5IF = 0;
}

void handle_tune_encoder(void) {
    if ((TMR5 > DEBOUNCE_DELAY) || IFS1bits.T5IF) {
        tune_encoder_next_state = (TUNE_A << 1) + TUNE_B;
        tune_direction = transition_table[tune_encoder_previous_state][tune_encoder_next_state];
        if (!tune_direction) {
            return;
        }
        if (tune_direction == previous_tune_direction) {
            tune_setting += tune_direction;
            previous_tune_direction = 0;
        } else {
            previous_tune_direction = tune_direction;
        }
    }
    TMR5 = 0;
    IFS1bits.T5IF = 0;
}

void update_ADC_memory(void) {
    AD1CON1bits.ASAM = 0;   // stop auto sampling/conversion
    volatile unsigned int *adc_ptr = &ADC1BUF0;
    for(unsigned char i = 0; i < 16; i++) { // put results from buffer in memory
        adc_results[i] = *(adc_ptr + i);
    }
    AD1CON1bits.ASAM = 1;   // resume auto sampling/conversion
}