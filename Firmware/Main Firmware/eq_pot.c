#include <xc.h>
#include "user.h"
#include "i2c.h"
#include "spi.h"
#include "pin_definitions.h"

/******************************************************************************/
/* EQ_POT Global Variables                                                    */
/******************************************************************************/




/******************************************************************************/
/* EQ POT Functions                                                           */
/******************************************************************************/

void set_right_low_level(unsigned char val) {   //255 is max
    SPI_CS = 0;
    spi2_write(0x00);
    spi2_write(val);
    delayus(50);
    SPI_CS = 1;
    delayus(20);
}

void set_right_high_level(unsigned char val) {
    SPI_CS = 0;
    spi2_write(0x01);
    spi2_write(val);
    delayus(50);
    SPI_CS = 1;
    delayus(20);
}

void set_left_low_level(unsigned char val) {
    SPI_CS = 0;
    spi2_write(0x02);
    spi2_write(val);
    delayus(50);
    SPI_CS = 1;
    delayus(20);
}

void set_left_high_level(unsigned char val) {
    SPI_CS = 0;
    spi2_write(0x03);
    spi2_write(val);
    delayus(50);
    SPI_CS = 1;
    delayus(20);
}

void set_eq(unsigned char lo, unsigned char hi) {
//    SPI_CS = 0;
//    set_right_low_level(lo);
//    delayus(20);
//    set_right_high_level(hi);
//    delayus(20);
//    set_left_low_level(lo);
//    delayus(20);
//    set_left_high_level(hi);
//    delayus(20);
//    SPI_CS = 1;
}

void init_eq(void) {
    set_right_low_level(128);
    delayus(20);
    set_right_high_level(128);
    delayus(20);
    set_left_low_level(128);
    delayus(20);
    set_left_high_level(128);
}