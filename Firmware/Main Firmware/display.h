
/******************************************************************************/
/* I2C Function Prototypes                                                    */
/******************************************************************************/

/* Takes in and modifies shift register array */
void update_display(unsigned char *array);

/* Index selects bar graph LED that represent a certain audio band, can be 0-7*/
/* Amplitude values can be 0-10*/
void write_bargraph(unsigned char index, unsigned char amplitude, 
                    unsigned char *array);

void clear_display(void);

void latch_data(void);

void clear_array(unsigned char *array);