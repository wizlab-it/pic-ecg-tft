/*
 * 20200103.041
 * A6 GSM Module Library
 *
 * File: A6Lib.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */


#ifndef A6LIB_H
#define	A6LIB_H

#include "commons.h"

#define A6_NEXT_COMMAND_WAIT_TIME       75

#define	A6_NETWORK_STATUS_IDLE          0
#define	A6_NETWORK_STATUS_REGISTERED    1
#define	A6_NETWORK_STATUS_SEARCHING     2
#define	A6_NETWORK_STATUS_DENIED        3
#define	A6_NETWORK_STATUS_UNKNOWN       4
#define	A6_NETWORK_STATUS_ROAMING       5

#define A6_SIM_A6_ERROR     0
#define A6_SIM_UNKNOWN      1
#define A6_SIM_MISSING      2
#define A6_SIM_READY        3
#define A6_SIM_PIN          4

const uint32_t A6_BAUDRATES[] = { 9600, 57600, 115200 };
uint32_t A6_LAST_COMMAND_MILLISECONDS = 0;

uint8_t A6_Init(const uint32_t baudRate);
void A6_Command(const char *command, int16_t timeout, char *response, uint8_t responseLen);
uint8_t A6_ReadLine(char *line, uint8_t len, int16_t timeout);
uint8_t A6_IsAlive(void);
void A6_Process_Random_Comms(void);

uint32_t A6_BaudRate_Get(void);
uint32_t A6_BaudRate_Set(const uint32_t baudRate);
uint32_t A6_BaudRate_AutoDetect(void);

uint8_t A6_SIM_Status(void);

uint8_t A6_Network_Status(void);
uint8_t A6_Network_IsConnected(void);
uint8_t A6_Network_RSSI(void);
int8_t A6_Network_RSSILevel(void);
int8_t A6_Network_Operator(char *operator, uint8_t operatorLen);

uint8_t A6_GPRS_Status(void);
uint8_t A6_GPRS_IsConnected(void);
uint8_t A6_GPRS_Connect(const char apn[]);
uint8_t A6_GPRS_Disconnect(void);

uint8_t A6_TCP_Open(const char ipAddress[], uint16_t port, uint16_t timeout);
void A6_TCP_Close(void);
int16_t A6_TCP_ReadByteArray(uint8_t *arr, uint8_t len, int16_t timeout);

#endif