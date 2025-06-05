
/******************************************************************************/
/* I2C Function Prototypes                                                   */
/******************************************************************************/

void i2c_start(void);

void i2c_repeated_start(void);

void i2c_stop(void);

void i2c_sendbyte(unsigned char byte);

void i2c_ack_wait(void);
