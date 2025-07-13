#include <xc.h>

#include "user.h"
#include "pin_definitions.h"
#include "debug_uart.h"
#include "display.h"
#include "eeprom.h"
#include "vol_pot.h"

#define SAMPLES_PER_STEP 2
#define DEBOUNCE_DELAY 63      // delay of 1ms assuming 256 prescalar

#define EEPROM_SOURCE_ADD 0x01

unsigned char source_setting = 0;
unsigned char source_changed_flag = 0;

unsigned char volume_setting = 24;
unsigned char volume_changed_flag = 0;

unsigned int tune_setting = 999;
unsigned char tune_changed_flag = 0;

unsigned char source_button_pressed = 0;
unsigned char display_button_pressed = 0;

unsigned char nMULTI1_pressed = 0;
unsigned char nMULTI2_pressed = 0;

unsigned char volume_encoder_next_state = 0;
unsigned char volume_encoder_previous_state = 0;
char volume_direction = 0;
char previous_volume_direction = 0;
unsigned char volume_streak = 0;

unsigned char tune_encoder_next_state = 0;
unsigned char tune_encoder_previous_state = 0;
char tune_direction = 0;
char previous_tune_direction = 0;
unsigned char tune_streak = 0;

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
            write_first_segments_text("AUX");
            break;
        case 1:
            IN_SEL_A = 1;
            IN_SEL_B = 0;
            write_first_segments_text("BT");
            break;
        case 2:
            IN_SEL_A = 0;
            IN_SEL_B = 1;
            write_first_segments_text("TV");
            break;
        case 3:
            IN_SEL_A = 1;
            IN_SEL_B = 1;
            write_first_segments_text("FM");
            break;
        default:
            break;
    }
    source_changed_flag = 1;
}

void toggle_source(void) {
    source_setting = (source_setting + 1) % 4;
    set_source(source_setting);
}

void init_source(void) {
    set_source(read_eeprom(EEPROM_SOURCE_ADD));
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
            if (IFS1bits.T5IF) {
                // long press
            }
            else {
                // short press
            }
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
            if (IFS1bits.T5IF) {
                // long press
            }
            else {
                // short press
            }
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
        volume_encoder_previous_state = volume_encoder_next_state;
        if (!volume_direction) {
            return;
        }
        if (volume_direction == previous_volume_direction) {
            volume_streak++;
            if ((volume_direction > 0) && (volume_setting < 248) && (volume_streak > 3)) {
                volume_setting += 8;
                previous_volume_direction = 0;
                volume_streak = 0;
                volume_changed_flag = 1;
            }
            else if ((volume_direction < 0) && (volume_setting > 8) && (volume_streak > 3)) {
                volume_setting -= 8;
                previous_volume_direction = 0;
                volume_streak = 0;
                volume_changed_flag = 1;
            }
        } else {
            previous_volume_direction = volume_direction;
        }
        TMR5 = 0;
        IFS1bits.T5IF = 0;
    }
}

void update_volume(void) {
    if (volume_changed_flag) {
        set_volume(volume_setting);
        volume_changed_flag = 0;
    }
}

void init_volume(void) {
    set_volume(volume_setting);
}

void handle_tune_encoder(void) {
    if ((TMR5 > DEBOUNCE_DELAY) || IFS1bits.T5IF) {
        tune_encoder_next_state = (TUNE_A << 1) + TUNE_B;
        tune_direction = transition_table[tune_encoder_previous_state][tune_encoder_next_state];
        tune_encoder_previous_state = tune_encoder_next_state;
        if (!tune_direction) {
            return;
        }
        if (tune_direction == previous_tune_direction) {
            tune_streak++;
            if ((tune_direction > 0) && (tune_setting < 1079) && (tune_streak > 3)) {
                tune_setting += 1;
                previous_tune_direction = 0;
                tune_streak = 0;
                tune_changed_flag = 1;
            }
            else if ((tune_direction < 0) && (tune_setting > 879) && (tune_streak > 3)) {
                tune_setting -= 1;
                previous_tune_direction = 0;
                tune_streak = 0;
                tune_changed_flag = 1;
            }
        } else {
            previous_tune_direction = tune_direction;
        }
        TMR5 = 0;
        IFS1bits.T5IF = 0;
    }
}

void update_ADC_memory(void) {
    AD1CON1bits.ASAM = 0;   // stop auto sampling/conversion
    volatile unsigned int *adc_ptr = &ADC1BUF0;
    for(unsigned char i = 0; i < 16; i++) { // put results from buffer in memory
        adc_results[i] = *(adc_ptr + i);
    }
    AD1CON1bits.ASAM = 1;   // resume auto sampling/conversion
}

unsigned char get_bar_from_adc(unsigned int counts) {
    if (counts <= 129) {
        return 0;
    }
    else if (counts <= 183) {
        return 1;
    }
    else if (counts <= 258) {
        return 2;
    }
    else if (counts <= 365) {
        return 3;
    }
    else if (counts <= 516) {
        return 4;
    }
    else if (counts <= 728) {
        return 5;
    }
    else if (counts <= 1028) {
        return 6;
    }
    else if (counts <= 1453) {
        return 7;
    }
    else if (counts <= 2051) {
        return 8;
    }
    else if (counts <= 2899) {
        return 9;
    }
    else {
        return 10;
    }
}

void update_bargraphs_with_adc(void) {
    write_bargraph(7, get_bar_from_adc(adc_results[4]));
    write_bargraph(6, get_bar_from_adc(adc_results[2]));
    write_bargraph(5, get_bar_from_adc(adc_results[9]));
    write_bargraph(4, get_bar_from_adc(adc_results[8]));
    write_bargraph(3, get_bar_from_adc(adc_results[5]));
    write_bargraph(2, get_bar_from_adc(adc_results[6]));
    write_bargraph(1, get_bar_from_adc(adc_results[7]));
    write_bargraph(0, get_bar_from_adc(adc_results[3]));
}

void test_screen_update(void) {
//    write_first_segments_int(volume_setting / 8);
//    write_second_segments_int(tune_setting);
//    if (volume_changed_flag) {
//        write_second_segments_int(volume_setting);
//        volume_changed_flag = 0;
//    }
//    if (tune_changed_flag) {
//        write_first_segments_int(tune_setting);
//        tune_changed_flag = 0;
//    }
}