#include <xc.h>
#include "config.h"            /* variables/params used by user.c */
#include "pin_definitions.h"

/******************************************************************************/
/* Configuration Functions                                                    */
/******************************************************************************/

void config_app(void) {
    disable_LCD_module();
    configure_IO();
    enable_timer1();
    enable_timer2();
    enable_timer3();
    enable_timer4();
    enable_timer5();
    configure_debug_uart();
    configure_I2C_bus();
    configure_SPI1_port();
    configure_SPI2_port();
    configure_ADC();
    configure_interrupts();
    
    TEST = 0;           // heartbeat LED off
    
    PLAY_PAUSE = 1;     // set BT play/pause pin
    VOL_UP = 1;         // Set VOL up and dn signals to bluetooth high
    VOL_DN = 1;
    MFB = 0;
    
    FAN_EN = 1;         // Disable fan power supply
    FAN_PWM = 0;        // Disable fan power switch

    DISPLAY_LATCH = 0;  // Set output latch on LED display shift registers
    DISPLAY_BLANK = 0;  // Enable LEDs to be turned on
    LATCH = 0;          // Set latch on LED bar graph shift registers
    BLANK = 0;

    FM_nRST = 0;        // Initialize with FM radio in reset
}

void disable_LCD_module(void) {
    LCDCONbits.LCDEN = 0; // Disable LCD driver enable
    LCDSE0 = 0x0000; // Ensure digital IO control is given back to pins
    LCDSE1 = 0x0000;
    LCDSE2 = 0x0000;
    LCDSE3 = 0x0000;
    PMD6bits.LCDMD = 1; // Disable CD peripheral module
}

void configure_IO(void) {
    /* Configure Port A */
    TRISAbits.TRISA0 = 0; // set BT play/pause pin to digital output
    ANSELA = 0x0000;
    ODCA = 0x0000; // disable open drain mode, use normal output mode

    /* Configure Port B */
    TRISB = 0x33FF; // Set analog inputs and digital outputs
    ANSELB = 0x33FC;
    ODCB = 0x0000;

    /* Configure Port C */
    TRISCbits.TRISC13 = 1; // Set to digital inputs
    TRISCbits.TRISC14 = 1;
    ANSELCbits.ANSC13 = 0;
    ANSELCbits.ANSC14 = 0;

    /* Configure Port D */
    TRISD = 0x0C28; // Set digital inputs and outputs
    ANSELD = 0x0000;
    ODCD = 0x0000;

    /* Configure Port E */
    TRISE = 0x0079;
    ANSELE = 0x0000;
    ODCE = 0x0000;

    /* Configure Port F */
    TRISF = 0x0053;
    ANSELF = 0x0000;
    ODCF = 0x0000;
    
    /* Configure Port G */
    TRISGbits.TRISG2 = 0;
    TRISGbits.TRISG3 = 0;
    TRISGbits.TRISG7 = 1;
    TRISGbits.TRISG8 = 0;
    TRISGbits.TRISG9 = 0;
    ANSELG = 0x0000;
    ODCGbits.ODCG2 = 1; // Set I2C pins to open drain output
    ODCGbits.ODCG3 = 1;
}

void configure_SPI1_port(void) {
    SPI1BUFL = 0x0000;
    SPI1BUFH = 0x0000;
//    SPI1CON1Lbits.ENHBUF = 1;       // use enhanced buffer mode
    SPI1BRGL = 31;                  // 500kHz clock frequency
    SPI1STATLbits.SPIROV = 0;       // clear the overflow
    SPI1CON1Lbits.MSTEN = 1;        // enable master mode
    SPI1CON1Lbits.DISSDI = 1;       // disable SDI pin on SPI port 1
//    SPI1CON1Hbits.FRMEN = 1;        // use chip select as FSYNC
//    SPI1CON1Hbits.MSSEN = 1;        // give peripheral automatic control of CS
//    setup interrupts here
    SPI1CON1Lbits.SPIEN = 1;        // enable SPI
    RPOR11 = 0x0700;                  // Assign SDO pin
    RPOR12 = 0x0008;                  // Assign SCLK pin
}

