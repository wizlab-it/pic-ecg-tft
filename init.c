/*
 * 20191227.026
 * ECG-TFT
 *
 * File: init.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "init.h"

/*==============================================================================
 * System initialization
 *============================================================================*/
void init(void) {
    //Init Oscillator
    OSCCONbits.IDLEN = 0;       //Device enters in sleep mode on SLEEP
    OSCCONbits.IRCF = 0b111;    //8MHz (Not used, since valid only for internal oscillator)
    OSCCONbits.SCS = 0b00;      //Uses crystal
    OSCTUNEbits.INTSRC = 1;
    OSCTUNEbits.TUN = 0;

    //Wait a bit...
    __delay_ms(100);

    //Disbale USB / Allows RC4 and RC5 as digital inputs
    UCONbits.USBEN = 0;
    UCFGbits.UTRDIS = 1;

    /*
    * PORT A
    *  - RA[7]: 0 (Not implemented)
    *  - RA[6]: 0 (Not available - used by XTAL)
    *  - RA[5]: 0 (Output, TFT WR)
    *  - RA[4]: 0 (Output, TFT RD)
    *  - RA[3]: 1 (Input, Unused)
    *  - RA[2]: 0 (Output, Led)
    *  - RA[1]: 1 (Input, Unused)
    *  - RA[0]: 1 (Analog Input, ECG)
    */
    TRISA = 0b00001011;
    LATA = 0x00;

    /*
    * PORT B
    *  - RB[7-0]: 0 (Digital output, TFT Data)
    */
    RBPU = 1; //Disable weak pull ups
    TRISB = 0x00;
    LATB = 0x00;

    /*
    * PORT C
    *  - RC[7]: 1 (Input, EUSART RX)
    *  - RC[6]: 1 (Input, EUSART TX)
    *  - RC[5]: 1 (Input, Positive lead detect)
    *  - RC[4]: 1 (Input, Negative lead detect)
    *  - RC[3]: 0 (Not implemented)
    *  - RC[2]: 0 (Output, TFT Reset)
    *  - RC[1]: 0 (Output, TFT CD/RS)
    *  - RC[0]: 0 (Output, TFT CS)
    */
    TRISC = 0b11110000;
    LATC = 0x00;

    //Init ADC
    ADCON0bits.ADON = 0;        //Disable A/D Module
    ADCON1bits.VCFG = 0b00;     //Limits are VSS to VDD
    ADCON1bits.PCFG = 0b1110;   //Analogs are: AN0
    ADCON2bits.ADFM = 1;        //Result is right justified
    ADCON2bits.ACQT = 0b000;    //No acquisition time
    ADCON2bits.ADCS = 0b010;    //FOSC/32 clock (to run up to 45MHz)

    //Timer3 - Used by MICROSECONDS (5ms tick)
    T3CONbits.T3CKPS = 0b00;
    T3CONbits.TMR3CS = 0;
    T3CONbits.TMR3ON = 1;
    TMR3IE = 1;

    //Interrupts
    PEIE = 1;
    GIE = 1;

    return;
}


/*==============================================================================
 * Sleep/delay function based on timer
 *============================================================================*/
void sleepMS(uint32_t ms) {
    uint32_t t = MILLISECONDS + ms;
    while(t > MILLISECONDS);
}


/*==============================================================================
 * Interrupt Service Routine
 *============================================================================*/
void __interrupt() isr(void) {
    //Timer3 Interrupt (used by MILLISECONDS)
    if(TMR3IE && TMR3IF) {
        MILLISECONDS += MILLISECONDS_TICK;
        Ecg_Interrupt();

        //Values to get 5ms tick
        TMR3H = 0x16;
        TMR3L = 0x00;
        TMR3IF = 0;
    }

    //EUSART RX Interrupt
    if(RCIE && RCIF) {
        EUSART_RX_Interrupt();
    }

    return;
}