#include <xc.h>

#include "ambient_temp.h"
#include "i2c.h"

/* I2C 7 bit address */
const char ambient_temp = 0x4A;

unsigned char amb_tempH;
unsigned char amb_tempL;
unsigned int amb_temp;
float C;

/******************************************************************************/
/* LM75B Functions                                                    */
/******************************************************************************/

/* Read temperature register. Assume temp is always positive*/
float read_ambient_temp(void) {
    i2c_start();
    i2c_write_command(ambient_temp);
    i2c_send_byte(0x00);
    i2c_restart();
    i2c_read_command(ambient_temp);
    amb_tempH = i2c_read_byte();
    i2c_gen_ack();
    amb_tempL = i2c_read_byte();
    i2c_gen_nack();
    i2c_stop();
    amb_temp = (amb_tempH << 3) + (amb_tempL >> 5);
    C = amb_temp * 0.125;
    return C;
}