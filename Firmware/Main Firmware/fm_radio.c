#include <xc.h>
#include "pin_definitions.h"
#include "fm_radio.h"
#include "user.h"
#include "i2c.h"

/******************************************************************************/
/* FM Radio Global Variables                                                  */
/******************************************************************************/


/* I2C 7 bit address */
const unsigned char fm_radio = 0x11;


/******************************************************************************/
/* FM Radio Functions                                                         */
/******************************************************************************/


void powerdown_FM(void) {
    FM_nRST = 0;
}

void send_command_byte(unsigned char command) {
    i2c_start();
    i2c_write_command(fm_radio);
    i2c_send_byte(command);
}

unsigned char get_FM_int_status(void) {
    send_command_byte(0x14);
    i2c_restart();
    i2c_read_command(fm_radio);
    unsigned char int_status = i2c_read_byte();
    i2c_gen_nack();
    i2c_stop();
    delayus(3);
    return int_status;
}

void poll_CTS(void) {
    delayus(3);
    while (1) {
        unsigned char flag = get_FM_int_status();
        if (flag & 0x80){
            return;
        }
        delayus(10);
    }
}

void poll_STC(void) {
    delayus(3);
    while (1) {
        unsigned char flag = get_FM_int_status();
        if (flag & 0x01){
            return;
        }
        delayus(10);
    }
}

void enable_FM(void) {
    FM_nRST = 1;
    delayus(1);
    send_command_byte(0x01);    // send power up command
    i2c_send_byte(0xD0);        // enable cts interrupt, crystal, gpo2
    i2c_send_byte(0x05);
    i2c_restart();
    i2c_read_command(fm_radio);
    i2c_read_byte();        // not interested in status byte
    i2c_gen_nack();
    i2c_stop();
    poll_CTS();
    delayus(3);
    
    send_command_byte(0x80);    // enable GPO pins as outputs
    i2c_send_byte(0x0E);
    i2c_restart();
    i2c_read_command(fm_radio);
    i2c_read_byte();        // not interested in status byte
    i2c_gen_nack();
    i2c_stop();
    poll_CTS();
    delayus(3);
    
    send_command_byte(0x12);    // configure interrupt sources
    i2c_send_byte(0x00);
    i2c_send_byte(0x00);
    i2c_send_byte(0x01);
    i2c_send_byte(0x00);
    i2c_send_byte(0x81);        // set cts and stc as interrupt sources
    i2c_stop();
    poll_CTS();
    delayms(500);
}


void FM_tune_freq(unsigned int freq) {
    send_command_byte(0x20);
    i2c_send_byte(0x02);
    i2c_send_byte(freq >> 8);
    i2c_send_byte(freq & 0x00FF);
    i2c_send_byte(0x00);
    i2c_restart();
    i2c_read_command(fm_radio);
    i2c_read_byte();        // not interested in status byte
    i2c_gen_nack();
    i2c_stop();
    poll_STC();
    delayus(3);
}

void FM_seek_start(unsigned char direction) {
    send_command_byte(0x21);
    if (direction) {           // if direction true, seek up
        i2c_send_byte(0x06);
    }
    else {
        i2c_send_byte(0x02);
    }
    i2c_restart();
    i2c_read_command(fm_radio);
    i2c_read_byte();        // not interested in status byte
    i2c_gen_nack();
    i2c_stop();
    poll_STC();
    delayus(3);
}

void FM_antenna_select(unsigned char band) {
    send_command_byte(0x81);
    if (band) {             // if band true, set to SW band
        i2c_send_byte(0x02);
    }
    else {
        i2c_send_byte(0x00);
    }
}
