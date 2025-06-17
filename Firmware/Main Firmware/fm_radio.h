
/******************************************************************************/
/* FM Radio #define Macros                                                  */
/******************************************************************************/


/******************************************************************************/
/* FM Radio Function Prototypes                                                   */
/******************************************************************************/

void powerdown_FM(void);

void send_command_byte(unsigned char command);

unsigned char get_FM_int_status(void);

void poll_CTS(void);

void poll_STC(void);

void enable_FM(void);

void FM_tune_freq(unsigned int freq);

void FM_seek_start(unsigned char direction);

void FM_antenna_select(unsigned char band);