#include <xc.h>
#include "user.h"
#include "i2c.h"
#include "spi.h"

/******************************************************************************/
/* EQ_POT Global Variables                                                  */
/******************************************************************************/




/******************************************************************************/
/* VOL POT Functions                                                         */
/******************************************************************************/

void set_right_low_level(unsigned char val) {   //255 is max
    spi2_write(val >> 3);
    spi2_write(val << 5);
}

void set_right_high_level(unsigned char val) {
    spi2_write(0x20 | (val >> 3));
    spi2_write(val << 5);
}

void set_left_low_level(unsigned char val) {
    spi2_write(0x40 | (val >> 3));
    spi2_write(val << 5);
}

void set_left_high_level(unsigned char val) {
    spi2_write(0x60 | (val >> 3));
    spi2_write(val << 5);
}

void set_eq(unsigned char lo, unsigned char hi) {
    set_right_low_level(lo);
    set_right_high_level(hi);
    set_left_low_level(lo);
    set_left_high_level(hi);
}

void init_eq(void) {
    set_right_low_level(128);
    delayus(10);
    set_right_high_level(128);
    delayus(10);
    set_left_low_level(128);
    delayus(10);
    set_left_high_level(128);
}