
#define ISR __attribute__((interrupt(auto_psv)))

/* Declare Functions */

/* Service Timer 1 overflow interrupt */
void ISR _T1Interrupt(void);

/* Service Timer 3 overflow interrupt */
void ISR _T3Interrupt(void);

/* Interrupt when ADC buffer has been filled */
void ISR _ADC1Interrupt(void);

/* Interrupt when change detected on UI signal */
void ISR _IOCInterrupt(void);