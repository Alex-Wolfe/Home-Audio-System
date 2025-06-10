
/******************************************************************************/
/* Config Function Prototypes                                                   */
/******************************************************************************/

/* Run all functions to configure micro */
void config_peripherals(void);

/* Disable LCD peripheral */
void disable_LCD_module(void);

/* Configure digital and analog IO pins*/
void configure_IO(void);

/* Set up SPI1 port for handling EQ potentiometer*/
void configure_SPI1_port(void);

/* Set up SPI2 port for handling LED shift registers*/
void configure_SPI2_port(void);

/* Set up I2C port for handling communications to FM radio, temp sensor, EEPROM,
   and volume potentiometer */
void configure_I2C_bus(void);

/* Set up debug uart port*/
void configure_debug_uart(void);

/*Configure interrupts */
void configure_interrupts(void);

/*Enable timer 1*/
void enable_timer1(void);

/* Enable timer 2 */
void enable_timer2(void);

/* Set up ADC */
void configure_ADC(void)