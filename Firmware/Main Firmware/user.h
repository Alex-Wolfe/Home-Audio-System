
/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/


/******************************************************************************/
/* User Function Prototypes                                                   */
/******************************************************************************/

/* Delay by ms milliseconds 
    Uses Timer 2            */
void delayms(unsigned int ms);

/* Delay by us microseconds
 *     Uses Timer 2        */
void delayus(unsigned int us);

/* Delay by ms milliseconds 
    Uses Timer 4            */
void intdelayms(unsigned int ms);

/* Delay by us microseconds 
    Uses Timer 4            */
void intdelayus(unsigned int us);

/* Set input audio source*/
void set_source(unsigned char a);

/* Toggle through sources with each call */
void toggle_source(void);

/* positive change detected on volume encoder */
void volume_inc(void);

/* negative change detected on volume encoder */
void volume_dec(void);

/* positive change detected on tune encoder */
void tune_inc(void);

/* negative change detected on tune encoder */
void tune_dec(void);

/* Short debounce delay for button presses */
void debounce(void);


void write_vol_setting_to_display(void);