void configure_SPI2_port(void) {
    SPI2BUFL = 0x0000;
    SPI2BUFH = 0x0000;
//    SPI2CON1Lbits.ENHBUF = 1;       // use enhanced buffer mode
    SPI2BRGL = 31;                  // 500kHz clock frequency
    SPI2STATLbits.SPIROV = 0;       // clear the overflow
    SPI2CON1Lbits.MSTEN = 1;        // enable master mode
    SPI2CON1Lbits.DISSDI = 1;       // disable SDI pin on SPI port 2
    SPI2CON1Hbits.FRMEN = 1;        // use chip select as FSYNC
    SPI2CON1Hbits.FRMSYPW = 1;      // frame sync is one serial word length
    SPI2CON1Hbits.MSSEN = 1;        // give peripheral automatic control of CS
    SPI2CON2Lbits.WLENGTH = 0b01010; // use 11 bit word lengths
//    setup interrupts here
    SPI2CON1Lbits.SPIEN = 1;        // enable SPI
    RPOR15 = 0x0A;                  // Assign MOSI Pin
    RPOR8 = 0x0B;                   // Assign SCLK Pin
    RPOR5 = 0xC0;                   // Assign CS Pin
//    RPINR22 = 0x0C;                 // Assign MISO Pin
}

void configure_I2C_bus(void) {
    I2C1CONL = 0x9200; // Enables I2C module
    I2C1BRG = 0x4E; // Sets clock to 100kHz
}

void configure_debug_uart(void) {
    /* Enable peripheral */
    PMD1bits.U1MD = 0;
    /* Assign peripheral pins */
//    RPINR18 = 0xFF1A; // Assign RXD to pin RG7 (RP26)
//    RPOR9 = 0x0300; // Assign TXD to pin RG8 (RP19)
    RPINR18 = 0xFF13;
    RPOR13 = 0x0003;
    /* Setup UART Settings */
    U1MODE = 0x0808; // 8 data bit, no parity, 1 stop bit
    /* Set baud rate to 115200 */
    U1BRG = 34;
    /* Setup interrupt and status control */
    // none
    /* Enable UARTx */
    U1MODEbits.UARTEN = 1;
}

void configure_interrupts(void) {
    /* Setting CPU interrupt priority to default level */
    SRbits.IPL0 = 0;
    SRbits.IPL1 = 0;
    SRbits.IPL2 = 0;
    /* Interrupt nesting is disabled */
    INTCON1bits.NSTDIS = 0;
    /* Standard vector table is used
       All external interrupts set to trigger on negative edge */
    INTCON2bits.AIVTEN = 0;
    INTCON2bits.INT0EP = 1;
    INTCON2bits.INT1EP = 1;
    INTCON2bits.INT2EP = 1;
    INTCON2bits.INT3EP = 1;
    INTCON2bits.INT4EP = 1;
    /* Configure interrupt-on-change for UI pins */
    IOCNFbits.IOCNF0 = 1;       //falling edge interrupt enable
    IOCPFbits.IOCPF0 = 1;       // rising edge interrupt enable
    IOCNFbits.IOCNF1 = 1;
    IOCPFbits.IOCPF1 = 1;
    IOCNEbits.IOCNE0 = 1;
    IOCPEbits.IOCPE0 = 1;
    IOCNEbits.IOCNE4 = 1;
    IOCPEbits.IOCPE4 = 1;
    IOCNEbits.IOCNE5 = 1;
    IOCPEbits.IOCPE5 = 1;
    IOCNDbits.IOCND10 = 1;
    IOCPDbits.IOCPD10 = 1;
    IOCNCbits.IOCNC13 = 1;
    IOCPCbits.IOCPC13 = 1;
    IOCNCbits.IOCNC14 = 1;
    IOCPCbits.IOCPC14 = 1;
    // IR interrupt not enabled
    /* Clear all interrupt flags */
    IFS0 = 0x0000;
    IFS1 = 0x0000;
    IFS2 = 0x0000;
    IFS3 = 0x0000;
    IFS4 = 0x0000;
    IFS5 = 0x0000;
    IFS6 = 0x0000;
    IFS7 = 0x0000;
    IOCFC = 0x0000;
    IOCFD = 0x0000;
    IOCFE = 0x0000;
    IOCFF = 0x0000;
    /* Enable global interrupt enable */
    INTCON2bits.GIE = 1;
    /* Enable peripheral interrupt enables as needed */
    IEC0bits.T1IE = 0;          // Disable Timer 1 interrupt, to be enabled in code
    IEC0bits.T3IE = 1;          // Enable Timer 3 interrupt
    IEC0bits.AD1IE = 1;         // Enable ADC interrupt
    IEC1bits.IOCIE = 1;         // Enable IOC interrupts
    PADCONbits.IOCON = 1;
    
}

