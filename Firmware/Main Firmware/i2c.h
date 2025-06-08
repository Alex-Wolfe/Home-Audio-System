
/******************************************************************************/
/* I2C Function Prototypes                                                    */
/******************************************************************************/
unsigned char i2c_idle_status(void);

void i2c_start(void);

void i2c_restart(void);

void i2c_stop(void);

void i2c_sendbyte(unsigned char byte);

unsigned char i2c_read_byte(void);

void i2c_write_command(unsigned char address);

void i2c_read_command(unsigned char address);

void i2c_ack_wait(void);

void i2c_gen_ack(void);

void i2c_gen_nack(void);