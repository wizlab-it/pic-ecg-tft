/*
 * 20200104.033
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

void EUSART_Interrupt(void) {
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

void EUSART_Flush(void) {
    EUSART_RX.iRead = EUSART_RX.iWrite;
}

void EUSART_Trim(uint8_t *arr) {
    uint8_t len = strlen(arr);
    while(1) {
        len--;
        if((arr[len] == '\r') || (arr[len] == '\n')) {
            arr[len] = 0x00;
        } else {
            break;
        }
    }
}

void EUSART_SendByte(uint8_t b) {
    while(TXIF == 0) { }
    TXREG = b;
    __asm("nop");
}

void EUSART_SendByteArray(const uint8_t *arr, uint8_t len) {
    while(len--) {
        EUSART_SendByte(*arr++);
    }
}

uint8_t EUSART_Available(int16_t timeout) {
    if(timeout == EUSART_USE_DEFAULT_TIMEOUT) timeout = EUSART_TIMEOUT_DEFAULT;
    uint32_t t = MILLISECONDS + timeout;
    while(EUSART_RX.iRead == EUSART_RX.iWrite) {
        if(t < MILLISECONDS) return EUSART_RX_AVAILABLE_NO;
    }
    return EUSART_RX_AVAILABLE_YES;
}

int16_t EUSART_PeekByte(int16_t timeout) {
    if(EUSART_Available(timeout) == EUSART_RX_AVAILABLE_NO) return EUSART_RX_NODATA;
    uint16_t iPeek = EUSART_RX.iRead + 1;
    if(iPeek == EUSART_BUFFER_SIZE) iPeek = 0;
    return EUSART_RX.buffer[iPeek];
}

int16_t EUSART_ReadByte(int16_t timeout) {
    if(EUSART_Available(timeout) == EUSART_RX_AVAILABLE_NO) return EUSART_RX_NODATA;
    EUSART_RX.iRead++;
    if(EUSART_RX.iRead == EUSART_BUFFER_SIZE) EUSART_RX.iRead = 0;
    return EUSART_RX.buffer[EUSART_RX.iRead];
}

uint8_t EUSART_ReadLine(char *line, uint8_t len, int16_t timeout) {
    line[0] = 0x00;
    len--;

    //Read data
    int16_t b;
    uint8_t iLine = 0;
    while(b = EUSART_ReadByte(timeout)) {
        if(b == EUSART_RX_NODATA) break;
        line[iLine++] = b;
        if(iLine == len) break;
        if(b == '\r') {
            if(EUSART_PeekByte(timeout) == '\n') {
                line[iLine++] = EUSART_ReadByte(timeout);
                break;
            }
        }
    }
    line[iLine] = 0x00;
    return iLine;
}