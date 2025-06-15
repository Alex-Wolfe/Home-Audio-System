#include <xc.h>
#include "user.h"
#include "i2c.h"


/* I2C 7 bit address */
const unsigned char eeprom_ic = 0x50;
unsigned int upper_add;
unsigned int lower_add;

unsigned char received;

/* Write data to byte at add*/
void write_eeprom(unsigned int add, unsigned char data) {
    upper_add = add >> 8;
    lower_add = 0x00FF | add;
    i2c_start();
    i2c_write_command(eeprom_ic);
    delayus(100);
    i2c_send_byte(upper_add);
    delayus(100);
    i2c_send_byte(lower_add);
    delayus(100);
    i2c_send_byte(data);
    i2c_stop();
    delayms(5);
}

/* Read data from byte at add*/
unsigned char read_eeprom(unsigned int add) {
    upper_add = add >> 8;
    lower_add = 0x00FF | add;
    i2c_start();
    i2c_write_command(eeprom_ic);
    delayus(100);
    i2c_send_byte(upper_add);
    delayus(100);
    i2c_send_byte(lower_add);
    delayus(100);
    i2c_restart();
    i2c_read_command(eeprom_ic);
    delayus(100);
    received = i2c_read_byte();
    i2c_gen_nack();
    i2c_stop();
    return received;
}