#include <xc.h>
#include "spi.h"
#include "display.h"
#include "pin_definitions.h"
#include "user.h"

/******************************************************************************/
/* Display Functions                                                          */
/******************************************************************************/


/*  Updates shift registers with data array starting at "array"
    Assumes there are 12 bytes stored in the shift register array */
void update_display(unsigned char *array) {
    for (unsigned char i = 0; i < 12; i++) {
        spi1_write(*(array + 11-i));
    }
    latch_data();
}

/* Edit bytes in memory corresponding to selected bar graph LED */
void write_bargraph(unsigned char index, unsigned char amplitude, 
                    unsigned char *array) {
    unsigned char first_bit = 10 * index;
    unsigned char home_byte = first_bit / 8;
    unsigned char offset_bits = first_bit % 8;
    unsigned char first_byte = 0xFF;
    *(array + home_byte) |= (first_byte << offset_bits);

    *(array + home_byte + 1) |= first_byte >> (6-offset_bits);
}

void clear_display(void) {
    for (unsigned char i = 0; i < 12; i++) {
        spi1_write(0x00);
    }
    latch_data();
}

void latch_data(void) {
    DISPLAY_LATCH = 1;      // latch in data to output
    LATCH = 1;
    delayus(500);
    DISPLAY_LATCH = 0;
    LATCH = 0;
}

void clear_array(unsigned char *array) {
    for (unsigned char i = 0; i < 12; i++) {
        *(array + 11 - i) = 0x00;
    }
}