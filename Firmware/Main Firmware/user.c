#include <xc.h>

#include "user.h"
#include "pin_definitions.h"
#include "debug_uart.h"
#include "display.h"
#include "eeprom.h"
#include "vol_pot.h"
#include "eq_pot.h"

#define SAMPLES_PER_STEP 2
#define DEBOUNCE_DELAY 63      // delay of ~1ms assuming 256 prescalar


enum sources {      // arguments for set source function
    AUX,
    BT,
    TV,
    FM
};
char source_text_array[4][5] = {{'A','U','X','\0'}, {'B','T','\0'}, {'T','V','\0'}, {'T','U','N','E','\0'}};
unsigned char source_setting = AUX;
unsigned char source_changed_flag = 0;

unsigned char volume_changed_flag = 0;
unsigned char eq_low_changed_flag = 0;
unsigned char eq_high_changed_flag = 0;

unsigned char tune_changed_flag = 0;

unsigned char source_button_pressed = 0;
unsigned char display_button_pressed = 0;

unsigned char nMULTI1_pressed = 0;
unsigned char nMULTI2_pressed = 0;

unsigned char volume_encoder_next_state = 0;
unsigned char volume_encoder_previous_state = 0;
char volume_direction = 0;
char previous_volume_direction = 0;
unsigned char volume_direction_streak = 0;

unsigned char tune_encoder_next_state = 0;
unsigned char tune_encoder_previous_state = 0;
char tune_direction = 0;
char previous_tune_direction = 0;
unsigned char tune_direction_streak = 0;

const unsigned char transition_table[4][4] = {
    {0, -1, 1, 0},  // 00 -> {00, 01, 10, 11}
    {1, 0, 0, -1},  // 01 -> {00, 01, 10, 11}
    {-1, 0, 0, 1},  // 10 -> {00, 01, 10, 11}
    {0, 1, -1, 0}   // 11 -> {00, 01, 10, 11}
};

unsigned int adc_results[16];
unsigned char adc_done_flag = 0;

enum menu_screens {
    SOURCE_STATUS,  // note that fm screen will always show tuner frequency
    VOLUME_ADJUST,  // get to this screen by adjusting volume knob when in source_status screen
    LOW_ADJUST,
    HIGH_ADJUST
};

unsigned char menu_state = SOURCE_STATUS;
unsigned char state_changed_flag = 0;

/* bins for results from volume encoder depending on menu state 
 * 3(*8) is starting volume. 12 is starting eq value which represents 0dB
 * but can go to 0 (-12dB) and 24 (+12dB)             LO  HI    */
unsigned char volume_encoder_destination[4] = {0, 24, 12, 12};

/* bins for results from tune encoder depending on menu state */
unsigned int tune_encoder_destination[1] = {999};

unsigned char volume_timeout_flag = 0;

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
        case AUX:
            IN_SEL_A = 0;
            IN_SEL_B = 0;
            source_setting = AUX;
            break;
        case BT:
            IN_SEL_A = 1;
            IN_SEL_B = 0;
            source_setting = BT;
            break;
        case TV:
            IN_SEL_A = 0;
            IN_SEL_B = 1;
            source_setting = TV;
            break;
        case FM:
            IN_SEL_A = 1;
            IN_SEL_B = 1;
            source_setting = FM;
            break;
        default:
            break;
    }
    source_changed_flag = 1;
    state_changed_flag = 1;
}

void toggle_source(void) {
    source_setting = (source_setting + 1) % 4;
    set_source(source_setting);
}

void restore_settings(void) {
    set_source(read_eeprom_source());
//    unsigned int test = read_eeprom_frequency();  //fix eventually
//    if (test < 0xFFFF) {
//        tune_encoder_destination[SOURCE_STATUS] = test;
//    }
//    else {
//        tune_encoder_destination[SOURCE_STATUS] = 999;
//    }
    tune_encoder_destination[SOURCE_STATUS] = 999;
}

/* Called by interrupt for source button */
void handle_source_button(void) {
    if ((TMR5 > DEBOUNCE_DELAY) || IFS1bits.T5IF) {
        if (source_button_pressed && nSOURCE) {
            source_button_pressed = 0;
            toggle_source();
            TMR5 = 0;
            IFS1bits.T5IF = 0;
        }
        else if (!source_button_pressed && !nSOURCE) {
            source_button_pressed = 1;
    //        toggle_source();
            TMR5 = 0;
            IFS1bits.T5IF = 0;
        }
    }
}

/* Called by interrupt for display toggle button */
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