/* Used to be used for heartbeat LED, now used to reset display state machine */
void enable_timer1(void) {
    /*  Set to keep timer running in idle mode
        Set to use internal clock
        Disable gated time accumulation */
    T1CONbits.TSIDL = 0;
    T1CONbits.TCS = 0;
    T1CONbits.TGATE = 0;
    T1CONbits.TCKPS0 = 1;       // Set prescaler to 256
    T1CONbits.TCKPS1 = 1;
    PR1 = 0xF424;
    T1CONbits.TON = 1;
}

/* Used for delay user functions */
void enable_timer2(void) {
    T2CONbits.TCS = 0;
    T2CONbits.T32 = 0;          // use as 16 bit timer
    T2CONbits.TCKPS0 = 1;       // set to prescalar of 256
    T2CONbits.TCKPS1 = 1;
    T2CONbits.TSIDL = 0;
    T2CONbits.TON = 1;
}

/* Used for 7 segment multiplexing */
void enable_timer3(void) {
    T3CONbits.TCS = 0;          // use as 16 bit timer
    T3CONbits.TCKPS0 = 1;       // set to prescalar of 256
    T3CONbits.TCKPS1 = 1;
    T3CONbits.TSIDL = 0;
    PR3 = 0x0040;             // set refresh rate to idek
    T3CONbits.TON = 1;
}

/* Used for user delays called by interrupts */
void enable_timer4(void) {
    T4CONbits.TCS = 0;
    T4CONbits.T32 = 0;          // use as 16 bit timer
    T4CONbits.TCKPS0 = 1;       // set to prescalar of 256
    T4CONbits.TCKPS1 = 1;
    T4CONbits.TSIDL = 0;
    T4CONbits.TON = 1;
}

/* General purpose timer */
void enable_timer5(void) {
    T5CONbits.TCS = 0;          // use as 16 bit timer
    T5CONbits.TCKPS0 = 1;       // set to prescalar of 256
    T5CONbits.TCKPS1 = 1;
    T5CONbits.TSIDL = 0;
    T5CONbits.TON = 1;
}

void configure_ADC(void) {
    AD1CON1 = 0x0474;           // 12 bit, free running mode
    AD1CON2 = 0x0C3C;           // Vcc reference, addressed buffer, scans inputs
    AD1CON3 = 0x1F08;           // sample time = 31Tad, Tad = 9Tcy
//    AD1CON4 = 0x0000;         // DMA control buffer
    AD1CON5 = 0x8000;           // enable auto scan
    AD1CHS = 0x1E00;            // mux B is measuring Vdd, Mux A starts at AN0
    AD1CSSL = 0xFFFF;           // include all 16 channels in scan
    AD1CON1bits.ADON = 1;       // enable ADC operation
}