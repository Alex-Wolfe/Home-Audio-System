
#define ISR __attribute__((interrupt(auto_psv)))

/* Declare Functions */

/* Service Timer 1 overflow interrupt */
void ISR _T1Interrupt(void);

/* Interrupt when ADC buffer has been filled */
void ISR _ADC1Interrupt(void);

