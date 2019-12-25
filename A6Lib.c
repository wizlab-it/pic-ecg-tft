/*
 * 20191225.013
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
    char response[32];

    uint8_t loop = 3;
    while(loop--) {
        A6_Command("AT\r", "aa", "bb", 0, response, 32);
        if(strcmp(response, "OK") == 0) {
            return 1;
        }
    }
    return 0;
}

uint32_t A6_SpeedGet(void) {
    uint32_t speed;
    char *speedToken;
    char response[32];

    uint8_t loop = 5;
    while(loop--) {
        A6_Command("AT+IPR?\r", "aa", "bb", 0, response, 32);
        if(strstr(response, "+IPR: ") != NULL) {
            speedToken = strtok(response, " ");
            speedToken = strtok(NULL, response);
            if(speedToken != NULL) {
                speed = atol(speedToken);
                for(uint8_t j=0; j<3; j++) {
                    if(speed == A6_SPEEDS[j]) {
                        return speed;
                    }
                }
            }
        }
        sleepMS(250);
    }

    return 0;
}

uint32_t A6_SpeedSet(const uint32_t speed) {
    char request[20];
    char response[32];
    uint32_t currentSpeed = A6_SpeedGet();

    //If unable to detect current speed then exit
    if(currentSpeed == 0) return 0;

    //Send IPR Command
    sprintf(request, "AT+IPR=%lu\r", speed);
    A6_Command(request, "aa", "bb", 0, response, 32);
    printLine(request, _TFT_COLOR_GREEN);
    printLine(response, _TFT_COLOR_GREEN);
    if(strcmp(response, "OK") == 0) {
        //Set new speed on EUSART
        EUSART_SetSpeed(speed);
        sleepMS(150);
        if(A6_IsAlive() == 1) {
            return speed;
        }
    }

    //If here, new speed has not been set, restore EUSART original speed and return error
    EUSART_SetSpeed(currentSpeed);
    return 0;
}

uint32_t A6_SpeedAutoDetect(void) {
    printLine("Detecting speed...", _TFT_COLOR_MAGENTA);

    for(uint8_t i=0; i<3; i++) {
        EUSART_SetSpeed(A6_SPEEDS[i]);
        if(A6_IsAlive() == 1) {
            char zzzz[32];
            sprintf(zzzz, "%lu FOUND!", A6_SPEEDS[i]);
            printLine(zzzz, _TFT_COLOR_RED);
            return A6_SPEEDS[i];
        }
        sleepMS(250);
    }

    return 0;
}

void A6_ReadLine(char *response, uint8_t responseLen, int timeout) {
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
        if(iLine == responseLen) break;
    }

    return;
}

void A6_Command(const char *command, const char *resp1, const char *resp2, uint16_t timeout, char *response, uint8_t responseLen) {
    if(timeout == 0) timeout = A6_TIMEOUT_DEFAULT;
    memset(response, 0x00, responseLen);

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
    A6_ReadLine(response, responseLen, timeout);

    return;
}