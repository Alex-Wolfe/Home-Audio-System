/*
 * File:   main.c
 * Author: WolfeAlexD
 *
 * Created on June 18, 2025, 4:56 PM
 */

// PIC24FJ128GL306 Configuration Bit Settings

// 'C' source line config statements

// FSEC
#pragma config BWRP = OFF               // Boot Segment Write-Protect bit (Boot Segment may be written)
#pragma config BSS = DISABLED           // Boot Segment Code-Protect Level bits (No Protection (other than BWRP))
#pragma config BSEN = OFF               // Boot Segment Control bit (No Boot Segment)
#pragma config GWRP = OFF               // General Segment Write-Protect bit (General Segment may be written)
#pragma config GSS = DISABLED           // General Segment Code-Protect Level bits (No Protection (other than GWRP))
#pragma config CWRP = OFF               // Configuration Segment Write-Protect bit (Configuration Segment may be written)
#pragma config CSS = DISABLED           // Configuration Segment Code-Protect Level bits (No Protection (other than CWRP))
#pragma config AIVTDIS = OFF            // Alternate Interrupt Vector Table bit (Disabled AIVT)

// FBSLIM
#pragma config BSLIM = 0x1FFF           // Boot Segment Flash Page Address Limit bits (Enter Hexadecimal value)

// FOSCSEL
#pragma config FNOSC = PRI              // Oscillator Source Selection (Primary Oscillator (XT, HS, EC))
#pragma config PLLMODE = DISABLED       // PLL Mode Selection (No PLL used; PLLEN bit is not available)
#pragma config IESO = ON                // Two-speed Oscillator Start-up Enable bit (Start up device with FRC, then switch to user-selected oscillator source)

// FOSC
#pragma config POSCMD = HS              // Primary Oscillator Mode Select bits (HS Crystal Oscillator Mode)
#pragma config OSCIOFCN = ON            // OSC2 Pin Function bit (OSC2 is general purpose digital I/O pin)
#pragma config SOSCSEL = ON             // SOSC Power Selection Configuration bits (SOSC is used in crystal (SOSCI/SOSCO) mode)
#pragma config PLLSS = PLL_PRI          // PLL Secondary Selection Configuration bit (PLL is fed by the Primary oscillator)
#pragma config IOL1WAY = ON             // Peripheral pin select configuration bit (Allow only one reconfiguration)
#pragma config FCKSM = CSDCMD           // Clock Switching Mode bits (Both Clock switching and Fail-safe Clock Monitor are disabled)

// FWDT
#pragma config WDTPS = PS32768          // Watchdog Timer Postscaler bits (1:32,768)
#pragma config FWPSA = PR128            // Watchdog Timer Prescaler bit (1:128)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable bits (WDT and SWDTEN disabled)
#pragma config WINDIS = OFF             // Watchdog Timer Window Enable bit (Watchdog Timer in Non-Window mode)
#pragma config WDTWIN = WIN25           // Watchdog Timer Window Select bits (WDT Window is 25% of WDT period)
#pragma config WDTCMX = WDTCLK          // WDT MUX Source Select bits (WDT clock source is determined by the WDTCLK Configuration bits)
#pragma config WDTCLK = LPRC            // WDT Clock Source Select bits (WDT uses LPRC)

// FPOR
#pragma config BOREN = OFF              // Brown Out Enable bit (Brown Out Disabled)
#pragma config LPCFG = OFF              // Low power regulator control (No Retention Sleep)
#pragma config DNVPEN = ENABLE          // Downside Voltage Protection Enable bit (Downside protection enabled using ZPBOR when BOR is inactive)

// FICD
#pragma config ICS = PGD1               // ICD Communication Channel Select bits (Communicate on PGEC1 and PGED1)
#pragma config JTAGEN = OFF             // JTAG Enable bit (JTAG is disabled)

// FDMTIVTL
#pragma config DMTIVTL = 0xFFFF         // Deadman Timer Interval Low Word (Enter Hexadecimal value)

