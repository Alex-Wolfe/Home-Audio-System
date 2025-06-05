#include <xc.h>

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
/* I2C Function Prototypes                                                   */
/******************************************************************************/


unsigned char i2c_read_request(unsigned char add);

unsigned char i2c_write_request(unsigned char add);

