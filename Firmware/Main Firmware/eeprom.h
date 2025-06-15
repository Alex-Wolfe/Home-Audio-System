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