// FDMTIVTH
#pragma config DMTIVTH = 0xFFFF         // Deadman Timer Interval High Word (Enter Hexadecimal value)

// FDMTCNTL
#pragma config DMTCNTL = 0xFFFF         // Deadman Timer Instruction Count Low Word (Enter Hexadecimal value)

// FDMTCNTH
#pragma config DMTCNTH = 0xFFFF         // Deadman Timer Instruction Count High Word (Enter Hexadecimal value)

// FMDT
#pragma config DMTDIS = OFF             // Deadman Timer Enable Bit (Dead Man Timer is Disabled and can be enabled by software)

// FDEVOPT1
#pragma config ALTCMPI = DISABLE        // Alternate Comparator Input Enable bit (C2INC and C3INC are on their standard pin locations )
#pragma config TMPRPIN = OFF            // Tamper Pin Enable bit (TMPRN pin function is disabled)
#pragma config SOSCHP = ON              // SOSC High Power Enable bit (valid only when SOSCSEL = 1 (Enable SOSC high power mode (default))
#pragma config ALTI2C1 = ALTI2C1_OFF    // Alternate I2C pin Location (I2C1 Pin mapped to SDA1/SCL1 pins)
#pragma config SMB3EN = SMBUS3 

/******************************************************************************/
/*                      Files to Include                                      */
/******************************************************************************/

#include <xc.h>
#include "system.h"         // System functions/parameters
#include "debug_uart.h"     // Debug uart functions/parameters
#include "config.h"         // Config functions/paramters
#include "pin_definitions.h"
#include "i2c.h"
#include "spi.h"
#include "ambient_temp.h"
#include "user.h"
#include "eeprom.h"
#include "interrupts.h"     // Interrupt Handlers
#include "display.h"

/******************************************************************************/
/* Global Variable Declaration                                                */
/******************************************************************************/

const long fosc = 32000000;
const long fcy = 16000000;

/* I2C 7 bit addresses */
const char vol_pot = 0x2F;

/* Constants for Source Selection*/
const char AUX = 0;
const char BT = 1;
const char TV = 2;
const char FM = 3;

char fw_version[11] = "v0.1 Alpha";

float ambient_C;

unsigned char shift_array[12] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                0x00, 0x00, 0x00, 0x00};

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/

int main(void) {
    
    /* Disable reference oscillator */
    configure_oscillator();
    
    /* Initialize IO ports and peripherals */
    config_peripherals();
    
    /* Write FW version to debug UART header */
    write_debug_string(fw_version);
    
    /* Set source to AUX input*/
    set_source(AUX);
    
    TEST = 0;           // heartbeat LED off
    
    PLAY_PAUSE = 1;     // set BT play/pause pin
    
    IN_SEL_A = 0;       // Default to AUX input on startup (in future
    IN_SEL_B = 0;       // use EEPROM storage to remember previous setting)
    FAN_EN = 1;         // Disable fan power supply
    FAN_PWM = 0;        // Disable fan power switch
    
    VOL_UP = 1;         // Set VOL up and dn signals to bluetooth high
    VOL_DN = 1;
    DISPLAY_LATCH = 0;  // Set output latch on LED display shift registers
    DISPLAY_BLANK = 1;  // Turn all segment display LEDs off
    
    LATCH = 0;          // Set latch on LED bar graph shift registers
    BLANK = 1;
    MFB = 0;
    
    FM_nRST = 0;        // Initialize with FM radio in reset
    
    BLANK = 0;
    DISPLAY_BLANK = 0;
    
    while(1) {
        for (unsigned char i = 0; i < 8; i++) {
            for (unsigned char j = 0; j < 11; j++) {
                write_bargraph(i, j, shift_array);
                update_display(shift_array);
                delayms(100);
            }
        }
//        update_display(shift_array);
//        set_source(AUX);
//        delayms(50);
//        set_source(BT);
//        delayms(50);
//        set_source(TV);
//        delayms(50);
//        set_source(FM);
//        delayms(50);
    }
    
    return 0;
}