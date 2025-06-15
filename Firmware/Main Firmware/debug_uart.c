#include <xc.h>
#include <stdio.h>
#include "debug_uart.h"

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

void write_debug_byte(unsigned char byte) {
    while (U1STAbits.UTXBF);
    U1TXREG = byte;
} 

void write_debug_string(char *text) {
    /* Arrays passed to functions decay to pointer*/
    U1STAbits.UTXEN = 1;            // Enable UART transmitter
    while (!U1STAbits.TRMT);        // check and wait for previous tx
    for (unsigned char i = 0; *(text + i) != '\0'; i++)
    {
        write_debug_byte(*(text + i));  // shift byte to transmit buffer
    }
    write_debug_newline();
    while (!U1STAbits.TRMT);        // wait for all bytes to be shifted out
    U1STAbits.UTXEN = 0;            // Disable UART transmitter
}

void write_debug_newline(void) {
    while (U1STAbits.UTXBF);
    write_debug_byte(0x0A);
}

void write_debug_int(unsigned int N) {
    unsigned char i = 1;
    unsigned char rev_str[6];
    char str[6];
//    sprintf(str, "%d", N);
    rev_str[0] = '\0';
    while (N > 0) {
        rev_str[i] = (N % 10) + '0'; // convert digit to char
        N /= 10;
        i++;
    }
    for (int k = 0; k < i; k++) {
        str[k] = rev_str[i-k-1];
    }
    write_debug_string(str);
}

//void write_debug_float(double f) {
//    char str[10];
//    sprintf(str, "%f", f);
//    write_debug_string(str);
//}