/* Called by interrupt for knob press */
void handle_nMULTI1(void) {
    if ((TMR5 > DEBOUNCE_DELAY) || IFS1bits.T5IF) {
        if (nMULTI1_pressed) {
            if (IFS1bits.T5IF) {    // long press
                if (menu_state == SOURCE_STATUS) {
                    menu_state = LOW_ADJUST;
                    state_changed_flag = 1;
                }
                else {
                    menu_state = SOURCE_STATUS;
                    state_changed_flag = 1;
                }
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

/* Called by interrupt for knob press */
void handle_nMULTI2(void) {
    if ((TMR5 > DEBOUNCE_DELAY) || IFS1bits.T5IF) {
        if (nMULTI2_pressed) {
            if (IFS1bits.T5IF) {     // long press
                if (menu_state == SOURCE_STATUS) {
                    menu_state = HIGH_ADJUST;
                    state_changed_flag = 1;
                }
                else {
                    menu_state = SOURCE_STATUS;
                    state_changed_flag = 1;
                }
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

/* Called by interrupt */
void handle_volume_encoder(void) {
    if ((TMR5 > DEBOUNCE_DELAY) || IFS1bits.T5IF) {
        volume_encoder_next_state = (VOL_A << 1) + VOL_B;
        volume_direction = transition_table[volume_encoder_previous_state][volume_encoder_next_state];
        volume_encoder_previous_state = volume_encoder_next_state;
        if (!volume_direction) {
            return;
        }
        TMR1 = 0;       // start timer1 and enable interrupt
        IFS0bits.T1IF = 0;  // displays volume changes, but then jumps back
        IEC0bits.T1IE = 1;  // to previous screen state
        if (volume_direction == previous_volume_direction) {
            volume_direction_streak++;
            if (menu_state == SOURCE_STATUS) {  // if in default state, change to volume, else keep state
                menu_state = VOLUME_ADJUST;
                state_changed_flag = 1;
            }
            if ((volume_direction > 0) && (volume_direction_streak > 3)) {
                volume_encoder_inc();
                state_changed_flag = 1;
                previous_volume_direction = 0;
                volume_direction_streak = 0;
            }
            else if ((volume_direction < 0) && (volume_direction_streak > 3)) {
                volume_encoder_dec();
                state_changed_flag = 1;
                previous_volume_direction = 0;
                volume_direction_streak = 0;
            }
        } 
        else {
            previous_volume_direction = volume_direction;
        }
        TMR5 = 0;
        IFS1bits.T5IF = 0;
    }
}

void volume_encoder_inc(void) {
    switch (menu_state) {
        case SOURCE_STATUS:
            break;
        case VOLUME_ADJUST:
            if (volume_encoder_destination[menu_state] < 248){
                volume_encoder_destination[menu_state] += 8; //increase by 8
                volume_changed_flag = 1;
            }
            break;
        case LOW_ADJUST:
            if (volume_encoder_destination[menu_state] <= 24) {
                volume_encoder_destination[menu_state]++;
                eq_low_changed_flag = 1;
            }
            break;
        case HIGH_ADJUST:
            if (volume_encoder_destination[menu_state] <= 24) {
                volume_encoder_destination[menu_state]++;
                eq_high_changed_flag = 1;
            }
            break;
        default:
            break;
    }
}

void volume_encoder_dec(void) {
    switch (menu_state) {
        case SOURCE_STATUS:
            break;
        case VOLUME_ADJUST:
            if (volume_encoder_destination[menu_state] >= 8){
                volume_encoder_destination[menu_state] -= 8;
                volume_changed_flag = 1;
            }
            break;
        case LOW_ADJUST:
            if (volume_encoder_destination[menu_state] >= 1) {
                volume_encoder_destination[menu_state]--;
                eq_low_changed_flag = 1;
            }
            break;
        case HIGH_ADJUST:
            if (volume_encoder_destination[menu_state] >= 1) {
                volume_encoder_destination[menu_state]--;
                eq_high_changed_flag = 1;
            }
            break;
        default:
            break;
    }
}

void update_pots(void) {
    if (volume_changed_flag) {
        set_volume(volume_encoder_destination[VOLUME_ADJUST]);
        volume_changed_flag = 0;
    }
    if (eq_low_changed_flag) {
        set_left_low_level(volume_encoder_destination[LOW_ADJUST]*8);
        set_right_low_level(volume_encoder_destination[LOW_ADJUST]*8);
        eq_low_changed_flag = 0;
        delayus(50);
    }
    if (eq_high_changed_flag) {
        set_left_high_level(volume_encoder_destination[HIGH_ADJUST]*8);
        set_right_high_level(volume_encoder_destination[HIGH_ADJUST]*8);
        eq_high_changed_flag = 0;
        delayus(50);
    }
}

void init_volume(void) {
    set_volume(volume_encoder_destination[VOLUME_ADJUST]);
}

/* Called by interrupt */
void handle_tune_encoder(void) {
    if (source_setting == FM) {     // only process if in fm mode
        if ((TMR5 > DEBOUNCE_DELAY) || IFS1bits.T5IF) { // if debounce is done
            tune_encoder_next_state = (TUNE_A << 1) + TUNE_B;
            tune_direction = transition_table[tune_encoder_previous_state][tune_encoder_next_state];
            tune_encoder_previous_state = tune_encoder_next_state;
            if (!tune_direction) {
                return;
            }
            if (tune_direction == previous_tune_direction) {
                tune_direction_streak++;
                if ((tune_direction > 0) && (tune_direction_streak > 3)) {
                    tune_encoder_inc();
                    state_changed_flag = 1;
                    previous_tune_direction = 0;
                    tune_direction_streak = 0;
                }
                else if ((tune_direction < 0) && (tune_direction_streak > 3)) {
                    tune_encoder_dec();
                    state_changed_flag = 1;
                    previous_tune_direction = 0;
                    tune_direction_streak = 0;
                }
            } 
            else {
                previous_tune_direction = tune_direction;
            }
            TMR5 = 0;
            IFS1bits.T5IF = 0;
        }
    }
}

void tune_encoder_inc(void) {
    switch (menu_state) {
        case SOURCE_STATUS:
            if ((source_setting == FM) && (tune_encoder_destination[menu_state] < 1079)) {
                tune_encoder_destination[menu_state] += 2;
                tune_changed_flag = 1;
            }
            break;
        default:
            break;
    }
}

void tune_encoder_dec(void) {
    switch (menu_state) {
        case SOURCE_STATUS:
            if ((source_setting == FM) && (tune_encoder_destination[menu_state] > 879)) {
                tune_encoder_destination[menu_state] -= 2;
                tune_changed_flag = 1;
            }
            break;
        default:
            break;
    }
}

/* called by ADC interrupt */
void update_ADC_memory(void) {
    AD1CON1bits.ASAM = 0;   // stop auto sampling/conversion
    volatile unsigned int *adc_ptr = &ADC1BUF0;
    for(unsigned char i = 0; i < 16; i++) { // put results from buffer in memory
        adc_results[i] = *(adc_ptr + i);
    }
    AD1CON1bits.ASAM = 1;   // resume auto sampling/conversion
    adc_done_flag = 1;
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
    if (adc_done_flag) {
        write_bargraph(7, get_bar_from_adc(adc_results[4]));    // avg volume data
        write_bargraph(6, get_bar_from_adc(adc_results[2]));    // 16kHz data
        write_bargraph(5, get_bar_from_adc(adc_results[9]));    // 6.25kHz data
        write_bargraph(4, get_bar_from_adc(adc_results[8]));    // 2.5kHz data
        write_bargraph(3, get_bar_from_adc(adc_results[5]));    // 1kHz data
        write_bargraph(2, get_bar_from_adc(adc_results[6]));    // 400Hz data
        write_bargraph(1, get_bar_from_adc(adc_results[7]));    // 160Hz data
        write_bargraph(0, get_bar_from_adc(adc_results[3]));    // 63Hz data
    }
}

void loop_handler(void) {
    update_display();
    if (volume_timeout_flag) {
        volume_timeout();
    }
    if (tune_changed_flag) {
        write_second_segments_int(tune_encoder_destination[menu_state]);
        save_eeprom_frequency(tune_encoder_destination[SOURCE_STATUS]);
        tune_changed_flag = 0;
    }
    if (source_changed_flag) {  // if source changed, save to eeprom
        save_eeprom_source(source_setting);
        source_changed_flag = 0;
    }
    update_pots();  //update pots depending on which flags are set
    update_bargraphs_with_adc();    // update bargraphs with audio amplitude
    
}

/* Set by Timer 1 interrupt to timeout volume adjust screen*/
void set_volume_timeout_flag(void) {
    volume_timeout_flag = 1;
}

/* called to timeout volume adjust screen */
void volume_timeout(void) {
    if (menu_state == VOLUME_ADJUST) {
        menu_state = SOURCE_STATUS;
        state_changed_flag = 1;
    }
    volume_timeout_flag = 0;
}

void update_display(void) {
    switch (menu_state) {
        case SOURCE_STATUS:
            if (state_changed_flag) {
                clear_segment_data();
                write_first_segments_text(source_text_array[source_setting]);
                if (source_setting == FM) { // if FM mode, write tune frequency
                    write_second_segments_int(tune_encoder_destination[menu_state]);
                }
                state_changed_flag = 0;
            }
            break;
        case VOLUME_ADJUST:
            if (state_changed_flag) {
                clear_segment_data();
                write_first_segments_text("VOL");
                write_second_segments_int(volume_encoder_destination[menu_state] / 8);
                state_changed_flag = 0;
            }
            break;
        case LOW_ADJUST:
            if (state_changed_flag) {
                clear_segment_data();
                write_first_segments_text("LO");
                write_second_segments_int(volume_encoder_destination[menu_state]);
                state_changed_flag = 0;
            }
            break;
        case HIGH_ADJUST:
            if (state_changed_flag) {
                clear_segment_data();
                write_first_segments_text("HI");
                write_second_segments_int(volume_encoder_destination[menu_state]);
                state_changed_flag = 0;
            }
            break;
        default:
            break;
    }
}