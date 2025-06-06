
/******************************************************************************/
/* I2C Function Prototypes                                                   */
/******************************************************************************/
unsigned char i2c_idle_status(void);

void i2c_start(void);

void i2c_restart(void);

void i2c_stop(void);

void i2c_sendbyte(unsigned char byte);

void i2c_ack_wait(void);
