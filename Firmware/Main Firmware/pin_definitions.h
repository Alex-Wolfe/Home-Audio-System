/* Define output pins for Port A */
#define PLAY_PAUSE PORTAbits.RA0

/* Define output pins for Port B */
#define IN_SEL_A PORTBbits.RB11
#define IN_SEL_B PORTBbits.RB10
#define FAN_PWM PORTBbits.RB14
#define FAN_EN PORTBbits.RB15

/* Define digital input pins for Port C */
#define TUNE_A PORTCbits.RC14
#define TUNE_B PORTCbits.RC13

/* Define digital inputs and outputs for Port D */
#define VOL_UP PORTDbits.RD6
#define VOL_DN PORTDbits.RD7
#define DISPLAY_LATCH PORTDbits.RD8
#define DISPLAY_BLANK PORTDbits.RD9
#define VOL_A PORTDbits.RD10

/* Define digital inputs and outputs for Port E */
#define nSOURCE PORTEbits.RE0
#define LATCH PORTEbits.RE1
#define BLANK PORTEbits.RE2
#define nMULTI1 PORTEbits.RE4
#define nMULTI2 PORTEbits.RE5
#define AUX_DET PORTEbits.RE6
#define MFB PORTEbits.RE7

/* Define digital inputs and outputs for Port F */
#define VOL_B PORTFbits.RF0
#define nDISPLAY PORTFbits.RF1
#define FM_INT PORTFbits.RF4
#define FM_nRST PORTFbits.RF5

/* Define digital outputs for Port G */
#define TEST PORTGbits.RG9