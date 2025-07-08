#include <xc.h>
#include "user.h"
#include "i2c.h"

/******************************************************************************/
/* VOL_POT Global Variables                                                  */
/******************************************************************************/


/* I2C 7 bit address */
const unsigned char vol_pot = 0x2F;


/******************************************************************************/
/* VOL POT Functions                                                         */

/******************************************************************************/


void set_right_volume(unsigned char right) {    //255 is max volume
    i2c_start();
    i2c_write_command(vol_pot);
    i2c_send_byte(0x80);
    i2c_send_byte(right);
    i2c_stop();
}

void set_left_volume(unsigned char left) {
    i2c_start();
    i2c_write_command(vol_pot);
    i2c_send_byte(0x00);
    i2c_send_byte(left);
    i2c_stop();
}

void set_volume(unsigned char right, unsigned char left) {
    set_right_volume(right);
    delayus(10);
    set_left_volume(left);
}

void mute_right(void) {
    i2c_start();
    i2c_write_command(vol_pot);
    i2c_send_byte(0xC0);
    i2c_send_byte(0x00);
    i2c_stop();
}

void mute_left(void) {
    i2c_start();
    i2c_write_command(vol_pot);
    i2c_send_byte(0x40);
    i2c_send_byte(0x00);
    i2c_stop();
}

void mute(void) {
    mute_right();
    delayus(10);
    mute_left();
}