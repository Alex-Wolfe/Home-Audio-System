
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

/* Set input audio source*/
void set_source(unsigned char a);

/* Toggle through sources with each call */
void toggle_source(void);

void restore_settings(void);

/* handle debouncing of source button with interrupt on change */
void handle_source_button(void);

/* handle debouncing of display button with interrupt on change */
void handle_display_button(void);

void handle_nMULTI1(void);

void handle_nMULTI2(void);

void handle_volume_encoder(void);

void volume_encoder_inc(void);

void volume_encoder_dec(void);

void update_pots(void);

void init_volume(void);

void handle_tune_encoder(void);

void tune_encoder_inc(void);

void tune_encoder_dec(void);

void update_ADC_memory(void);

unsigned char get_bar_from_adc(unsigned int counts);

void update_bargraphs_with_adc(void);

void loop_handler(void);

void update_display(void);

void set_volume_timeout_flag(void);

void volume_timeout(void);

void set_screen_refresh_flag(void);