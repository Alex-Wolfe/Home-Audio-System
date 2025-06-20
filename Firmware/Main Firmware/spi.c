#include <xc.h>
#include "spi.h"            /* variables/params used by user.c */
#include "debug_uart.h"

#define SPI1BUSY SPI1STATLbits.SPIBUSY
#define SPI1TBE SPI1STATLbits.SPITBE
#define SPI1TBF SPI1STATLbits.SPITBF
#define SPI1RBE SPI1STATLbits.SPIRBE
#define SPI1RBF SPI1STATLbits.SPIRBF

#define SPI2BUSY SPI2STATLbits.SPIBUSY
#define SPI2TBE SPI2STATLbits.SPITBE
#define SPI2TBF SPI2STATLbits.SPITBF
#define SPI2RBE SPI2STATLbits.SPIRBE
#define SPI2RBF SPI2STATLbits.SPIRBF

/******************************************************************************/
/* SPI Functions                                                              */
/******************************************************************************/

void spi1_write(unsigned char byte) {
    while (SPI1TBF);        // wait for buffer to be empty
    SPI1BUFL = byte;        // load byte into buffer   
}

void spi2_write(unsigned char byte) {
    while (SPI2TBF);                // wait for buffer to be empty
    SPI2BUFL = byte;                // load byte into buffer  
    while (SPI2RBE);
    unsigned char x = SPI2BUFL;     // read the buffer to clear the rx out
}

