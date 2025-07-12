#include <xc.h>
#include "spi.h"
#include "display.h"
#include "pin_definitions.h"
#include "user.h"

/* Create array for shift register data. bytes 0-9 are bar graph LEDs 
   bytes 10-17 are characters for segment display, and byte 18 controls 
   multiplexing the segment characters */
unsigned char shift_array[19] = {0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

/* Create alphabet code: 0-9, A-Z */
const unsigned char alphabet[43] = {0x7D, 0x11, 0x2F, 0x1F, 0x53, 0x5E, 0x7E,
    0x19, 0x7F, 0x5F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7B, 0x76,
    0x26, 0x37, 0x6E, 0x6A, 0x00, 0x73, 0x24, 0x15, 0x00, 0x64, 0x00, 0x32,
    0x36, 0x6B, 0x00, 0x22, 0x5E, 0x66, 0x34, 0x75, 0x00, 0x00, 0x00, 0x00};

unsigned char display_setting = 0;
unsigned char character_index = 0;

/******************************************************************************/
/* Display Functions                                                          */
/******************************************************************************/

/*  Dont call, used by ISR only
 *  Updates shift registers with data array starting at "array"
    Assumes there are 12 bytes stored in the shift register array */
void update_display(void) {
    display_blank_setting(3);       // blank displays to prevent ghosting
    spi1_write(*(shift_array + 18)); // send multiplexing index byte
    spi1_write(*(shift_array + 10 + character_index)); // send character
    for (unsigned char i = 0; i < 10; i++) {        // send bar graph values
        spi1_write(*(shift_array + 9 - i));
    }
    latch_data();
    display_blank_setting(display_setting);
}

/* Edit bytes in memory corresponding to selected bar graph LEDs */
void write_bargraph(unsigned char index, unsigned char amplitude) {
    if (index > 7) {
        return;
    }
    IEC0bits.T3IE = 0;          // Disable Timer 3 interrupt
    unsigned char home_byte = (10 * index) / 8;
    unsigned char offset_bits = (10 * index) % 8;
    *(shift_array + home_byte) &= 0xFF >> (8 - offset_bits);
    *(shift_array + home_byte + 1) &= 0xFF << (2 + offset_bits);
    if (amplitude <= 8 - offset_bits) {
        *(shift_array + home_byte) |= ((0xFF >> (8 - amplitude)) << offset_bits);
        *(shift_array + home_byte + 1) |= 0x00;
    } else {
        *(shift_array + home_byte) |= (0xFF << offset_bits);
        *(shift_array + home_byte + 1) |= (0xFF >> (16 - (amplitude + offset_bits)));
    }
    IEC0bits.T3IE = 1;          // Enable Timer 3 interrupt
}

/* Edit bytes in memory corresponding to 7 segment display character LEDs */
void write_segments(char *text, unsigned int value) {
    IEC0bits.T3IE = 0;          // Disable Timer 3 interrupt
    for (unsigned char i = 0; i < 8; i++) {
        *(shift_array + 10 + i) = 0x00;
    }
    for (unsigned char i = 0; *(text + i) != '\0'; i++)
    {
        *(shift_array + 17 - i) = alphabet[*(text + i) - 48];
    }
    unsigned char j = 0;
    unsigned char remainder;
    while (value) {
        if (j > 3) {
            break;
        }
        remainder = value % 10;
        *(shift_array + 10 + j) = alphabet[remainder];
        value /= 10; 
        j++;
    }
    IEC0bits.T3IE = 1;          // Enable Timer 3 interrupt
}

/* Called by ISR to multiplex 7 segment display characters */
void step_selected_index(void) {
    character_index = (character_index + 1) % 8;
    *(shift_array + 18) = 0x01 << character_index;
}

//void clear_display(void) {
//    for (unsigned char i = 0; i < 12; i++) {
//        spi1_write(0x00);
//    }
//    latch_data();
//}

void latch_data(void) {
    while (SPI1STATLbits.SPITBF);   // wait for buffer to be empty
    DISPLAY_LATCH = 1; // latch in data to output
    LATCH = 1;
    intdelayus(50); // this length uncertain, but seems to work
    DISPLAY_LATCH = 0;
    LATCH = 0;
}

void clear_shift_array(void) {
    for (unsigned char i = 0; i < 19; i++) {
        *(shift_array + i) = 0x00;
    }
}

void clear_bargraph_data(void) {
    for (unsigned char i = 0; i < 10; i++) {
        *(shift_array + i) = 0x00;
    }
}

void clear_segment_data(void) {
    for (unsigned char i = 10; i < 18; i++) {
        *(shift_array + i) = 0x00;
    }
}

/* Set display setting with argument */
void display_blank_setting(unsigned char display_setting) {
    switch (display_setting) {
        case 0:     // bar graph LEDs and character display enabled
            BLANK = 0;
            DISPLAY_BLANK = 0; 
            break;
        case 1:     // disable bar graph LEDs
            BLANK = 1;
            DISPLAY_BLANK = 0;
            break;
        case 2:     // disable character display
            BLANK = 0;
            DISPLAY_BLANK = 1;
            break;
        case 3:     // disable bar graph LEDs and character display
            BLANK = 1;
            DISPLAY_BLANK = 1;
            break;
        default:
            break;
    }
}

void display_blank_setting_toggle(void) {
    display_setting = (display_setting + 1) % 4;
}

/* Code for display and LED animation at power on */
void display_test(void) {
    write_segments("TUNE", 1234);
    for (unsigned char amp = 0; amp < 11; amp++) {
        for (unsigned char i = 0; i < 8; i++) {
            write_bargraph(i, amp);
            delayms(50);
        }
        delayms(50);
        clear_bargraph_data();
    }
    for (unsigned char i = 0; i < 8; i++) {
        write_bargraph(i,2);
    }
}