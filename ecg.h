/*
 * 20191227.041
 * ECG-TFT
 *
 * File: ecg.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#ifndef ECG_H
#define	ECG_H

#include <stdio.h>
#include "commons.h"

#define ECG_ANALOG_CHANNEL      0b0000          //Analog Channel AN0
#define ECG_LO_P_OFF            PORTCbits.RC5   //Positive lead detect
#define ECG_LO_N_OFF            PORTCbits.RC4   //Negative lead detect
#define ECG_GRAPH_BLANK_SPACE   20              //Blank space after current point
#define ECG_GRAPH_TOP_OFFSET    33              //Space at top of display not used by graph
#define ECG_BUFFER_SIZE         4               //ECG buffer for heart beat detection
#define ECG_HEARTBEAT_SIZE      3               //Heartbeat buffer for heart rate calculation
#define ECG_HEARTBEAT_THRESHOLD 60              //Delta threshold for heartbeat detection
#define ECG_DELAY_SAMPLE        10              //Delay between ECG samples
#define ECG_DELAY_HEARTRATE     1200            //Delay between heart rate update
#define ECG_DELAY_HEART_ICON    100             //How long heart icon is shown on heartbeat
#define ECG_DELAY_HEARTBEAT     250             //How long suspend heartbeat detection after a heartbeat

//Structs
struct {
    unsigned unused : 1;
    unsigned leadsOk : 1;
    unsigned leadsOkFlag : 1;
    unsigned processHeartRate : 1;
    unsigned processInterrupt : 1;
    unsigned processEcg : 1;
    unsigned msecDelay : 3;
} ECG_FLAGS;

struct {
    unsigned unused : 6;
    unsigned processHeartbeat : 1;
    unsigned heartIconShown : 1;
    uint8_t heartIconMsecDelay;
    uint8_t heartbeatMsecDelay;
    uint8_t msecDelay;
} ECG_HEARTRATE;

struct {
    uint32_t data[ECG_HEARTBEAT_SIZE];
    uint8_t i;
} ECG_HEARTBEAT;

struct {
    uint8_t data[ECG_BUFFER_SIZE];
    uint8_t i;
} ECG_BUFFER;

//Variables
uint16_t Ecg_X = _TFT_WIDTH - 1;
uint16_t Ecg_Xold = _TFT_WIDTH - 1;
uint16_t Ecg_Y = _TFT_HEIGHT - 1;
uint16_t Ecg_Yold = _TFT_HEIGHT - 1;

//Functions
void Ecg_Init(void);
void Ecg_Process(void);
void Ecg_ProcessInterrupt(void);
void Ecg_ProcessEcg(void);
void Ecg_ProcessHeartRate(void);
void Ecg_ProcessHeartbeat(void);
void Ecg_Interrupt(void);
uint16_t Ecg_CheckLeads(void);
uint16_t Ecg_Read(void);
void Ecg_Draw(void);
void Ecg_Background_Leads_Ok(void);
void Ecg_Background_Leads_Failure(void);

//Icons
const uint8_t ECG_ICON_HEART[] = {
    20, 20,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0xf0, 0x01, 0xfc, 0xf9, 0x03,
    0xfc, 0xff, 0x03, 0xfe, 0xff, 0x07, 0xfe, 0xff, 0x07, 0xfe, 0xff, 0x07,
    0xfe, 0xff, 0x07, 0xfc, 0xff, 0x03, 0xfc, 0xff, 0x03, 0xf8, 0xff, 0x01,
    0xf0, 0xff, 0x00, 0xe0, 0x7f, 0x00, 0xc0, 0x3f, 0x00, 0x80, 0x1f, 0x00,
    0x00, 0x0f, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};
#endif