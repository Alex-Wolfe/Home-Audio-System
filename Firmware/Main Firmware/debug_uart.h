
/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/


/******************************************************************************/
/* User Function Prototypes                                                   */
/******************************************************************************/

/* Send byte over UART1 */
void write_debug_byte(unsigned char byte);

/* Send string of bytes over UART1 */
/* Arrays passed to functions decay to pointer*/
void write_debug_string(char *text);

/* Send LF over UART */
void write_debug_newline(void);

/* Convert int to string and send over UART1 */
void write_debug_int(unsigned int N);

///* Convert float to string and send over UART1 */
//void write_debug_float(double f);