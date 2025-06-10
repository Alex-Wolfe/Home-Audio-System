#include <xc.h>
#include "config.h"            /* variables/params used by user.c */
#include "pin_definitions.h"

/******************************************************************************/
/* Configuration Functions                                                    */

/******************************************************************************/

void config_peripherals(void) {
    disable_LCD_module();
    enable_timer1();
    enable_timer2();
    configure_IO();
    configure_debug_uart();
    configure_I2C_bus();
    configure_SPI1_port();
    configure_SPI2_port();
    configure_ADC();
    configure_interrupts();

}

void disable_LCD_module(void) {
    PMD6bits.LCDMD = 1; // Disable LCD peripheral module
    LCDCONbits.LCDEN = 0; // Disable LCD driver enable
    LCDSE0 = 0x0000; // Ensure digital IO control is given back to pins
    LCDSE1 = 0x0000;
    LCDSE2 = 0x0000;
    LCDSE3 = 0x0000;
}

void configure_IO(void) {
    /* Configure Port A */
    TRISAbits.TRISA0 = 0; // set BT play/pause pin to digital output
    ANSELA = 0x0000;
    ODCA = 0x0000; // disable open drain mode, use normal output mode
    PLAY_PAUSE = 1; // set BT play/pause pin

    /* Configure Port B */
    TRISB = 0x33FF; // Set analog inputs and digital outputs
    ANSELB = 0x33FC;
    ODCB = 0x0000;
    IN_SEL_A = 0; // Default to AUX input on startup (in future
    IN_SEL_B = 0; // use EEPROM storage to remember previous setting)
    FAN_EN = 1; // Disable fan power supply
    FAN_PWM = 0; // Disable fan power switch

    /* Configure Port C */
    TRISCbits.TRISC13 = 1; // Set to digital inputs
    TRISCbits.TRISC14 = 1;
    ANSELCbits.ANSC13 = 0;
    ANSELCbits.ANSC14 = 0;

    /* Configure Port D */
    TRISD = 0x0C28; // Set digital inputs and outputs
    ANSELD = 0x0000;
    ODCD = 0x0000;
    VOL_UP = 1; // Set VOL up and dn signals to bluetooth high
    VOL_DN = 1;
    DISPLAY_LATCH = 0; // Set output latch on LED display shift registers
    DISPLAY_BLANK = 1; // Turn all segment display LEDs off

    /* Configure Port E */
    TRISE = 0x0079;
    ANSELE = 0x0000;
    ODCE = 0x0000;
    LATCH = 0; // Set latch on LED bar graph shift registers
    BLANK = 1; // Turn bar graph LEDs off
    MFB = 0; // Disable power on signal to bluetooth radio

    /* Configure Port F */
    TRISF = 0x0053;
    ANSELF = 0x0000;
    ODCF = 0x0000;
    FM_nRST = 0; // Initialize with FM radio in reset

    /* Configure Port G */
    TRISGbits.TRISG2 = 0;
    TRISGbits.TRISG3 = 0;
    TRISGbits.TRISG7 = 1;
    TRISGbits.TRISG8 = 0;
    TRISGbits.TRISG9 = 0;
    ANSELG = 0x0000;
    ODCGbits.ODCG2 = 1; // Set I2C pins to open drain output
    ODCGbits.ODCG3 = 1;
    TEST = 0;
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
}

void configure_SPI2_port(void) {
    SPI2BUFL = 0x0000;
    SPI2BUFH = 0x0000;
//    SPI2CON1Lbits.ENHBUF = 1;       // use enhanced buffer mode
    SPI2BRGL = 31;                  // 500kHz clock frequency
    SPI2STATLbits.SPIROV = 0;       // clear the overflow
    SPI2CON1Lbits.MSTEN = 1;        // enable master mode
//    SPI2CON1Hbits.FRMEN = 1;        // use chip select as FSYNC
//    SPI2CON1Hbits.MSSEN = 1;        // give peripheral automatic control of CS
//    setup interrupts here
    SPI2CON1Lbits.SPIEN = 1;        // enable SPI
}

void configure_I2C_bus(void) {
    I2C1CONL = 0x9200; // Enables I2C module
    I2C1BRG = 0x4E; // Sets clock to 100kHz
}

void configure_debug_uart(void) {
    /* Enable peripheral */
    PMD1bits.U1MD = 0;

    /* Assign peripheral pins */
    RPINR18 = 0xFF1A; // Assign RXD to pin RG7 (RP26)
    RPOR9 = 0x0300; // Assign TXD to pin RG8 (RP19)

    /* Setup UART Settings */
    U1MODE = 0x0808; // 8 data bit, no parity, 1 stop bit

    /* Set baud rate to 115200 */
    U1BRG = 16;

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

    /* Clear all interrupt flags */
    IFS0 = 0x0000;
    IFS1 = 0x0000;
    IFS2 = 0x0000;
    IFS3 = 0x0000;
    IFS4 = 0x0000;
    IFS5 = 0x0000;
    IFS6 = 0x0000;
    IFS7 = 0x0000;

    /* Enable global interrupt enable */
    INTCON2bits.GIE = 1;
    /* Enable peripheral interrupt enables as needed */
    IEC0bits.T1IE = 1;          //Enable Timer 1 interrupt
    IEC0bits.AD1IE = 1;         // Enable ADC interrupt
}

void enable_timer1(void) {
    /*  Set to keep timer running in idle mode
        Set to use internal clock
        Disable gated time accumulation */
    T1CONbits.TSIDL = 0;
    T1CONbits.TCS = 0;
    T1CONbits.TGATE = 0;
    /*  Set prescaler to 1:256
        Write value to period register to get 0.5 second period
        Enable Timer 1 */
    T1CONbits.TCKPS0 = 1;
    T1CONbits.TCKPS1 = 1;
    PR1 = 0x7A12;
    T1CONbits.TON = 1;
}

void enable_timer2(void) {
    T2CONbits.TCS = 0;
    T2CONbits.T32 = 0;          // use as 16 bit timer
    T2CONbits.TCKPS0 = 1;       // set to prescalar of 8
    T2CONbits.TCKPS1 = 0;
    T2CONbits.TSIDL = 0;
    T2CONbits.TON = 1;
}

void configure_ADC(void) {
    AD1CON1 = 0x0474;           // 12 bit, free running mode
    AD1CON2 = 0x0C3C;           // Vcc reference, addressed buffer, scans inputs
    AD1CON3 = 0x1F08;           // sample time = 31Tad, Tad = 9Tcy
//    AD1CON4 = 0x0000;           // DMA control buffer
    AD1CON5 = 0x8000;           // enable auto scan
    AD1CHS = 0x1E00;            // mux B is measuring Vdd, Mux A starts at AN0
    AD1CSSL = 0xFFFF;           // incluce all 16 channels in scan
    ADCON1bits.ADON = 1;        // enable ADC operation
}