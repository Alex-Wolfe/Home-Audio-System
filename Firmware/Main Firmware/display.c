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
        spi1_write(*(array + i));
    }
    DISPLAY_LATCH = 1;      // latch in data to output
    LATCH = 1;
    delayus(10);
    DISPLAY_LATCH = 0;
    LATCH = 0;
}

/* Edit bytes in memory corresponding to selected bar graph LED */
void write_bargraph(unsigned char index, unsigned char amplitude, 
                    unsigned char *array) {
    // since bar graph is 10 LEDs, write lower two bits of byte above
    *(array + 10*index + 1) |= (0x03 >> (10-amplitude));
    // active all leds in bar graph up to amplitude level (0-10))
    *array + 10*index = 0xFF >> (8-amplitude);
}
