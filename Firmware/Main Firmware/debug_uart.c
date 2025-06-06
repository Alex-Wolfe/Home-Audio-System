#include <xc.h>

#include "user.h"

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

void write_debug_byte(char byte)
{
    while (U1STAbits.UTXBF);
    U1TXREG = byte;
} 

void write_debug_string(char *text)
{
    /* Arrays passed to functions decay to pointer*/
    U1STAbits.UTXEN = 1;            // Enable UART transmitter
    while (!U1STAbits.TRMT);        // check and wait for previous tx
    for (unsigned char i = 0; *(text + 1) != '\0'; i++)
    {
        write_debug_byte(*(text + 1));  // shift byte to transmit buffer
    }
    write_debug_newline();
    while (!U1STAbits.TRMT);        // wait for all bytes to be shifted out
    U1STAbits.UTXEN = 0;            // Disable UART transmitter
}

void write_debug_newline(void)
{
    while (U1STAbits.UTXBF);
    write_debug_byte(0x0A);
}