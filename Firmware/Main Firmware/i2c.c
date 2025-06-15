#include <xc.h>
#include "i2c.h"            /* variables/params used by user.c */
#include "debug_uart.h"

#define ACKEN I2C1CONLbits.ACKEN        // Acknowledge Sequence Enable bit
#define ACKDT I2C1CONLbits.ACKDT        // Low for ACK, High for NACK
#define RCEN I2C1CONLbits.RCEN          // Receive Enable bit
#define PEN I2C1CONLbits.PEN            // Stop Condition Enable bit
#define RSEN I2C1CONLbits.RSEN          // Restart Condition Enable bit
#define SEN I2C1CONLbits.SEN            // Start Condition Enable bit
#define ACKSTAT I2C1STATbits.ACKSTAT    // Acknowledge Status bit
#define TRSTAT I2C1STATbits.TRSTAT      // Transmit Status bit
#define IWCOL I2C1STATbits.IWCOL        // I2Cx Write Collision Detect bit
#define I2COV I2C1STATbits.I2COV        // I2Cx Receive Overflow Flag bit
#define P I2C1STATbits.P                // Indicates that a Stop bit has been detected last
#define S I2C1STATbits.S                // Indicates that a Start bit has been detected last
#define RBF I2C1STATbits.RBF            // Receive Buffer Full Status bit 
#define TBF I2C1STATbits.TBF            // Transmit Buffer Full Status bit 

/******************************************************************************/
/* I2C Functions                                                              */
/******************************************************************************/


unsigned char i2c_idle_status(void) {
    return (TRSTAT | ACKEN | RCEN | PEN | RSEN | SEN);  //return true if busy
}

void i2c_start(void) {
    while (i2c_idle_status());      // wait for bus to be idle
    SEN = 1;                        // Initiate start condition
    while (SEN);                    // Wait for start condition to be complete 
}

void i2c_restart(void) {
    while (i2c_idle_status());      // wait for bus to be idle
    RSEN = 1;                       // Initiate repeated start condition
    while (RSEN);                   // Wait for start condition to be complete
}

void i2c_stop(void) {
    while (i2c_idle_status());      // wait for bus to be idle
    PEN = 1;                        // Initiate a stop condition
    while (PEN);                    // Wait for stop condition to be complete
}

void i2c_send_byte(unsigned char byte) {        // send data byte out to bus
    I2C1TRN = byte;
    i2c_ack_wait();
}

unsigned char i2c_read_byte(void) {
    while (i2c_idle_status());      // wait for bus to be idle
    RCEN = 1;
    while (!RBF);
    return I2C1RCV;                 // return received byte
 }

void i2c_write_command(unsigned char address) {     // argument is 7 bit address
    i2c_send_byte(address << 1);
}

void i2c_read_command(unsigned char address) {      // argument is 7 bit address
    i2c_send_byte((address << 1) + 1);
}

void i2c_ack_wait(void) {
    T2CONbits.TCKPS0 = 1;       // set to prescalar of 256
    T2CONbits.TCKPS1 = 1;
    TMR2 = 0x0000;
    while (ACKSTAT) {       // wait for slave ack, timeout after 10ms
        if (TMR2 >= 625) {
            write_debug_string("i2c ack timeout");
            return;
        }
    }
}

void i2c_gen_ack(void) {        // send ack to slave
    while (i2c_idle_status());
    ACKDT = 0;
    ACKEN = 1;
    while (ACKEN);
}

void i2c_gen_nack(void) {       // send nack to slave
    while (i2c_idle_status());
    ACKDT = 1;
    ACKEN = 1;
    while (ACKEN);
}