/*
 * 20191225.010
 * A6 GSM Module Library
 *
 * File: A6Lib.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "A6Lib.h"

void A6_Init(void) {
    A6_SpeedAutoDetect();
    sleepMS(2500);
}

uint8_t A6_IsAlive(void) {
    uint8_t loop = 3;
    char response[32];

    while(loop--) {
        A6_Command("AT\r", "aa", "bb", 0, response);
        if(strcmp(response, "OK") == 0) {
            return 1;
        }
    }
    return 0;
}

uint8_t A6_SpeedSet(const uint32_t speed) {
    char request[20];
    char response[32];

    //Send IPR Command
    sprintf(request, "AT+IPR=%lu\r", speed);
    A6_Command(request, "aa", "bb", 0, response);
    if(strcmp(response, "OK") == 0) {
        sleepMS(1000);

        //Set new speed on EUSART
        EUSART_SetSpeed(speed);
        if(A6_IsAlive() == 1) {
            //Store new speed and return successful response
            A6_SPEED = speed;
            return 1;
        }
    }

    //If here, new speed has not been set, restore EUSART original speed and return error
    EUSART_SetSpeed(A6_SPEED);
    return 0;
}

void A6_SpeedAutoDetect(void) {
    uint32_t speeds[] = { 9600, 57600, 115200 };

    char zzzz[EUSART_LINE_SIZE];

    printLine("Detecting speed...", _TFT_COLOR_MAGENTA);

    for(uint8_t i=0; i<3; i++) {
        EUSART_SetSpeed(speeds[i]);
        if(A6_IsAlive() == 1) {
            sprintf(zzzz, "%lu FOUND!", speeds[i]);
            printLine(zzzz, _TFT_COLOR_RED);
            A6_SPEED = speeds[i];
            return;
        }
        sleepMS(250);
    }
}

void A6_ReadLine(char *response, int timeout) {
    uint8_t iLine = 0;
    while(1) {
        uint32_t t = MILLISECONDS + timeout;
        while(EUSART_RX.iRead == EUSART_RX.iWrite) {
            if(t < MILLISECONDS) return;
        }
        EUSART_RX.iRead++;
        if(EUSART_RX.buffer[EUSART_RX.iRead] == '\r') break;
        response[iLine] = EUSART_RX.buffer[EUSART_RX.iRead];
        iLine++;
    }
    response[iLine] = 0x00;
    return;
}

void A6_Command(const char *command, const char *resp1, const char *resp2, uint16_t timeout, char *response) {
    if(timeout == 0) timeout = A6_TIMEOUT_DEFAULT;
    memset(response, 0x00, sizeof(response));

    EUSART_RX.iRead = EUSART_RX.iWrite;
    EUSART_TX_String(command, strlen(command));

    //Skip initial CRLF
    do {
        uint32_t t = MILLISECONDS + timeout;
        while(EUSART_RX.iRead == EUSART_RX.iWrite) {
            if(t < MILLISECONDS) return;
        }
        EUSART_RX.iRead++;
    } while(EUSART_RX.buffer[EUSART_RX.iRead] != '\n');

    //Get response
    A6_ReadLine(response, timeout);

    return;
}