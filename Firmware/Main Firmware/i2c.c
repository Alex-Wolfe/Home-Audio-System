#include <xc.h>
#include <stdbool.h>         /* For true/false definition */

#include "i2c.h"            /* variables/params used by user.c */

/******************************************************************************/
/* I2C Functions                                                    */
/******************************************************************************/

unsigned char i2c_read_request(unsigned char add)
{
    if (!P)
    {
        return 0;               // If start bit was not detected last, return fail
    }
    SEN = 1;
    while (SEN);                // Wait for start condition to be complete
    I2C1TRN = (add << 1) + 1;   // Send address with read bit
    while (ACKSTAT);            // Add code here for timeout check
    return 1;
}

unsigned char i2c_write_request(unsigned char add)
{
    if (!P)
    {
        return 0;               // If start bit was not detected last, return fail
    }
    SEN = 1;
    while (SEN);                // Wait for start condition to be complete
    I2C1TRN = (add << 1);       // Send address with write bit
    while (ACKSTAT);            // Add code here for timeout check
    return 1;
}