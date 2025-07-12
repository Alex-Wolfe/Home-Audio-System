
/******************************************************************************/
/* Display Function Prototypes                                                    */
/******************************************************************************/

/* Takes in and modifies shift register array */
void update_display(void);

/* Index selects bar graph LED that represent a certain audio band, can be 0-7*/
/* Amplitude values can be 0-10*/
void write_bargraph(unsigned char index, unsigned char amplitude);

void write_first_segments_text(char *text);

void write_first_segments_int(unsigned int value);

void write_second_segments_text(char *text);

void write_second_segments_int(unsigned int value);

void step_selected_index(void);

//void clear_display(void);

void latch_data(void);

void clear_shift_array(void);

void clear_bargraph_data(void);

void clear_segment_data(void);

void display_blank_setting(unsigned char display_setting);

void display_blank_setting_toggle(void);

void display_test(void);