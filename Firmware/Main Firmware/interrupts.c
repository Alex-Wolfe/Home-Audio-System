#include <xc.h>
#include "interrupts.h"
#include "pin_definitions.h"
#include "display.h"
#include "user.h"

/******************************************************************************/
/* Interrupt Vector Options                                                   */
/******************************************************************************/
/*                                                                            */
/* Refer to the C30 (MPLAB C Compiler for PIC24F MCUs and dsPIC33F DSCs) User */
/* Guide for an up to date list of the available interrupt options.           */
/* Alternately these names can be pulled from the device linker scripts.      */
/*                                                                            */
/* PIC24F Primary Interrupt Vector Names:                                     */
/*                                                                            */
/* _INT0Interrupt      _IC4Interrupt                                          */
/* _IC1Interrupt       _IC5Interrupt                                          */
/* _OC1Interrupt       _IC6Interrupt                                          */
/* _T1Interrupt        _OC5Interrupt                                          */
/* _Interrupt4         _OC6Interrupt                                          */
/* _IC2Interrupt       _OC7Interrupt                                          */
/* _OC2Interrupt       _OC8Interrupt                                          */
/* _T2Interrupt        _PMPInterrupt                                          */
/* _T3Interrupt        _SI2C2Interrupt                                        */
/* _SPI1ErrInterrupt   _MI2C2Interrupt                                        */
/* _SPI1Interrupt      _INT3Interrupt                                         */
/* _U1RXInterrupt      _INT4Interrupt                                         */
/* _U1TXInterrupt      _RTCCInterrupt                                         */
/* _ADC1Interrupt      _U1ErrInterrupt                                        */
/* _SI2C1Interrupt     _U2ErrInterrupt                                        */
/* _MI2C1Interrupt     _CRCInterrupt                                          */
/* _CompInterrupt      _LVDInterrupt                                          */
/* _CNInterrupt        _CTMUInterrupt                                         */
/* _INT1Interrupt      _U3ErrInterrupt                                        */
/* _IC7Interrupt       _U3RXInterrupt                                         */
/* _IC8Interrupt       _U3TXInterrupt                                         */
/* _OC3Interrupt       _SI2C3Interrupt                                        */
/* _OC4Interrupt       _MI2C3Interrupt                                        */
/* _T4Interrupt        _U4ErrInterrupt                                        */
/* _T5Interrupt        _U4RXInterrupt                                         */
/* _INT2Interrupt      _U4TXInterrupt                                         */
/* _U2RXInterrupt      _SPI3ErrInterrupt                                      */
/* _U2TXInterrupt      _SPI3Interrupt                                         */
/* _SPI2ErrInterrupt   _OC9Interrupt                                          */
/* _SPI2Interrupt      _IC9Interrupt                                          */
/* _IC3Interrupt                                                              */
/*                                                                            */
/*                                                                            */                                              
/*                                                                            */
/* void __attribute__((interrupt,auto_psv)) <Vector Name>(void)               */
/* {                                                                          */
/*     <Clear Interrupt Flag>                                                 */
/* }                                                                          */
/*                                                                            */
/* For more comprehensive interrupt examples refer to the C30 (MPLAB C        */
/* Compiler for PIC24 MCUs and dsPIC DSCs) User Guide in the                  */
/* <compiler installation directory>/doc directory for the latest compiler    */
/* release.                                                                   */
/*                                                                            */
/******************************************************************************/
/* Interrupt Routines                                                         */
/******************************************************************************/

void ISR _T1Interrupt(void) {
    /* if one second passes without volume encoder movement, and device is in 
       ADJUST_VOLUME state, then go back to SOURCE_STATUS default state */
    set_volume_timeout_flag();
    IFS0bits.T1IF = 0;
    IEC0bits.T1IE = 0;      // disable interrupt
}

void ISR _T3Interrupt(void) {
    step_selected_index();  //increment character to be multiplexed
    refresh_display();
    IFS0bits.T3IF = 0;
}

void ISR _ADC1Interrupt(void) {
    update_ADC_memory();
    IFS0bits.AD1IF = 0;
}

void ISR _IOCInterrupt(void) {
    if (IOCFFbits.IOCFF1) {         // interrupt on nDISPLAY
        handle_display_button();    // handle debouncing
        IFS1bits.IOCIF = 0;
        IOCFFbits.IOCFF1 = 0;
    }
    else if (IOCFEbits.IOCFE0) {    // interrupt on nSOURCE
        handle_source_button();     // handle debouncing
        IFS1bits.IOCIF = 0;
        IOCFEbits.IOCFE0 = 0;
    }
    else if (IOCFEbits.IOCFE4) {    // interrupt on nMULTI1
        handle_nMULTI1();           // handle short and long presses for menu options
        IFS1bits.IOCIF = 0;
        IOCFEbits.IOCFE4 = 0;
    }
    else if (IOCFEbits.IOCFE5) {    // interrupt on nMULTI2
        handle_nMULTI2();           // handle short and long presses for menu options
        IFS1bits.IOCIF = 0;
        IOCFEbits.IOCFE5 = 0;
    }
    else if (IOCFDbits.IOCFD10) {   // interrupt on VOL A
        handle_volume_encoder();
        IFS1bits.IOCIF = 0;
        IOCFDbits.IOCFD10 = 0;
    }
    else if (IOCFFbits.IOCFF0) {    // interrupt on VOL B
        handle_volume_encoder();
        IFS1bits.IOCIF = 0;
        IOCFFbits.IOCFF0 = 0;
    }
    else if (IOCFCbits.IOCFC14) {   // interrupt on TUNE A
        handle_tune_encoder();
        IFS1bits.IOCIF = 0;
        IOCFCbits.IOCFC14 = 0;
    }
    else if (IOCFCbits.IOCFC13) {   // interrupt on TUNE B
        handle_tune_encoder();
        IFS1bits.IOCIF = 0;
        IOCFCbits.IOCFC13 = 0;
    }
    else {
        IFS1bits.IOCIF = 0;
    }
}