/*
 * 20191229.028
 * ECG-TFT
 *
 * File: eusart.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "EUSART.h"

void EUSART_Init(void) {
    //TX Register
    TXSTAbits.TX9 = 0;      //8-bit TX
    TXSTAbits.TXEN = 1;     //Enable TX
    TXSTAbits.SYNC = 0;     //Asynchronous
    TXSTAbits.SENDB = 0;    //Sync Break transmission completed
    TXSTAbits.BRGH = 1;     //High baud rate

    //RX Register
    RCSTAbits.SPEN = 1;     //Enable EUSART
    RCSTAbits.RX9 = 0;      //8-bit RX
    RCSTAbits.CREN = 1;     //Enable RX

    //Baud rate generator
    BAUDCONbits.BRG16 = 1;  //16-bit baud rate generator
    BAUDCONbits.WUE = 0;    //No wake-up
    BAUDCONbits.ABDEN = 0;  //No auto baud detect
    SPBRGH = 0x04;          //Set baud rate (9600bps)
    SPBRG = 0xE1;           //Set baud rate (9600bps)

    //Interrupts
    RCIE = 1; //EUSART RX

    //Init RX Buffer
    EUSART_RX.iRead = 0;
    EUSART_RX.iWrite = 0;
    memset(EUSART_RX.buffer, 0x00, EUSART_BUFFER_SIZE);
}

void EUSART_BaudRateSet(const uint32_t baudRate) {
    TXSTAbits.SYNC = 0;     //Asynchronous
    TXSTAbits.BRGH = 1;     //High baud rate
    BAUDCONbits.BRG16 = 1;  //16-bit baud rate generator

    uint32_t tmp = (_XTAL_FREQ / baudRate);
    tmp = tmp / 4;
    tmp--;

    SPBRG = (uint8_t) tmp;
    SPBRGH = (uint8_t) (tmp >> 8);

    return;
}

void EUSART_TX_Char(uint8_t c) {
    while(TXIF == 0) { }
    TXREG = c;
    __asm("nop");
}

void EUSART_TX_String(const char *str, uint8_t len) {
    while(len--) {
        EUSART_TX_Char(*str++);
    }
}

void EUSART_RX_Interrupt(void) {
    uint8_t c = RCREG;
    if(OERR == 1) {
        CREN = 0;
        CREN = 1;
    }

    EUSART_RX.iWrite++;
    if(EUSART_RX.iWrite == EUSART_BUFFER_SIZE) EUSART_RX.iWrite = 0;
    EUSART_RX.buffer[EUSART_RX.iWrite] = c;
    return;
}

void EUSART_RX_Flush(void) {
    EUSART_RX.iRead = EUSART_RX.iWrite;
}

uint8_t EUSART_RX_AvailableData(int16_t timeout) {
    if(timeout == 0) timeout = EUSART_TIMEOUT_DEFAULT;
    uint32_t t = MILLISECONDS + timeout;
    while(EUSART_RX.iRead == EUSART_RX.iWrite) {
        if(t < MILLISECONDS) return 0;
    }
    return 1;
}

char EUSART_BufferGetChar(int16_t timeout) {
    if(EUSART_RX_AvailableData(timeout) == 0) return NULL;
    EUSART_RX.iRead++;
    if(EUSART_RX.iRead == EUSART_BUFFER_SIZE) EUSART_RX.iRead = 0;
    return EUSART_RX.buffer[EUSART_RX.iRead];
}