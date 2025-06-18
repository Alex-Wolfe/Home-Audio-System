/* Define output pins for Port A */
#define PLAY_PAUSE LATAbits.LATA0

/* Define output pins for Port B */
#define IN_SEL_A LATBbits.LATB11
#define IN_SEL_B LATBbits.LATB10
#define FAN_PWM LATBbits.LATB14
#define FAN_EN LATBbits.LATB15

/* Define digital input pins for Port C */
#define TUNE_A PORTCbits.RC14
#define TUNE_B PORTCbits.RC13

/* Define digital inputs and outputs for Port D */
#define VOL_UP LATDbits.LATD6
#define VOL_DN LATDbits.LATD7
#define DISPLAY_LATCH LATDbits.LATD8
#define DISPLAY_BLANK LATDbits.LATD9
#define VOL_A PORTDbits.RD10

/* Define digital inputs and outputs for Port E */
#define nSOURCE PORTEbits.RE0
#define LATCH LATEbits.LATE1
#define BLANK LATEbits.LATE2
#define nMULTI1 PORTEbits.RE4
#define nMULTI2 PORTEbits.RE5
#define AUX_DET PORTEbits.RE6
#define MFB LATEbits.LATE7

/* Define digital inputs and outputs for Port F */
#define VOL_B PORTFbits.RF0
#define nDISPLAY PORTFbits.RF1
#define FM_INT PORTFbits.RF4
#define FM_nRST LATFbits.LATF5

/* Define digital outputs for Port G */
#define TEST LATGbits.LATG9