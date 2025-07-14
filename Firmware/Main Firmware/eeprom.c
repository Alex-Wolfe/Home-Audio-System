#include <xc.h>
#include "user.h"
#include "i2c.h"

#define EEPROM_SOURCE_ADD 0x01
#define EEPROM_FREQ_ADD 0x02


/* I2C 7 bit address */
const unsigned char eeprom_ic = 0x50;


/* Write data to byte at add*/
void write_eeprom(unsigned int add, unsigned char data) {
    unsigned int upper_add = add >> 8;
    unsigned int lower_add = add & 0x00FF;
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
    unsigned char received;
    unsigned int upper_add = add >> 8;
    unsigned int lower_add = add & 0x00FF;
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

void save_eeprom_source(unsigned char source_setting) {
    write_eeprom(EEPROM_SOURCE_ADD, source_setting);
}

unsigned char read_eeprom_source(void) {
    return read_eeprom(EEPROM_SOURCE_ADD);
}

void save_eeprom_frequency(unsigned char freq) {
    write_eeprom(EEPROM_FREQ_ADD, freq >> 8);
    write_eeprom(EEPROM_FREQ_ADD + 1, freq & 0x00FF);
}

unsigned int read_eeprom_frequency(void) {
    unsigned char upper_byte = read_eeprom(EEPROM_FREQ_ADD);
    unsigned char lower_byte = read_eeprom(EEPROM_FREQ_ADD + 1);
    unsigned int result = ((upper_byte << 8) + lower_byte);
    return result;
}