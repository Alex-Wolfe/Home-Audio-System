#include <xc.h>
#include "i2c.h"            /* variables/params used by user.c */

#define ACKEN I2C1CONLbits.ACKEN        // Acknowledge Sequence Enable bit
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

void i2c_start(void)
{
    SEN = 1;                    // Initiate start condition
    while (SEN);                // Wait for start condition to be complete 
}

void i2c_repeated_start(void)
{
    RSEN = 1;                   // Initiate repeated start condition
    while (RSEN);               // Wait for start condition to be complete
}

void i2c_stop(void)
{
    PEN = 1;                    // Initiate a stop condition
    while (PEN);                // Wait for stop condition to be complete
}

void i2c_sendbyte(unsigned char byte)
{
    I2C1TRN = byte;
}

void i2c_ack_wait(void)
{
    while(ACKSTAT);
    // add code here for timeout wait
}