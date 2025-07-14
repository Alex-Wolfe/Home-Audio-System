/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/


/******************************************************************************/
/* User Function Prototypes                                                   */
/******************************************************************************/

/* Write data to word at add*/
void write_eeprom(unsigned int add, unsigned char data);

/* Read data from byte at add*/
unsigned char read_eeprom(unsigned int add);

/* Save setting for input source */
void save_eeprom_source(unsigned char source_setting);

/* Read source setting from eeprom */
unsigned char read_eeprom_source(void);

/* Save setting for tuner frequency */
void save_eeprom_frequency(unsigned char freq);

/* Read frequency setting from eeprom */
unsigned int read_eeprom_frequency(void);