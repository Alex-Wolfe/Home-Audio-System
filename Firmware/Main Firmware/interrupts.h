#include <xc.h>

#define ISR __attribute__((interrupt(auto_psv)))

/* Declare Functions */

/* Service Timer 1 overflow interrupt */
void ISR _T1Interrupt(void);