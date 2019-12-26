
# 1 "ecg.c"

# 4 "/opt/microchip/xc8/v2.10/pic/include/__size_t.h"
typedef unsigned size_t;

# 7 "/opt/microchip/xc8/v2.10/pic/include/c90/stdarg.h"
typedef void * va_list[1];

#pragma intrinsic(__va_start)
extern void * __va_start(void);

#pragma intrinsic(__va_arg)
extern void * __va_arg(void *, ...);

# 43 "/opt/microchip/xc8/v2.10/pic/include/c90/stdio.h"
struct __prbuf
{
char * ptr;
void (* func)(char);
};

# 29 "/opt/microchip/xc8/v2.10/pic/include/c90/errno.h"
extern int errno;

# 12 "/opt/microchip/xc8/v2.10/pic/include/c90/conio.h"
extern void init_uart(void);

extern char getch(void);
extern char getche(void);
extern void putch(char);
extern void ungetch(char);

extern __bit kbhit(void);

# 23
extern char * cgets(char *);
extern void cputs(const char *);

# 88 "/opt/microchip/xc8/v2.10/pic/include/c90/stdio.h"
extern int cprintf(char *, ...);
#pragma printf_check(cprintf)



extern int _doprnt(struct __prbuf *, const register char *, register va_list);


# 180
#pragma printf_check(vprintf) const
#pragma printf_check(vsprintf) const

extern char * gets(char *);
extern int puts(const char *);
extern int scanf(const char *, ...) __attribute__((unsupported("scanf() is not supported by this compiler")));
extern int sscanf(const char *, const char *, ...) __attribute__((unsupported("sscanf() is not supported by this compiler")));
extern int vprintf(const char *, va_list) __attribute__((unsupported("vprintf() is not supported by this compiler")));
extern int vsprintf(char *, const char *, va_list) __attribute__((unsupported("vsprintf() is not supported by this compiler")));
extern int vscanf(const char *, va_list ap) __attribute__((unsupported("vscanf() is not supported by this compiler")));
extern int vsscanf(const char *, const char *, va_list) __attribute__((unsupported("vsscanf() is not supported by this compiler")));

#pragma printf_check(printf) const
#pragma printf_check(sprintf) const
extern int sprintf(char *, const char *, ...);
extern int printf(const char *, ...);

# 18 "/opt/microchip/xc8/v2.10/pic/include/xc.h"
extern const char __xc8_OPTIM_SPEED;

extern double __fpnormalize(double);


# 13 "/opt/microchip/xc8/v2.10/pic/include/c90/xc8debug.h"
#pragma intrinsic(__builtin_software_breakpoint)
extern void __builtin_software_breakpoint(void);

# 52 "/opt/microchip/xc8/v2.10/pic/include/pic18f2455.h"
extern volatile unsigned short UFRM __attribute__((address(0xF66)));

asm("UFRM equ 0F66h");




extern volatile unsigned char UFRML __attribute__((address(0xF66)));

asm("UFRML equ 0F66h");


typedef union {
struct {
unsigned FRM :8;
};
struct {
unsigned FRM0 :1;
unsigned FRM1 :1;
unsigned FRM2 :1;
unsigned FRM3 :1;
unsigned FRM4 :1;
unsigned FRM5 :1;
unsigned FRM6 :1;
unsigned FRM7 :1;
};
struct {
unsigned FRML :8;
};
} UFRMLbits_t;
extern volatile UFRMLbits_t UFRMLbits __attribute__((address(0xF66)));

# 137
extern volatile unsigned char UFRMH __attribute__((address(0xF67)));

asm("UFRMH equ 0F67h");


typedef union {
struct {
unsigned FRM :3;
};
struct {
unsigned FRM8 :1;
unsigned FRM9 :1;
unsigned FRM10 :1;
};
} UFRMHbits_t;
extern volatile UFRMHbits_t UFRMHbits __attribute__((address(0xF67)));

# 177
extern volatile unsigned char UIR __attribute__((address(0xF68)));

asm("UIR equ 0F68h");


typedef union {
struct {
unsigned URSTIF :1;
unsigned UERRIF :1;
unsigned ACTVIF :1;
unsigned TRNIF :1;
unsigned IDLEIF :1;
unsigned STALLIF :1;
unsigned SOFIF :1;
};
} UIRbits_t;
extern volatile UIRbits_t UIRbits __attribute__((address(0xF68)));

# 233
extern volatile unsigned char UIE __attribute__((address(0xF69)));

asm("UIE equ 0F69h");


typedef union {
struct {
unsigned URSTIE :1;
unsigned UERRIE :1;
unsigned ACTVIE :1;
unsigned TRNIE :1;
unsigned IDLEIE :1;
unsigned STALLIE :1;
unsigned SOFIE :1;
};
} UIEbits_t;
extern volatile UIEbits_t UIEbits __attribute__((address(0xF69)));

# 289
extern volatile unsigned char UEIR __attribute__((address(0xF6A)));

asm("UEIR equ 0F6Ah");


typedef union {
struct {
unsigned PIDEF :1;
unsigned CRC5EF :1;
unsigned CRC16EF :1;
unsigned DFN8EF :1;
unsigned BTOEF :1;
unsigned :2;
unsigned BTSEF :1;
};
} UEIRbits_t;
extern volatile UEIRbits_t UEIRbits __attribute__((address(0xF6A)));

# 340
extern volatile unsigned char UEIE __attribute__((address(0xF6B)));

asm("UEIE equ 0F6Bh");


typedef union {
struct {
unsigned PIDEE :1;
unsigned CRC5EE :1;
unsigned CRC16EE :1;
unsigned DFN8EE :1;
unsigned BTOEE :1;
unsigned :2;
unsigned BTSEE :1;
};
} UEIEbits_t;
extern volatile UEIEbits_t UEIEbits __attribute__((address(0xF6B)));

# 391
extern volatile unsigned char USTAT __attribute__((address(0xF6C)));

asm("USTAT equ 0F6Ch");


typedef union {
struct {
unsigned :1;
unsigned PPBI :1;
unsigned DIR :1;
unsigned ENDP :4;
};
struct {
unsigned :3;
unsigned ENDP0 :1;
unsigned ENDP1 :1;
unsigned ENDP2 :1;
unsigned ENDP3 :1;
};
} USTATbits_t;
extern volatile USTATbits_t USTATbits __attribute__((address(0xF6C)));

# 451
extern volatile unsigned char UCON __attribute__((address(0xF6D)));

asm("UCON equ 0F6Dh");


typedef union {
struct {
unsigned :1;
unsigned SUSPND :1;
unsigned RESUME :1;
unsigned USBEN :1;
unsigned PKTDIS :1;
unsigned SE0 :1;
unsigned PPBRST :1;
};
} UCONbits_t;
extern volatile UCONbits_t UCONbits __attribute__((address(0xF6D)));

# 502
extern volatile unsigned char UADDR __attribute__((address(0xF6E)));

asm("UADDR equ 0F6Eh");


typedef union {
struct {
unsigned ADDR :7;
};
struct {
unsigned ADDR0 :1;
unsigned ADDR1 :1;
unsigned ADDR2 :1;
unsigned ADDR3 :1;
unsigned ADDR4 :1;
unsigned ADDR5 :1;
unsigned ADDR6 :1;
};
} UADDRbits_t;
extern volatile UADDRbits_t UADDRbits __attribute__((address(0xF6E)));

# 566
extern volatile unsigned char UCFG __attribute__((address(0xF6F)));

asm("UCFG equ 0F6Fh");


typedef union {
struct {
unsigned PPB :2;
unsigned FSEN :1;
unsigned UTRDIS :1;
unsigned UPUEN :1;
unsigned :1;
unsigned UOEMON :1;
unsigned UTEYE :1;
};
struct {
unsigned PPB0 :1;
unsigned PPB1 :1;
};
struct {
unsigned UPP0 :1;
unsigned UPP1 :1;
};
} UCFGbits_t;
extern volatile UCFGbits_t UCFGbits __attribute__((address(0xF6F)));

# 645
extern volatile unsigned char UEP0 __attribute__((address(0xF70)));

asm("UEP0 equ 0F70h");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EP0STALL :1;
unsigned EP0INEN :1;
unsigned EP0OUTEN :1;
unsigned EP0CONDIS :1;
unsigned EP0HSHK :1;
};
struct {
unsigned EPSTALL0 :1;
unsigned EPINEN0 :1;
unsigned EPOUTEN0 :1;
unsigned EPCONDIS0 :1;
unsigned EPHSHK0 :1;
};
} UEP0bits_t;
extern volatile UEP0bits_t UEP0bits __attribute__((address(0xF70)));

# 753
extern volatile unsigned char UEP1 __attribute__((address(0xF71)));

asm("UEP1 equ 0F71h");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EP1STALL :1;
unsigned EP1INEN :1;
unsigned EP1OUTEN :1;
unsigned EP1CONDIS :1;
unsigned EP1HSHK :1;
};
struct {
unsigned EPSTALL1 :1;
unsigned EPINEN1 :1;
unsigned EPOUTEN1 :1;
unsigned EPCONDIS1 :1;
unsigned EPHSHK1 :1;
};
} UEP1bits_t;
extern volatile UEP1bits_t UEP1bits __attribute__((address(0xF71)));

# 861
extern volatile unsigned char UEP2 __attribute__((address(0xF72)));

asm("UEP2 equ 0F72h");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EP2STALL :1;
unsigned EP2INEN :1;
unsigned EP2OUTEN :1;
unsigned EP2CONDIS :1;
unsigned EP2HSHK :1;
};
struct {
unsigned EPSTALL2 :1;
unsigned EPINEN2 :1;
unsigned EPOUTEN2 :1;
unsigned EPCONDIS2 :1;
unsigned EPHSHK2 :1;
};
} UEP2bits_t;
extern volatile UEP2bits_t UEP2bits __attribute__((address(0xF72)));

# 969
extern volatile unsigned char UEP3 __attribute__((address(0xF73)));

asm("UEP3 equ 0F73h");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EP3STALL :1;
unsigned EP3INEN :1;
unsigned EP3OUTEN :1;
unsigned EP3CONDIS :1;
unsigned EP3HSHK :1;
};
struct {
unsigned EPSTALL3 :1;
unsigned EPINEN3 :1;
unsigned EPOUTEN3 :1;
unsigned EPCONDIS3 :1;
unsigned EPHSHK3 :1;
};
} UEP3bits_t;
extern volatile UEP3bits_t UEP3bits __attribute__((address(0xF73)));

# 1077
extern volatile unsigned char UEP4 __attribute__((address(0xF74)));

asm("UEP4 equ 0F74h");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EP4STALL :1;
unsigned EP4INEN :1;
unsigned EP4OUTEN :1;
unsigned EP4CONDIS :1;
unsigned EP4HSHK :1;
};
struct {
unsigned EPSTALL4 :1;
unsigned EPINEN4 :1;
unsigned EPOUTEN4 :1;
unsigned EPCONDIS4 :1;
unsigned EPHSHK4 :1;
};
} UEP4bits_t;
extern volatile UEP4bits_t UEP4bits __attribute__((address(0xF74)));

# 1185
extern volatile unsigned char UEP5 __attribute__((address(0xF75)));

asm("UEP5 equ 0F75h");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EP5STALL :1;
unsigned EP5INEN :1;
unsigned EP5OUTEN :1;
unsigned EP5CONDIS :1;
unsigned EP5HSHK :1;
};
struct {
unsigned EPSTALL5 :1;
unsigned EPINEN5 :1;
unsigned EPOUTEN5 :1;
unsigned EPCONDIS5 :1;
unsigned EPHSHK5 :1;
};
} UEP5bits_t;
extern volatile UEP5bits_t UEP5bits __attribute__((address(0xF75)));

# 1293
extern volatile unsigned char UEP6 __attribute__((address(0xF76)));

asm("UEP6 equ 0F76h");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EP6STALL :1;
unsigned EP6INEN :1;
unsigned EP6OUTEN :1;
unsigned EP6CONDIS :1;
unsigned EP6HSHK :1;
};
struct {
unsigned EPSTALL6 :1;
unsigned EPINEN6 :1;
unsigned EPOUTEN6 :1;
unsigned EPCONDIS6 :1;
unsigned EPHSHK6 :1;
};
} UEP6bits_t;
extern volatile UEP6bits_t UEP6bits __attribute__((address(0xF76)));

# 1401
extern volatile unsigned char UEP7 __attribute__((address(0xF77)));

asm("UEP7 equ 0F77h");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EP7STALL :1;
unsigned EP7INEN :1;
unsigned EP7OUTEN :1;
unsigned EP7CONDIS :1;
unsigned EP7HSHK :1;
};
struct {
unsigned EPSTALL7 :1;
unsigned EPINEN7 :1;
unsigned EPOUTEN7 :1;
unsigned EPCONDIS7 :1;
unsigned EPHSHK7 :1;
};
} UEP7bits_t;
extern volatile UEP7bits_t UEP7bits __attribute__((address(0xF77)));

# 1509
extern volatile unsigned char UEP8 __attribute__((address(0xF78)));

asm("UEP8 equ 0F78h");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EPSTALL8 :1;
unsigned EPINEN8 :1;
unsigned EPOUTEN8 :1;
unsigned EPCONDIS8 :1;
unsigned EPHSHK8 :1;
};
} UEP8bits_t;
extern volatile UEP8bits_t UEP8bits __attribute__((address(0xF78)));

# 1585
extern volatile unsigned char UEP9 __attribute__((address(0xF79)));

asm("UEP9 equ 0F79h");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EPSTALL9 :1;
unsigned EPINEN9 :1;
unsigned EPOUTEN9 :1;
unsigned EPCONDIS9 :1;
unsigned EPHSHK9 :1;
};
} UEP9bits_t;
extern volatile UEP9bits_t UEP9bits __attribute__((address(0xF79)));

# 1661
extern volatile unsigned char UEP10 __attribute__((address(0xF7A)));

asm("UEP10 equ 0F7Ah");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EPSTALL10 :1;
unsigned EPINEN10 :1;
unsigned EPOUTEN10 :1;
unsigned EPCONDIS10 :1;
unsigned EPHSHK10 :1;
};
} UEP10bits_t;
extern volatile UEP10bits_t UEP10bits __attribute__((address(0xF7A)));

# 1737
extern volatile unsigned char UEP11 __attribute__((address(0xF7B)));

asm("UEP11 equ 0F7Bh");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EPSTALL11 :1;
unsigned EPINEN11 :1;
unsigned EPOUTEN11 :1;
unsigned EPCONDIS11 :1;
unsigned EPHSHK11 :1;
};
} UEP11bits_t;
extern volatile UEP11bits_t UEP11bits __attribute__((address(0xF7B)));

# 1813
extern volatile unsigned char UEP12 __attribute__((address(0xF7C)));

asm("UEP12 equ 0F7Ch");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EPSTALL12 :1;
unsigned EPINEN12 :1;
unsigned EPOUTEN12 :1;
unsigned EPCONDIS12 :1;
unsigned EPHSHK12 :1;
};
} UEP12bits_t;
extern volatile UEP12bits_t UEP12bits __attribute__((address(0xF7C)));

# 1889
extern volatile unsigned char UEP13 __attribute__((address(0xF7D)));

asm("UEP13 equ 0F7Dh");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EPSTALL13 :1;
unsigned EPINEN13 :1;
unsigned EPOUTEN13 :1;
unsigned EPCONDIS13 :1;
unsigned EPHSHK13 :1;
};
} UEP13bits_t;
extern volatile UEP13bits_t UEP13bits __attribute__((address(0xF7D)));

# 1965
extern volatile unsigned char UEP14 __attribute__((address(0xF7E)));

asm("UEP14 equ 0F7Eh");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EPSTALL14 :1;
unsigned EPINEN14 :1;
unsigned EPOUTEN14 :1;
unsigned EPCONDIS14 :1;
unsigned EPHSHK14 :1;
};
} UEP14bits_t;
extern volatile UEP14bits_t UEP14bits __attribute__((address(0xF7E)));

# 2041
extern volatile unsigned char UEP15 __attribute__((address(0xF7F)));

asm("UEP15 equ 0F7Fh");


typedef union {
struct {
unsigned EPSTALL :1;
unsigned EPINEN :1;
unsigned EPOUTEN :1;
unsigned EPCONDIS :1;
unsigned EPHSHK :1;
};
struct {
unsigned EPSTALL15 :1;
unsigned EPINEN15 :1;
unsigned EPOUTEN15 :1;
unsigned EPCONDIS15 :1;
unsigned EPHSHK15 :1;
};
} UEP15bits_t;
extern volatile UEP15bits_t UEP15bits __attribute__((address(0xF7F)));

# 2117
extern volatile unsigned char PORTA __attribute__((address(0xF80)));

asm("PORTA equ 0F80h");


typedef union {
struct {
unsigned RA0 :1;
unsigned RA1 :1;
unsigned RA2 :1;
unsigned RA3 :1;
unsigned RA4 :1;
unsigned RA5 :1;
unsigned RA6 :1;
};
struct {
unsigned AN0 :1;
unsigned AN1 :1;
unsigned AN2 :1;
unsigned AN3 :1;
unsigned T0CKI :1;
unsigned AN4 :1;
unsigned OSC2 :1;
};
struct {
unsigned :2;
unsigned VREFM :1;
unsigned VREFP :1;
unsigned :1;
unsigned LVDIN :1;
};
struct {
unsigned :5;
unsigned HLVDIN :1;
};
struct {
unsigned ULPWUIN :1;
};
} PORTAbits_t;
extern volatile PORTAbits_t PORTAbits __attribute__((address(0xF80)));

# 2256
extern volatile unsigned char PORTB __attribute__((address(0xF81)));

asm("PORTB equ 0F81h");


typedef union {
struct {
unsigned RB0 :1;
unsigned RB1 :1;
unsigned RB2 :1;
unsigned RB3 :1;
unsigned RB4 :1;
unsigned RB5 :1;
unsigned RB6 :1;
unsigned RB7 :1;
};
struct {
unsigned INT0 :1;
unsigned INT1 :1;
unsigned INT2 :1;
unsigned :2;
unsigned PGM :1;
unsigned PGC :1;
unsigned PGD :1;
};
struct {
unsigned :3;
unsigned CCP2_PA2 :1;
};
} PORTBbits_t;
extern volatile PORTBbits_t PORTBbits __attribute__((address(0xF81)));

# 2366
extern volatile unsigned char PORTC __attribute__((address(0xF82)));

asm("PORTC equ 0F82h");


typedef union {
struct {
unsigned RC0 :1;
unsigned RC1 :1;
unsigned RC2 :1;
unsigned :1;
unsigned RC4 :1;
unsigned RC5 :1;
unsigned RC6 :1;
unsigned RC7 :1;
};
struct {
unsigned T1OSO :1;
unsigned T1OSI :1;
unsigned CCP1 :1;
unsigned :3;
unsigned TX :1;
unsigned RX :1;
};
struct {
unsigned T13CKI :1;
unsigned :1;
unsigned P1A :1;
unsigned :3;
unsigned CK :1;
unsigned DT :1;
};
struct {
unsigned :1;
unsigned CCP2 :1;
unsigned PA1 :1;
};
struct {
unsigned :1;
unsigned PA2 :1;
};
} PORTCbits_t;
extern volatile PORTCbits_t PORTCbits __attribute__((address(0xF82)));

# 2508
extern volatile unsigned char PORTE __attribute__((address(0xF84)));

asm("PORTE equ 0F84h");


typedef union {
struct {
unsigned :3;
unsigned RE3 :1;
};
struct {
unsigned :3;
unsigned CCP9E :1;
};
struct {
unsigned :3;
unsigned PC3E :1;
};
} PORTEbits_t;
extern volatile PORTEbits_t PORTEbits __attribute__((address(0xF84)));

# 2547
extern volatile unsigned char LATA __attribute__((address(0xF89)));

asm("LATA equ 0F89h");


typedef union {
struct {
unsigned LATA0 :1;
unsigned LATA1 :1;
unsigned LATA2 :1;
unsigned LATA3 :1;
unsigned LATA4 :1;
unsigned LATA5 :1;
unsigned LATA6 :1;
};
struct {
unsigned LA0 :1;
unsigned LA1 :1;
unsigned LA2 :1;
unsigned LA3 :1;
unsigned LA4 :1;
unsigned LA5 :1;
unsigned LA6 :1;
};
} LATAbits_t;
extern volatile LATAbits_t LATAbits __attribute__((address(0xF89)));

# 2647
extern volatile unsigned char LATB __attribute__((address(0xF8A)));

asm("LATB equ 0F8Ah");


typedef union {
struct {
unsigned LATB0 :1;
unsigned LATB1 :1;
unsigned LATB2 :1;
unsigned LATB3 :1;
unsigned LATB4 :1;
unsigned LATB5 :1;
unsigned LATB6 :1;
unsigned LATB7 :1;
};
struct {
unsigned LB0 :1;
unsigned LB1 :1;
unsigned LB2 :1;
unsigned LB3 :1;
unsigned LB4 :1;
unsigned LB5 :1;
unsigned LB6 :1;
unsigned LB7 :1;
};
} LATBbits_t;
extern volatile LATBbits_t LATBbits __attribute__((address(0xF8A)));

# 2759
extern volatile unsigned char LATC __attribute__((address(0xF8B)));

asm("LATC equ 0F8Bh");


typedef union {
struct {
unsigned LATC0 :1;
unsigned LATC1 :1;
unsigned LATC2 :1;
unsigned :3;
unsigned LATC6 :1;
unsigned LATC7 :1;
};
struct {
unsigned LC0 :1;
unsigned LC1 :1;
unsigned LC2 :1;
unsigned :3;
unsigned LC6 :1;
unsigned LC7 :1;
};
} LATCbits_t;
extern volatile LATCbits_t LATCbits __attribute__((address(0xF8B)));

# 2837
extern volatile unsigned char TRISA __attribute__((address(0xF92)));

asm("TRISA equ 0F92h");


extern volatile unsigned char DDRA __attribute__((address(0xF92)));

asm("DDRA equ 0F92h");


typedef union {
struct {
unsigned TRISA0 :1;
unsigned TRISA1 :1;
unsigned TRISA2 :1;
unsigned TRISA3 :1;
unsigned TRISA4 :1;
unsigned TRISA5 :1;
unsigned TRISA6 :1;
};
struct {
unsigned RA0 :1;
unsigned RA1 :1;
unsigned RA2 :1;
unsigned RA3 :1;
unsigned RA4 :1;
unsigned RA5 :1;
unsigned RA6 :1;
};
} TRISAbits_t;
extern volatile TRISAbits_t TRISAbits __attribute__((address(0xF92)));

# 2940
typedef union {
struct {
unsigned TRISA0 :1;
unsigned TRISA1 :1;
unsigned TRISA2 :1;
unsigned TRISA3 :1;
unsigned TRISA4 :1;
unsigned TRISA5 :1;
unsigned TRISA6 :1;
};
struct {
unsigned RA0 :1;
unsigned RA1 :1;
unsigned RA2 :1;
unsigned RA3 :1;
unsigned RA4 :1;
unsigned RA5 :1;
unsigned RA6 :1;
};
} DDRAbits_t;
extern volatile DDRAbits_t DDRAbits __attribute__((address(0xF92)));

# 3035
extern volatile unsigned char TRISB __attribute__((address(0xF93)));

asm("TRISB equ 0F93h");


extern volatile unsigned char DDRB __attribute__((address(0xF93)));

asm("DDRB equ 0F93h");


typedef union {
struct {
unsigned TRISB0 :1;
unsigned TRISB1 :1;
unsigned TRISB2 :1;
unsigned TRISB3 :1;
unsigned TRISB4 :1;
unsigned TRISB5 :1;
unsigned TRISB6 :1;
unsigned TRISB7 :1;
};
struct {
unsigned RB0 :1;
unsigned RB1 :1;
unsigned RB2 :1;
unsigned RB3 :1;
unsigned RB4 :1;
unsigned RB5 :1;
unsigned RB6 :1;
unsigned RB7 :1;
};
} TRISBbits_t;
extern volatile TRISBbits_t TRISBbits __attribute__((address(0xF93)));

# 3150
typedef union {
struct {
unsigned TRISB0 :1;
unsigned TRISB1 :1;
unsigned TRISB2 :1;
unsigned TRISB3 :1;
unsigned TRISB4 :1;
unsigned TRISB5 :1;
unsigned TRISB6 :1;
unsigned TRISB7 :1;
};
struct {
unsigned RB0 :1;
unsigned RB1 :1;
unsigned RB2 :1;
unsigned RB3 :1;
unsigned RB4 :1;
unsigned RB5 :1;
unsigned RB6 :1;
unsigned RB7 :1;
};
} DDRBbits_t;
extern volatile DDRBbits_t DDRBbits __attribute__((address(0xF93)));

# 3257
extern volatile unsigned char TRISC __attribute__((address(0xF94)));

asm("TRISC equ 0F94h");


extern volatile unsigned char DDRC __attribute__((address(0xF94)));

asm("DDRC equ 0F94h");


typedef union {
struct {
unsigned TRISC0 :1;
unsigned TRISC1 :1;
unsigned TRISC2 :1;
unsigned :3;
unsigned TRISC6 :1;
unsigned TRISC7 :1;
};
struct {
unsigned RC0 :1;
unsigned RC1 :1;
unsigned RC2 :1;
unsigned :3;
unsigned RC6 :1;
unsigned RC7 :1;
};
} TRISCbits_t;
extern volatile TRISCbits_t TRISCbits __attribute__((address(0xF94)));

# 3338
typedef union {
struct {
unsigned TRISC0 :1;
unsigned TRISC1 :1;
unsigned TRISC2 :1;
unsigned :3;
unsigned TRISC6 :1;
unsigned TRISC7 :1;
};
struct {
unsigned RC0 :1;
unsigned RC1 :1;
unsigned RC2 :1;
unsigned :3;
unsigned RC6 :1;
unsigned RC7 :1;
};
} DDRCbits_t;
extern volatile DDRCbits_t DDRCbits __attribute__((address(0xF94)));

# 3411
extern volatile unsigned char OSCTUNE __attribute__((address(0xF9B)));

asm("OSCTUNE equ 0F9Bh");


typedef union {
struct {
unsigned TUN :5;
unsigned :2;
unsigned INTSRC :1;
};
struct {
unsigned TUN0 :1;
unsigned TUN1 :1;
unsigned TUN2 :1;
unsigned TUN3 :1;
unsigned TUN4 :1;
};
} OSCTUNEbits_t;
extern volatile OSCTUNEbits_t OSCTUNEbits __attribute__((address(0xF9B)));

# 3470
extern volatile unsigned char PIE1 __attribute__((address(0xF9D)));

asm("PIE1 equ 0F9Dh");


typedef union {
struct {
unsigned TMR1IE :1;
unsigned TMR2IE :1;
unsigned CCP1IE :1;
unsigned SSPIE :1;
unsigned TXIE :1;
unsigned RCIE :1;
unsigned ADIE :1;
};
struct {
unsigned :4;
unsigned TX1IE :1;
unsigned RC1IE :1;
};
} PIE1bits_t;
extern volatile PIE1bits_t PIE1bits __attribute__((address(0xF9D)));

# 3541
extern volatile unsigned char PIR1 __attribute__((address(0xF9E)));

asm("PIR1 equ 0F9Eh");


typedef union {
struct {
unsigned TMR1IF :1;
unsigned TMR2IF :1;
unsigned CCP1IF :1;
unsigned SSPIF :1;
unsigned TXIF :1;
unsigned RCIF :1;
unsigned ADIF :1;
};
struct {
unsigned :4;
unsigned TX1IF :1;
unsigned RC1IF :1;
};
} PIR1bits_t;
extern volatile PIR1bits_t PIR1bits __attribute__((address(0xF9E)));

# 3612
extern volatile unsigned char IPR1 __attribute__((address(0xF9F)));

asm("IPR1 equ 0F9Fh");


typedef union {
struct {
unsigned TMR1IP :1;
unsigned TMR2IP :1;
unsigned CCP1IP :1;
unsigned SSPIP :1;
unsigned TXIP :1;
unsigned RCIP :1;
unsigned ADIP :1;
};
struct {
unsigned :4;
unsigned TX1IP :1;
unsigned RC1IP :1;
};
} IPR1bits_t;
extern volatile IPR1bits_t IPR1bits __attribute__((address(0xF9F)));

# 3683
extern volatile unsigned char PIE2 __attribute__((address(0xFA0)));

asm("PIE2 equ 0FA0h");


typedef union {
struct {
unsigned CCP2IE :1;
unsigned TMR3IE :1;
unsigned HLVDIE :1;
unsigned BCLIE :1;
unsigned EEIE :1;
unsigned USBIE :1;
unsigned CMIE :1;
unsigned OSCFIE :1;
};
struct {
unsigned :2;
unsigned LVDIE :1;
};
} PIE2bits_t;
extern volatile PIE2bits_t PIE2bits __attribute__((address(0xFA0)));

# 3754
extern volatile unsigned char PIR2 __attribute__((address(0xFA1)));

asm("PIR2 equ 0FA1h");


typedef union {
struct {
unsigned CCP2IF :1;
unsigned TMR3IF :1;
unsigned HLVDIF :1;
unsigned BCLIF :1;
unsigned EEIF :1;
unsigned USBIF :1;
unsigned CMIF :1;
unsigned OSCFIF :1;
};
struct {
unsigned :2;
unsigned LVDIF :1;
};
} PIR2bits_t;
extern volatile PIR2bits_t PIR2bits __attribute__((address(0xFA1)));

# 3825
extern volatile unsigned char IPR2 __attribute__((address(0xFA2)));

asm("IPR2 equ 0FA2h");


typedef union {
struct {
unsigned CCP2IP :1;
unsigned TMR3IP :1;
unsigned HLVDIP :1;
unsigned BCLIP :1;
unsigned EEIP :1;
unsigned USBIP :1;
unsigned CMIP :1;
unsigned OSCFIP :1;
};
struct {
unsigned :2;
unsigned LVDIP :1;
};
} IPR2bits_t;
extern volatile IPR2bits_t IPR2bits __attribute__((address(0xFA2)));

# 3896
extern volatile unsigned char EECON1 __attribute__((address(0xFA6)));

asm("EECON1 equ 0FA6h");


typedef union {
struct {
unsigned RD :1;
unsigned WR :1;
unsigned WREN :1;
unsigned WRERR :1;
unsigned FREE :1;
unsigned :1;
unsigned CFGS :1;
unsigned EEPGD :1;
};
struct {
unsigned :6;
unsigned EEFS :1;
};
} EECON1bits_t;
extern volatile EECON1bits_t EECON1bits __attribute__((address(0xFA6)));

# 3962
extern volatile unsigned char EECON2 __attribute__((address(0xFA7)));

asm("EECON2 equ 0FA7h");




extern volatile unsigned char EEDATA __attribute__((address(0xFA8)));

asm("EEDATA equ 0FA8h");




extern volatile unsigned char EEADR __attribute__((address(0xFA9)));

asm("EEADR equ 0FA9h");




extern volatile unsigned char RCSTA __attribute__((address(0xFAB)));

asm("RCSTA equ 0FABh");


extern volatile unsigned char RCSTA1 __attribute__((address(0xFAB)));

asm("RCSTA1 equ 0FABh");


typedef union {
struct {
unsigned RX9D :1;
unsigned OERR :1;
unsigned FERR :1;
unsigned ADDEN :1;
unsigned CREN :1;
unsigned SREN :1;
unsigned RX9 :1;
unsigned SPEN :1;
};
struct {
unsigned :3;
unsigned ADEN :1;
};
struct {
unsigned :5;
unsigned SRENA :1;
};
struct {
unsigned :6;
unsigned RC8_9 :1;
};
struct {
unsigned :6;
unsigned RC9 :1;
};
struct {
unsigned RCD8 :1;
};
} RCSTAbits_t;
extern volatile RCSTAbits_t RCSTAbits __attribute__((address(0xFAB)));

# 4092
typedef union {
struct {
unsigned RX9D :1;
unsigned OERR :1;
unsigned FERR :1;
unsigned ADDEN :1;
unsigned CREN :1;
unsigned SREN :1;
unsigned RX9 :1;
unsigned SPEN :1;
};
struct {
unsigned :3;
unsigned ADEN :1;
};
struct {
unsigned :5;
unsigned SRENA :1;
};
struct {
unsigned :6;
unsigned RC8_9 :1;
};
struct {
unsigned :6;
unsigned RC9 :1;
};
struct {
unsigned RCD8 :1;
};
} RCSTA1bits_t;
extern volatile RCSTA1bits_t RCSTA1bits __attribute__((address(0xFAB)));

# 4193
extern volatile unsigned char TXSTA __attribute__((address(0xFAC)));

asm("TXSTA equ 0FACh");


extern volatile unsigned char TXSTA1 __attribute__((address(0xFAC)));

asm("TXSTA1 equ 0FACh");


typedef union {
struct {
unsigned TX9D :1;
unsigned TRMT :1;
unsigned BRGH :1;
unsigned SENDB :1;
unsigned SYNC :1;
unsigned TXEN :1;
unsigned TX9 :1;
unsigned CSRC :1;
};
struct {
unsigned TX9D1 :1;
unsigned TRMT1 :1;
unsigned BRGH1 :1;
unsigned SENDB1 :1;
unsigned SYNC1 :1;
unsigned TXEN1 :1;
unsigned TX91 :1;
unsigned CSRC1 :1;
};
struct {
unsigned :6;
unsigned TX8_9 :1;
};
struct {
unsigned TXD8 :1;
};
} TXSTAbits_t;
extern volatile TXSTAbits_t TXSTAbits __attribute__((address(0xFAC)));

# 4325
typedef union {
struct {
unsigned TX9D :1;
unsigned TRMT :1;
unsigned BRGH :1;
unsigned SENDB :1;
unsigned SYNC :1;
unsigned TXEN :1;
unsigned TX9 :1;
unsigned CSRC :1;
};
struct {
unsigned TX9D1 :1;
unsigned TRMT1 :1;
unsigned BRGH1 :1;
unsigned SENDB1 :1;
unsigned SYNC1 :1;
unsigned TXEN1 :1;
unsigned TX91 :1;
unsigned CSRC1 :1;
};
struct {
unsigned :6;
unsigned TX8_9 :1;
};
struct {
unsigned TXD8 :1;
};
} TXSTA1bits_t;
extern volatile TXSTA1bits_t TXSTA1bits __attribute__((address(0xFAC)));

# 4449
extern volatile unsigned char TXREG __attribute__((address(0xFAD)));

asm("TXREG equ 0FADh");


extern volatile unsigned char TXREG1 __attribute__((address(0xFAD)));

asm("TXREG1 equ 0FADh");




extern volatile unsigned char RCREG __attribute__((address(0xFAE)));

asm("RCREG equ 0FAEh");


extern volatile unsigned char RCREG1 __attribute__((address(0xFAE)));

asm("RCREG1 equ 0FAEh");




extern volatile unsigned char SPBRG __attribute__((address(0xFAF)));

asm("SPBRG equ 0FAFh");


extern volatile unsigned char SPBRG1 __attribute__((address(0xFAF)));

asm("SPBRG1 equ 0FAFh");




extern volatile unsigned char SPBRGH __attribute__((address(0xFB0)));

asm("SPBRGH equ 0FB0h");




extern volatile unsigned char T3CON __attribute__((address(0xFB1)));

asm("T3CON equ 0FB1h");


typedef union {
struct {
unsigned :2;
unsigned NOT_T3SYNC :1;
};
struct {
unsigned TMR3ON :1;
unsigned TMR3CS :1;
unsigned nT3SYNC :1;
unsigned T3CCP1 :1;
unsigned T3CKPS :2;
unsigned T3CCP2 :1;
unsigned RD16 :1;
};
struct {
unsigned :2;
unsigned T3SYNC :1;
unsigned :1;
unsigned T3CKPS0 :1;
unsigned T3CKPS1 :1;
};
struct {
unsigned :2;
unsigned T3NSYNC :1;
};
struct {
unsigned :3;
unsigned SOSCEN3 :1;
unsigned :3;
unsigned RD163 :1;
};
struct {
unsigned :7;
unsigned T3RD16 :1;
};
} T3CONbits_t;
extern volatile T3CONbits_t T3CONbits __attribute__((address(0xFB1)));

# 4613
extern volatile unsigned short TMR3 __attribute__((address(0xFB2)));

asm("TMR3 equ 0FB2h");




extern volatile unsigned char TMR3L __attribute__((address(0xFB2)));

asm("TMR3L equ 0FB2h");




extern volatile unsigned char TMR3H __attribute__((address(0xFB3)));

asm("TMR3H equ 0FB3h");




extern volatile unsigned char CMCON __attribute__((address(0xFB4)));

asm("CMCON equ 0FB4h");


typedef union {
struct {
unsigned CM :3;
unsigned CIS :1;
unsigned C1INV :1;
unsigned C2INV :1;
unsigned C1OUT :1;
unsigned C2OUT :1;
};
struct {
unsigned CM0 :1;
unsigned CM1 :1;
unsigned CM2 :1;
};
struct {
unsigned CMEN0 :1;
unsigned CMEN1 :1;
unsigned CMEN2 :1;
};
} CMCONbits_t;
extern volatile CMCONbits_t CMCONbits __attribute__((address(0xFB4)));

# 4724
extern volatile unsigned char CVRCON __attribute__((address(0xFB5)));

asm("CVRCON equ 0FB5h");


typedef union {
struct {
unsigned CVR :4;
unsigned CVRSS :1;
unsigned CVRR :1;
unsigned CVROE :1;
unsigned CVREN :1;
};
struct {
unsigned CVR0 :1;
unsigned CVR1 :1;
unsigned CVR2 :1;
unsigned CVR3 :1;
unsigned CVREF :1;
};
struct {
unsigned :6;
unsigned CVROEN :1;
};
} CVRCONbits_t;
extern volatile CVRCONbits_t CVRCONbits __attribute__((address(0xFB5)));

# 4809
extern volatile unsigned char ECCP1AS __attribute__((address(0xFB6)));

asm("ECCP1AS equ 0FB6h");


extern volatile unsigned char CCP1AS __attribute__((address(0xFB6)));

asm("CCP1AS equ 0FB6h");


typedef union {
struct {
unsigned :2;
unsigned PSSAC :2;
unsigned ECCPAS :3;
unsigned ECCPASE :1;
};
struct {
unsigned :2;
unsigned PSSAC0 :1;
unsigned PSSAC1 :1;
unsigned ECCPAS0 :1;
unsigned ECCPAS1 :1;
unsigned ECCPAS2 :1;
};
} ECCP1ASbits_t;
extern volatile ECCP1ASbits_t ECCP1ASbits __attribute__((address(0xFB6)));

# 4878
typedef union {
struct {
unsigned :2;
unsigned PSSAC :2;
unsigned ECCPAS :3;
unsigned ECCPASE :1;
};
struct {
unsigned :2;
unsigned PSSAC0 :1;
unsigned PSSAC1 :1;
unsigned ECCPAS0 :1;
unsigned ECCPAS1 :1;
unsigned ECCPAS2 :1;
};
} CCP1ASbits_t;
extern volatile CCP1ASbits_t CCP1ASbits __attribute__((address(0xFB6)));

# 4939
extern volatile unsigned char ECCP1DEL __attribute__((address(0xFB7)));

asm("ECCP1DEL equ 0FB7h");


extern volatile unsigned char CCP1DEL __attribute__((address(0xFB7)));

asm("CCP1DEL equ 0FB7h");


typedef union {
struct {
unsigned :7;
unsigned PRSEN :1;
};
} ECCP1DELbits_t;
extern volatile ECCP1DELbits_t ECCP1DELbits __attribute__((address(0xFB7)));

# 4963
typedef union {
struct {
unsigned :7;
unsigned PRSEN :1;
};
} CCP1DELbits_t;
extern volatile CCP1DELbits_t CCP1DELbits __attribute__((address(0xFB7)));

# 4979
extern volatile unsigned char BAUDCON __attribute__((address(0xFB8)));

asm("BAUDCON equ 0FB8h");


extern volatile unsigned char BAUDCTL __attribute__((address(0xFB8)));

asm("BAUDCTL equ 0FB8h");


typedef union {
struct {
unsigned ABDEN :1;
unsigned WUE :1;
unsigned :1;
unsigned BRG16 :1;
unsigned TXCKP :1;
unsigned RXDTP :1;
unsigned RCIDL :1;
unsigned ABDOVF :1;
};
struct {
unsigned :4;
unsigned SCKP :1;
unsigned :1;
unsigned RCMT :1;
};
struct {
unsigned :5;
unsigned RXCKP :1;
};
struct {
unsigned :1;
unsigned W4E :1;
};
} BAUDCONbits_t;
extern volatile BAUDCONbits_t BAUDCONbits __attribute__((address(0xFB8)));

# 5073
typedef union {
struct {
unsigned ABDEN :1;
unsigned WUE :1;
unsigned :1;
unsigned BRG16 :1;
unsigned TXCKP :1;
unsigned RXDTP :1;
unsigned RCIDL :1;
unsigned ABDOVF :1;
};
struct {
unsigned :4;
unsigned SCKP :1;
unsigned :1;
unsigned RCMT :1;
};
struct {
unsigned :5;
unsigned RXCKP :1;
};
struct {
unsigned :1;
unsigned W4E :1;
};
} BAUDCTLbits_t;
extern volatile BAUDCTLbits_t BAUDCTLbits __attribute__((address(0xFB8)));

# 5159
extern volatile unsigned char CCP2CON __attribute__((address(0xFBA)));

asm("CCP2CON equ 0FBAh");


typedef union {
struct {
unsigned CCP2M :4;
unsigned DC2B :2;
};
struct {
unsigned CCP2M0 :1;
unsigned CCP2M1 :1;
unsigned CCP2M2 :1;
unsigned CCP2M3 :1;
unsigned DC2B0 :1;
unsigned DC2B1 :1;
};
} CCP2CONbits_t;
extern volatile CCP2CONbits_t CCP2CONbits __attribute__((address(0xFBA)));

# 5223
extern volatile unsigned short CCPR2 __attribute__((address(0xFBB)));

asm("CCPR2 equ 0FBBh");




extern volatile unsigned char CCPR2L __attribute__((address(0xFBB)));

asm("CCPR2L equ 0FBBh");




extern volatile unsigned char CCPR2H __attribute__((address(0xFBC)));

asm("CCPR2H equ 0FBCh");




extern volatile unsigned char CCP1CON __attribute__((address(0xFBD)));

asm("CCP1CON equ 0FBDh");


typedef union {
struct {
unsigned CCP1M :4;
unsigned DC1B :2;
};
struct {
unsigned CCP1M0 :1;
unsigned CCP1M1 :1;
unsigned CCP1M2 :1;
unsigned CCP1M3 :1;
unsigned DC1B0 :1;
unsigned DC1B1 :1;
};
} CCP1CONbits_t;
extern volatile CCP1CONbits_t CCP1CONbits __attribute__((address(0xFBD)));

# 5308
extern volatile unsigned short CCPR1 __attribute__((address(0xFBE)));

asm("CCPR1 equ 0FBEh");




extern volatile unsigned char CCPR1L __attribute__((address(0xFBE)));

asm("CCPR1L equ 0FBEh");




extern volatile unsigned char CCPR1H __attribute__((address(0xFBF)));

asm("CCPR1H equ 0FBFh");




extern volatile unsigned char ADCON2 __attribute__((address(0xFC0)));

asm("ADCON2 equ 0FC0h");


typedef union {
struct {
unsigned ADCS :3;
unsigned ACQT :3;
unsigned :1;
unsigned ADFM :1;
};
struct {
unsigned ADCS0 :1;
unsigned ADCS1 :1;
unsigned ADCS2 :1;
unsigned ACQT0 :1;
unsigned ACQT1 :1;
unsigned ACQT2 :1;
};
} ADCON2bits_t;
extern volatile ADCON2bits_t ADCON2bits __attribute__((address(0xFC0)));

# 5400
extern volatile unsigned char ADCON1 __attribute__((address(0xFC1)));

asm("ADCON1 equ 0FC1h");


typedef union {
struct {
unsigned PCFG :4;
unsigned VCFG :2;
};
struct {
unsigned PCFG0 :1;
unsigned PCFG1 :1;
unsigned PCFG2 :1;
unsigned PCFG3 :1;
unsigned VCFG0 :1;
unsigned VCFG1 :1;
};
struct {
unsigned :3;
unsigned CHSN3 :1;
unsigned VCFG01 :1;
unsigned VCFG11 :1;
};
} ADCON1bits_t;
extern volatile ADCON1bits_t ADCON1bits __attribute__((address(0xFC1)));

# 5485
extern volatile unsigned char ADCON0 __attribute__((address(0xFC2)));

asm("ADCON0 equ 0FC2h");


typedef union {
struct {
unsigned :1;
unsigned GO_NOT_DONE :1;
};
struct {
unsigned ADON :1;
unsigned GO_nDONE :1;
unsigned CHS :4;
};
struct {
unsigned :1;
unsigned GO_DONE :1;
unsigned CHS0 :1;
unsigned CHS1 :1;
unsigned CHS2 :1;
unsigned CHS3 :1;
};
struct {
unsigned :1;
unsigned DONE :1;
};
struct {
unsigned :1;
unsigned GO :1;
};
struct {
unsigned :1;
unsigned NOT_DONE :1;
};
struct {
unsigned :1;
unsigned nDONE :1;
};
struct {
unsigned :1;
unsigned GODONE :1;
};
} ADCON0bits_t;
extern volatile ADCON0bits_t ADCON0bits __attribute__((address(0xFC2)));

# 5604
extern volatile unsigned short ADRES __attribute__((address(0xFC3)));

asm("ADRES equ 0FC3h");




extern volatile unsigned char ADRESL __attribute__((address(0xFC3)));

asm("ADRESL equ 0FC3h");




extern volatile unsigned char ADRESH __attribute__((address(0xFC4)));

asm("ADRESH equ 0FC4h");




extern volatile unsigned char SSPCON2 __attribute__((address(0xFC5)));

asm("SSPCON2 equ 0FC5h");


typedef union {
struct {
unsigned SEN :1;
unsigned RSEN :1;
unsigned PEN :1;
unsigned RCEN :1;
unsigned ACKEN :1;
unsigned ACKDT :1;
unsigned ACKSTAT :1;
unsigned GCEN :1;
};
} SSPCON2bits_t;
extern volatile SSPCON2bits_t SSPCON2bits __attribute__((address(0xFC5)));

# 5687
extern volatile unsigned char SSPCON1 __attribute__((address(0xFC6)));

asm("SSPCON1 equ 0FC6h");


typedef union {
struct {
unsigned SSPM :4;
unsigned CKP :1;
unsigned SSPEN :1;
unsigned SSPOV :1;
unsigned WCOL :1;
};
struct {
unsigned SSPM0 :1;
unsigned SSPM1 :1;
unsigned SSPM2 :1;
unsigned SSPM3 :1;
};
} SSPCON1bits_t;
extern volatile SSPCON1bits_t SSPCON1bits __attribute__((address(0xFC6)));

# 5757
extern volatile unsigned char SSPSTAT __attribute__((address(0xFC7)));

asm("SSPSTAT equ 0FC7h");


typedef union {
struct {
unsigned :2;
unsigned R_NOT_W :1;
};
struct {
unsigned :5;
unsigned D_NOT_A :1;
};
struct {
unsigned BF :1;
unsigned UA :1;
unsigned R_nW :1;
unsigned S :1;
unsigned P :1;
unsigned D_nA :1;
unsigned CKE :1;
unsigned SMP :1;
};
struct {
unsigned :2;
unsigned R_W :1;
unsigned :2;
unsigned D_A :1;
};
struct {
unsigned :2;
unsigned I2C_READ :1;
unsigned I2C_START :1;
unsigned I2C_STOP :1;
unsigned I2C_DAT :1;
};
struct {
unsigned :2;
unsigned nW :1;
unsigned :2;
unsigned nA :1;
};
struct {
unsigned :2;
unsigned NOT_WRITE :1;
};
struct {
unsigned :5;
unsigned NOT_ADDRESS :1;
};
struct {
unsigned :2;
unsigned nWRITE :1;
unsigned :2;
unsigned nADDRESS :1;
};
struct {
unsigned :2;
unsigned READ_WRITE :1;
unsigned :2;
unsigned DATA_ADDRESS :1;
};
struct {
unsigned :2;
unsigned R :1;
unsigned :2;
unsigned D :1;
};
struct {
unsigned :2;
unsigned RW :1;
unsigned START :1;
unsigned STOP :1;
unsigned DA :1;
};
struct {
unsigned :2;
unsigned NOT_W :1;
unsigned :2;
unsigned NOT_A :1;
};
} SSPSTATbits_t;
extern volatile SSPSTATbits_t SSPSTATbits __attribute__((address(0xFC7)));

# 6005
extern volatile unsigned char SSPADD __attribute__((address(0xFC8)));

asm("SSPADD equ 0FC8h");




extern volatile unsigned char SSPBUF __attribute__((address(0xFC9)));

asm("SSPBUF equ 0FC9h");




extern volatile unsigned char T2CON __attribute__((address(0xFCA)));

asm("T2CON equ 0FCAh");


typedef union {
struct {
unsigned T2CKPS :2;
unsigned TMR2ON :1;
unsigned TOUTPS :4;
};
struct {
unsigned T2CKPS0 :1;
unsigned T2CKPS1 :1;
unsigned :1;
unsigned T2OUTPS0 :1;
unsigned T2OUTPS1 :1;
unsigned T2OUTPS2 :1;
unsigned T2OUTPS3 :1;
};
struct {
unsigned :3;
unsigned TOUTPS0 :1;
unsigned TOUTPS1 :1;
unsigned TOUTPS2 :1;
unsigned TOUTPS3 :1;
};
} T2CONbits_t;
extern volatile T2CONbits_t T2CONbits __attribute__((address(0xFCA)));

# 6117
extern volatile unsigned char PR2 __attribute__((address(0xFCB)));

asm("PR2 equ 0FCBh");


extern volatile unsigned char MEMCON __attribute__((address(0xFCB)));

asm("MEMCON equ 0FCBh");


typedef union {
struct {
unsigned :7;
unsigned EBDIS :1;
};
struct {
unsigned :4;
unsigned WAIT0 :1;
};
struct {
unsigned :5;
unsigned WAIT1 :1;
};
struct {
unsigned WM0 :1;
};
struct {
unsigned :1;
unsigned WM1 :1;
};
} PR2bits_t;
extern volatile PR2bits_t PR2bits __attribute__((address(0xFCB)));

# 6176
typedef union {
struct {
unsigned :7;
unsigned EBDIS :1;
};
struct {
unsigned :4;
unsigned WAIT0 :1;
};
struct {
unsigned :5;
unsigned WAIT1 :1;
};
struct {
unsigned WM0 :1;
};
struct {
unsigned :1;
unsigned WM1 :1;
};
} MEMCONbits_t;
extern volatile MEMCONbits_t MEMCONbits __attribute__((address(0xFCB)));

# 6227
extern volatile unsigned char TMR2 __attribute__((address(0xFCC)));

asm("TMR2 equ 0FCCh");




extern volatile unsigned char T1CON __attribute__((address(0xFCD)));

asm("T1CON equ 0FCDh");


typedef union {
struct {
unsigned :2;
unsigned NOT_T1SYNC :1;
};
struct {
unsigned TMR1ON :1;
unsigned TMR1CS :1;
unsigned nT1SYNC :1;
unsigned T1OSCEN :1;
unsigned T1CKPS :2;
unsigned T1RUN :1;
unsigned RD16 :1;
};
struct {
unsigned :2;
unsigned T1SYNC :1;
unsigned :1;
unsigned T1CKPS0 :1;
unsigned T1CKPS1 :1;
};
struct {
unsigned :3;
unsigned SOSCEN :1;
unsigned :3;
unsigned T1RD16 :1;
};
} T1CONbits_t;
extern volatile T1CONbits_t T1CONbits __attribute__((address(0xFCD)));

# 6337
extern volatile unsigned short TMR1 __attribute__((address(0xFCE)));

asm("TMR1 equ 0FCEh");




extern volatile unsigned char TMR1L __attribute__((address(0xFCE)));

asm("TMR1L equ 0FCEh");




extern volatile unsigned char TMR1H __attribute__((address(0xFCF)));

asm("TMR1H equ 0FCFh");




extern volatile unsigned char RCON __attribute__((address(0xFD0)));

asm("RCON equ 0FD0h");


typedef union {
struct {
unsigned NOT_BOR :1;
};
struct {
unsigned :1;
unsigned NOT_POR :1;
};
struct {
unsigned :2;
unsigned NOT_PD :1;
};
struct {
unsigned :3;
unsigned NOT_TO :1;
};
struct {
unsigned :4;
unsigned NOT_RI :1;
};
struct {
unsigned nBOR :1;
unsigned nPOR :1;
unsigned nPD :1;
unsigned nTO :1;
unsigned nRI :1;
unsigned :1;
unsigned SBOREN :1;
unsigned IPEN :1;
};
struct {
unsigned :7;
unsigned NOT_IPEN :1;
};
struct {
unsigned BOR :1;
unsigned POR :1;
unsigned PD :1;
unsigned TO :1;
unsigned RI :1;
unsigned :2;
unsigned nIPEN :1;
};
} RCONbits_t;
extern volatile RCONbits_t RCONbits __attribute__((address(0xFD0)));

# 6507
extern volatile unsigned char WDTCON __attribute__((address(0xFD1)));

asm("WDTCON equ 0FD1h");


typedef union {
struct {
unsigned SWDTEN :1;
};
struct {
unsigned SWDTE :1;
};
} WDTCONbits_t;
extern volatile WDTCONbits_t WDTCONbits __attribute__((address(0xFD1)));

# 6535
extern volatile unsigned char HLVDCON __attribute__((address(0xFD2)));

asm("HLVDCON equ 0FD2h");


extern volatile unsigned char LVDCON __attribute__((address(0xFD2)));

asm("LVDCON equ 0FD2h");


typedef union {
struct {
unsigned HLVDL :4;
unsigned HLVDEN :1;
unsigned IRVST :1;
unsigned :1;
unsigned VDIRMAG :1;
};
struct {
unsigned HLVDL0 :1;
unsigned HLVDL1 :1;
unsigned HLVDL2 :1;
unsigned HLVDL3 :1;
};
struct {
unsigned LVDL0 :1;
unsigned LVDL1 :1;
unsigned LVDL2 :1;
unsigned LVDL3 :1;
unsigned LVDEN :1;
unsigned IVRST :1;
};
struct {
unsigned LVV0 :1;
unsigned LVV1 :1;
unsigned LVV2 :1;
unsigned LVV3 :1;
unsigned :1;
unsigned BGST :1;
};
} HLVDCONbits_t;
extern volatile HLVDCONbits_t HLVDCONbits __attribute__((address(0xFD2)));

# 6674
typedef union {
struct {
unsigned HLVDL :4;
unsigned HLVDEN :1;
unsigned IRVST :1;
unsigned :1;
unsigned VDIRMAG :1;
};
struct {
unsigned HLVDL0 :1;
unsigned HLVDL1 :1;
unsigned HLVDL2 :1;
unsigned HLVDL3 :1;
};
struct {
unsigned LVDL0 :1;
unsigned LVDL1 :1;
unsigned LVDL2 :1;
unsigned LVDL3 :1;
unsigned LVDEN :1;
unsigned IVRST :1;
};
struct {
unsigned LVV0 :1;
unsigned LVV1 :1;
unsigned LVV2 :1;
unsigned LVV3 :1;
unsigned :1;
unsigned BGST :1;
};
} LVDCONbits_t;
extern volatile LVDCONbits_t LVDCONbits __attribute__((address(0xFD2)));

# 6805
extern volatile unsigned char OSCCON __attribute__((address(0xFD3)));

asm("OSCCON equ 0FD3h");


typedef union {
struct {
unsigned SCS :2;
unsigned IOFS :1;
unsigned OSTS :1;
unsigned IRCF :3;
unsigned IDLEN :1;
};
struct {
unsigned SCS0 :1;
unsigned SCS1 :1;
unsigned FLTS :1;
unsigned :1;
unsigned IRCF0 :1;
unsigned IRCF1 :1;
unsigned IRCF2 :1;
};
} OSCCONbits_t;
extern volatile OSCCONbits_t OSCCONbits __attribute__((address(0xFD3)));

# 6888
extern volatile unsigned char T0CON __attribute__((address(0xFD5)));

asm("T0CON equ 0FD5h");


typedef union {
struct {
unsigned T0PS :3;
unsigned PSA :1;
unsigned T0SE :1;
unsigned T0CS :1;
unsigned T08BIT :1;
unsigned TMR0ON :1;
};
struct {
unsigned T0PS0 :1;
unsigned T0PS1 :1;
unsigned T0PS2 :1;
};
} T0CONbits_t;
extern volatile T0CONbits_t T0CONbits __attribute__((address(0xFD5)));

# 6958
extern volatile unsigned short TMR0 __attribute__((address(0xFD6)));

asm("TMR0 equ 0FD6h");




extern volatile unsigned char TMR0L __attribute__((address(0xFD6)));

asm("TMR0L equ 0FD6h");




extern volatile unsigned char TMR0H __attribute__((address(0xFD7)));

asm("TMR0H equ 0FD7h");




extern volatile unsigned char STATUS __attribute__((address(0xFD8)));

asm("STATUS equ 0FD8h");


typedef union {
struct {
unsigned C :1;
unsigned DC :1;
unsigned Z :1;
unsigned OV :1;
unsigned N :1;
};
struct {
unsigned CARRY :1;
unsigned :1;
unsigned ZERO :1;
unsigned OVERFLOW :1;
unsigned NEGATIVE :1;
};
} STATUSbits_t;
extern volatile STATUSbits_t STATUSbits __attribute__((address(0xFD8)));

# 7050
extern volatile unsigned short FSR2 __attribute__((address(0xFD9)));

asm("FSR2 equ 0FD9h");




extern volatile unsigned char FSR2L __attribute__((address(0xFD9)));

asm("FSR2L equ 0FD9h");




extern volatile unsigned char FSR2H __attribute__((address(0xFDA)));

asm("FSR2H equ 0FDAh");




extern volatile unsigned char PLUSW2 __attribute__((address(0xFDB)));

asm("PLUSW2 equ 0FDBh");




extern volatile unsigned char PREINC2 __attribute__((address(0xFDC)));

asm("PREINC2 equ 0FDCh");




extern volatile unsigned char POSTDEC2 __attribute__((address(0xFDD)));

asm("POSTDEC2 equ 0FDDh");




extern volatile unsigned char POSTINC2 __attribute__((address(0xFDE)));

asm("POSTINC2 equ 0FDEh");




extern volatile unsigned char INDF2 __attribute__((address(0xFDF)));

asm("INDF2 equ 0FDFh");




extern volatile unsigned char BSR __attribute__((address(0xFE0)));

asm("BSR equ 0FE0h");




extern volatile unsigned short FSR1 __attribute__((address(0xFE1)));

asm("FSR1 equ 0FE1h");




extern volatile unsigned char FSR1L __attribute__((address(0xFE1)));

asm("FSR1L equ 0FE1h");




extern volatile unsigned char FSR1H __attribute__((address(0xFE2)));

asm("FSR1H equ 0FE2h");




extern volatile unsigned char PLUSW1 __attribute__((address(0xFE3)));

asm("PLUSW1 equ 0FE3h");




extern volatile unsigned char PREINC1 __attribute__((address(0xFE4)));

asm("PREINC1 equ 0FE4h");




extern volatile unsigned char POSTDEC1 __attribute__((address(0xFE5)));

asm("POSTDEC1 equ 0FE5h");




extern volatile unsigned char POSTINC1 __attribute__((address(0xFE6)));

asm("POSTINC1 equ 0FE6h");




extern volatile unsigned char INDF1 __attribute__((address(0xFE7)));

asm("INDF1 equ 0FE7h");




extern volatile unsigned char WREG __attribute__((address(0xFE8)));

asm("WREG equ 0FE8h");




extern volatile unsigned short FSR0 __attribute__((address(0xFE9)));

asm("FSR0 equ 0FE9h");




extern volatile unsigned char FSR0L __attribute__((address(0xFE9)));

asm("FSR0L equ 0FE9h");




extern volatile unsigned char FSR0H __attribute__((address(0xFEA)));

asm("FSR0H equ 0FEAh");




extern volatile unsigned char PLUSW0 __attribute__((address(0xFEB)));

asm("PLUSW0 equ 0FEBh");




extern volatile unsigned char PREINC0 __attribute__((address(0xFEC)));

asm("PREINC0 equ 0FECh");




extern volatile unsigned char POSTDEC0 __attribute__((address(0xFED)));

asm("POSTDEC0 equ 0FEDh");




extern volatile unsigned char POSTINC0 __attribute__((address(0xFEE)));

asm("POSTINC0 equ 0FEEh");




extern volatile unsigned char INDF0 __attribute__((address(0xFEF)));

asm("INDF0 equ 0FEFh");




extern volatile unsigned char INTCON3 __attribute__((address(0xFF0)));

asm("INTCON3 equ 0FF0h");


typedef union {
struct {
unsigned INT1IF :1;
unsigned INT2IF :1;
unsigned :1;
unsigned INT1IE :1;
unsigned INT2IE :1;
unsigned :1;
unsigned INT1IP :1;
unsigned INT2IP :1;
};
struct {
unsigned INT1F :1;
unsigned INT2F :1;
unsigned :1;
unsigned INT1E :1;
unsigned INT2E :1;
unsigned :1;
unsigned INT1P :1;
unsigned INT2P :1;
};
} INTCON3bits_t;
extern volatile INTCON3bits_t INTCON3bits __attribute__((address(0xFF0)));

# 7324
extern volatile unsigned char INTCON2 __attribute__((address(0xFF1)));

asm("INTCON2 equ 0FF1h");


typedef union {
struct {
unsigned :7;
unsigned NOT_RBPU :1;
};
struct {
unsigned RBIP :1;
unsigned :1;
unsigned TMR0IP :1;
unsigned :1;
unsigned INTEDG2 :1;
unsigned INTEDG1 :1;
unsigned INTEDG0 :1;
unsigned nRBPU :1;
};
struct {
unsigned :2;
unsigned T0IP :1;
unsigned :4;
unsigned RBPU :1;
};
} INTCON2bits_t;
extern volatile INTCON2bits_t INTCON2bits __attribute__((address(0xFF1)));

# 7401
extern volatile unsigned char INTCON __attribute__((address(0xFF2)));

asm("INTCON equ 0FF2h");


typedef union {
struct {
unsigned RBIF :1;
unsigned INT0IF :1;
unsigned TMR0IF :1;
unsigned RBIE :1;
unsigned INT0IE :1;
unsigned TMR0IE :1;
unsigned PEIE_GIEL :1;
unsigned GIE_GIEH :1;
};
struct {
unsigned :1;
unsigned INT0F :1;
unsigned T0IF :1;
unsigned :1;
unsigned INT0E :1;
unsigned T0IE :1;
unsigned PEIE :1;
unsigned GIE :1;
};
struct {
unsigned :6;
unsigned GIEL :1;
unsigned GIEH :1;
};
} INTCONbits_t;
extern volatile INTCONbits_t INTCONbits __attribute__((address(0xFF2)));

# 7518
extern volatile unsigned short PROD __attribute__((address(0xFF3)));

asm("PROD equ 0FF3h");




extern volatile unsigned char PRODL __attribute__((address(0xFF3)));

asm("PRODL equ 0FF3h");




extern volatile unsigned char PRODH __attribute__((address(0xFF4)));

asm("PRODH equ 0FF4h");




extern volatile unsigned char TABLAT __attribute__((address(0xFF5)));

asm("TABLAT equ 0FF5h");

# 7550
asm("TBLPTR equ 0FF6h");




extern volatile unsigned char TBLPTRL __attribute__((address(0xFF6)));

asm("TBLPTRL equ 0FF6h");




extern volatile unsigned char TBLPTRH __attribute__((address(0xFF7)));

asm("TBLPTRH equ 0FF7h");




extern volatile unsigned char TBLPTRU __attribute__((address(0xFF8)));

asm("TBLPTRU equ 0FF8h");

# 7580
asm("PCLAT equ 0FF9h");

# 7587
asm("PC equ 0FF9h");




extern volatile unsigned char PCL __attribute__((address(0xFF9)));

asm("PCL equ 0FF9h");




extern volatile unsigned char PCLATH __attribute__((address(0xFFA)));

asm("PCLATH equ 0FFAh");




extern volatile unsigned char PCLATU __attribute__((address(0xFFB)));

asm("PCLATU equ 0FFBh");




extern volatile unsigned char STKPTR __attribute__((address(0xFFC)));

asm("STKPTR equ 0FFCh");


typedef union {
struct {
unsigned STKPTR :5;
unsigned :1;
unsigned STKUNF :1;
unsigned STKFUL :1;
};
struct {
unsigned STKPTR0 :1;
unsigned STKPTR1 :1;
unsigned STKPTR2 :1;
unsigned STKPTR3 :1;
unsigned STKPTR4 :1;
};
struct {
unsigned :7;
unsigned STKOVF :1;
};
} STKPTRbits_t;
extern volatile STKPTRbits_t STKPTRbits __attribute__((address(0xFFC)));

# 7691
asm("TOS equ 0FFDh");




extern volatile unsigned char TOSL __attribute__((address(0xFFD)));

asm("TOSL equ 0FFDh");




extern volatile unsigned char TOSH __attribute__((address(0xFFE)));

asm("TOSH equ 0FFEh");




extern volatile unsigned char TOSU __attribute__((address(0xFFF)));

asm("TOSU equ 0FFFh");

# 7723
extern volatile __bit ABDEN __attribute__((address(0x7DC0)));


extern volatile __bit ABDOVF __attribute__((address(0x7DC7)));


extern volatile __bit ACKDT __attribute__((address(0x7E2D)));


extern volatile __bit ACKEN __attribute__((address(0x7E2C)));


extern volatile __bit ACKSTAT __attribute__((address(0x7E2E)));


extern volatile __bit ACQT0 __attribute__((address(0x7E03)));


extern volatile __bit ACQT1 __attribute__((address(0x7E04)));


extern volatile __bit ACQT2 __attribute__((address(0x7E05)));


extern volatile __bit ACTVIE __attribute__((address(0x7B4A)));


extern volatile __bit ACTVIF __attribute__((address(0x7B42)));


extern volatile __bit ADCS0 __attribute__((address(0x7E00)));


extern volatile __bit ADCS1 __attribute__((address(0x7E01)));


extern volatile __bit ADCS2 __attribute__((address(0x7E02)));


extern volatile __bit ADDEN __attribute__((address(0x7D5B)));


extern volatile __bit ADDR0 __attribute__((address(0x7B70)));


extern volatile __bit ADDR1 __attribute__((address(0x7B71)));


extern volatile __bit ADDR2 __attribute__((address(0x7B72)));


extern volatile __bit ADDR3 __attribute__((address(0x7B73)));


extern volatile __bit ADDR4 __attribute__((address(0x7B74)));


extern volatile __bit ADDR5 __attribute__((address(0x7B75)));


extern volatile __bit ADDR6 __attribute__((address(0x7B76)));


extern volatile __bit ADEN __attribute__((address(0x7D5B)));


extern volatile __bit ADFM __attribute__((address(0x7E07)));


extern volatile __bit ADIE __attribute__((address(0x7CEE)));


extern volatile __bit ADIF __attribute__((address(0x7CF6)));


extern volatile __bit ADIP __attribute__((address(0x7CFE)));


extern volatile __bit ADON __attribute__((address(0x7E10)));


extern volatile __bit AN0 __attribute__((address(0x7C00)));


extern volatile __bit AN1 __attribute__((address(0x7C01)));


extern volatile __bit AN2 __attribute__((address(0x7C02)));


extern volatile __bit AN3 __attribute__((address(0x7C03)));


extern volatile __bit AN4 __attribute__((address(0x7C05)));


extern volatile __bit BCLIE __attribute__((address(0x7D03)));


extern volatile __bit BCLIF __attribute__((address(0x7D0B)));


extern volatile __bit BCLIP __attribute__((address(0x7D13)));


extern volatile __bit BF __attribute__((address(0x7E38)));


extern volatile __bit BGST __attribute__((address(0x7E95)));


extern volatile __bit BOR __attribute__((address(0x7E80)));


extern volatile __bit BRG16 __attribute__((address(0x7DC3)));


extern volatile __bit BRGH __attribute__((address(0x7D62)));


extern volatile __bit BRGH1 __attribute__((address(0x7D62)));


extern volatile __bit BTOEE __attribute__((address(0x7B5C)));


extern volatile __bit BTOEF __attribute__((address(0x7B54)));


extern volatile __bit BTSEE __attribute__((address(0x7B5F)));


extern volatile __bit BTSEF __attribute__((address(0x7B57)));


extern volatile __bit C1INV __attribute__((address(0x7DA4)));


extern volatile __bit C1OUT __attribute__((address(0x7DA6)));


extern volatile __bit C2INV __attribute__((address(0x7DA5)));


extern volatile __bit C2OUT __attribute__((address(0x7DA7)));


extern volatile __bit CARRY __attribute__((address(0x7EC0)));


extern volatile __bit CCP1 __attribute__((address(0x7C12)));


extern volatile __bit CCP1IE __attribute__((address(0x7CEA)));


extern volatile __bit CCP1IF __attribute__((address(0x7CF2)));


extern volatile __bit CCP1IP __attribute__((address(0x7CFA)));


extern volatile __bit CCP1M0 __attribute__((address(0x7DE8)));


extern volatile __bit CCP1M1 __attribute__((address(0x7DE9)));


extern volatile __bit CCP1M2 __attribute__((address(0x7DEA)));


extern volatile __bit CCP1M3 __attribute__((address(0x7DEB)));


extern volatile __bit CCP2 __attribute__((address(0x7C11)));


extern volatile __bit CCP2IE __attribute__((address(0x7D00)));


extern volatile __bit CCP2IF __attribute__((address(0x7D08)));


extern volatile __bit CCP2IP __attribute__((address(0x7D10)));


extern volatile __bit CCP2M0 __attribute__((address(0x7DD0)));


extern volatile __bit CCP2M1 __attribute__((address(0x7DD1)));


extern volatile __bit CCP2M2 __attribute__((address(0x7DD2)));


extern volatile __bit CCP2M3 __attribute__((address(0x7DD3)));


extern volatile __bit CCP2_PA2 __attribute__((address(0x7C0B)));


extern volatile __bit CCP9E __attribute__((address(0x7C23)));


extern volatile __bit CFGS __attribute__((address(0x7D36)));


extern volatile __bit CHS0 __attribute__((address(0x7E12)));


extern volatile __bit CHS1 __attribute__((address(0x7E13)));


extern volatile __bit CHS2 __attribute__((address(0x7E14)));


extern volatile __bit CHS3 __attribute__((address(0x7E15)));


extern volatile __bit CHSN3 __attribute__((address(0x7E0B)));


extern volatile __bit CIS __attribute__((address(0x7DA3)));


extern volatile __bit CK __attribute__((address(0x7C16)));


extern volatile __bit CKE __attribute__((address(0x7E3E)));


extern volatile __bit CKP __attribute__((address(0x7E34)));


extern volatile __bit CM0 __attribute__((address(0x7DA0)));


extern volatile __bit CM1 __attribute__((address(0x7DA1)));


extern volatile __bit CM2 __attribute__((address(0x7DA2)));


extern volatile __bit CMEN0 __attribute__((address(0x7DA0)));


extern volatile __bit CMEN1 __attribute__((address(0x7DA1)));


extern volatile __bit CMEN2 __attribute__((address(0x7DA2)));


extern volatile __bit CMIE __attribute__((address(0x7D06)));


extern volatile __bit CMIF __attribute__((address(0x7D0E)));


extern volatile __bit CMIP __attribute__((address(0x7D16)));


extern volatile __bit CRC16EE __attribute__((address(0x7B5A)));


extern volatile __bit CRC16EF __attribute__((address(0x7B52)));


extern volatile __bit CRC5EE __attribute__((address(0x7B59)));


extern volatile __bit CRC5EF __attribute__((address(0x7B51)));


extern volatile __bit CREN __attribute__((address(0x7D5C)));


extern volatile __bit CSRC __attribute__((address(0x7D67)));


extern volatile __bit CSRC1 __attribute__((address(0x7D67)));


extern volatile __bit CVR0 __attribute__((address(0x7DA8)));


extern volatile __bit CVR1 __attribute__((address(0x7DA9)));


extern volatile __bit CVR2 __attribute__((address(0x7DAA)));


extern volatile __bit CVR3 __attribute__((address(0x7DAB)));


extern volatile __bit CVREF __attribute__((address(0x7DAC)));


extern volatile __bit CVREN __attribute__((address(0x7DAF)));


extern volatile __bit CVROE __attribute__((address(0x7DAE)));


extern volatile __bit CVROEN __attribute__((address(0x7DAE)));


extern volatile __bit CVRR __attribute__((address(0x7DAD)));


extern volatile __bit CVRSS __attribute__((address(0x7DAC)));


extern volatile __bit DA __attribute__((address(0x7E3D)));


extern volatile __bit DATA_ADDRESS __attribute__((address(0x7E3D)));


extern volatile __bit DC __attribute__((address(0x7EC1)));


extern volatile __bit DC1B0 __attribute__((address(0x7DEC)));


extern volatile __bit DC1B1 __attribute__((address(0x7DED)));


extern volatile __bit DC2B0 __attribute__((address(0x7DD4)));


extern volatile __bit DC2B1 __attribute__((address(0x7DD5)));


extern volatile __bit DFN8EE __attribute__((address(0x7B5B)));


extern volatile __bit DFN8EF __attribute__((address(0x7B53)));


extern volatile __bit DIR __attribute__((address(0x7B62)));


extern volatile __bit DONE __attribute__((address(0x7E11)));


extern volatile __bit DT __attribute__((address(0x7C17)));


extern volatile __bit D_A __attribute__((address(0x7E3D)));


extern volatile __bit D_NOT_A __attribute__((address(0x7E3D)));


extern volatile __bit D_nA __attribute__((address(0x7E3D)));


extern volatile __bit EBDIS __attribute__((address(0x7E5F)));


extern volatile __bit ECCPAS0 __attribute__((address(0x7DB4)));


extern volatile __bit ECCPAS1 __attribute__((address(0x7DB5)));


extern volatile __bit ECCPAS2 __attribute__((address(0x7DB6)));


extern volatile __bit ECCPASE __attribute__((address(0x7DB7)));


extern volatile __bit EEFS __attribute__((address(0x7D36)));


extern volatile __bit EEIE __attribute__((address(0x7D04)));


extern volatile __bit EEIF __attribute__((address(0x7D0C)));


extern volatile __bit EEIP __attribute__((address(0x7D14)));


extern volatile __bit EEPGD __attribute__((address(0x7D37)));


extern volatile __bit ENDP0 __attribute__((address(0x7B63)));


extern volatile __bit ENDP1 __attribute__((address(0x7B64)));


extern volatile __bit ENDP2 __attribute__((address(0x7B65)));


extern volatile __bit ENDP3 __attribute__((address(0x7B66)));


extern volatile __bit EP0CONDIS __attribute__((address(0x7B83)));


extern volatile __bit EP0HSHK __attribute__((address(0x7B84)));


extern volatile __bit EP0INEN __attribute__((address(0x7B81)));


extern volatile __bit EP0OUTEN __attribute__((address(0x7B82)));


extern volatile __bit EP0STALL __attribute__((address(0x7B80)));


extern volatile __bit EP1CONDIS __attribute__((address(0x7B8B)));


extern volatile __bit EP1HSHK __attribute__((address(0x7B8C)));


extern volatile __bit EP1INEN __attribute__((address(0x7B89)));


extern volatile __bit EP1OUTEN __attribute__((address(0x7B8A)));


extern volatile __bit EP1STALL __attribute__((address(0x7B88)));


extern volatile __bit EP2CONDIS __attribute__((address(0x7B93)));


extern volatile __bit EP2HSHK __attribute__((address(0x7B94)));


extern volatile __bit EP2INEN __attribute__((address(0x7B91)));


extern volatile __bit EP2OUTEN __attribute__((address(0x7B92)));


extern volatile __bit EP2STALL __attribute__((address(0x7B90)));


extern volatile __bit EP3CONDIS __attribute__((address(0x7B9B)));


extern volatile __bit EP3HSHK __attribute__((address(0x7B9C)));


extern volatile __bit EP3INEN __attribute__((address(0x7B99)));


extern volatile __bit EP3OUTEN __attribute__((address(0x7B9A)));


extern volatile __bit EP3STALL __attribute__((address(0x7B98)));


extern volatile __bit EP4CONDIS __attribute__((address(0x7BA3)));


extern volatile __bit EP4HSHK __attribute__((address(0x7BA4)));


extern volatile __bit EP4INEN __attribute__((address(0x7BA1)));


extern volatile __bit EP4OUTEN __attribute__((address(0x7BA2)));


extern volatile __bit EP4STALL __attribute__((address(0x7BA0)));


extern volatile __bit EP5CONDIS __attribute__((address(0x7BAB)));


extern volatile __bit EP5HSHK __attribute__((address(0x7BAC)));


extern volatile __bit EP5INEN __attribute__((address(0x7BA9)));


extern volatile __bit EP5OUTEN __attribute__((address(0x7BAA)));


extern volatile __bit EP5STALL __attribute__((address(0x7BA8)));


extern volatile __bit EP6CONDIS __attribute__((address(0x7BB3)));


extern volatile __bit EP6HSHK __attribute__((address(0x7BB4)));


extern volatile __bit EP6INEN __attribute__((address(0x7BB1)));


extern volatile __bit EP6OUTEN __attribute__((address(0x7BB2)));


extern volatile __bit EP6STALL __attribute__((address(0x7BB0)));


extern volatile __bit EP7CONDIS __attribute__((address(0x7BBB)));


extern volatile __bit EP7HSHK __attribute__((address(0x7BBC)));


extern volatile __bit EP7INEN __attribute__((address(0x7BB9)));


extern volatile __bit EP7OUTEN __attribute__((address(0x7BBA)));


extern volatile __bit EP7STALL __attribute__((address(0x7BB8)));


extern volatile __bit EPCONDIS0 __attribute__((address(0x7B83)));


extern volatile __bit EPCONDIS1 __attribute__((address(0x7B8B)));


extern volatile __bit EPCONDIS10 __attribute__((address(0x7BD3)));


extern volatile __bit EPCONDIS11 __attribute__((address(0x7BDB)));


extern volatile __bit EPCONDIS12 __attribute__((address(0x7BE3)));


extern volatile __bit EPCONDIS13 __attribute__((address(0x7BEB)));


extern volatile __bit EPCONDIS14 __attribute__((address(0x7BF3)));


extern volatile __bit EPCONDIS15 __attribute__((address(0x7BFB)));


extern volatile __bit EPCONDIS2 __attribute__((address(0x7B93)));


extern volatile __bit EPCONDIS3 __attribute__((address(0x7B9B)));


extern volatile __bit EPCONDIS4 __attribute__((address(0x7BA3)));


extern volatile __bit EPCONDIS5 __attribute__((address(0x7BAB)));


extern volatile __bit EPCONDIS6 __attribute__((address(0x7BB3)));


extern volatile __bit EPCONDIS7 __attribute__((address(0x7BBB)));


extern volatile __bit EPCONDIS8 __attribute__((address(0x7BC3)));


extern volatile __bit EPCONDIS9 __attribute__((address(0x7BCB)));


extern volatile __bit EPHSHK0 __attribute__((address(0x7B84)));


extern volatile __bit EPHSHK1 __attribute__((address(0x7B8C)));


extern volatile __bit EPHSHK10 __attribute__((address(0x7BD4)));


extern volatile __bit EPHSHK11 __attribute__((address(0x7BDC)));


extern volatile __bit EPHSHK12 __attribute__((address(0x7BE4)));


extern volatile __bit EPHSHK13 __attribute__((address(0x7BEC)));


extern volatile __bit EPHSHK14 __attribute__((address(0x7BF4)));


extern volatile __bit EPHSHK15 __attribute__((address(0x7BFC)));


extern volatile __bit EPHSHK2 __attribute__((address(0x7B94)));


extern volatile __bit EPHSHK3 __attribute__((address(0x7B9C)));


extern volatile __bit EPHSHK4 __attribute__((address(0x7BA4)));


extern volatile __bit EPHSHK5 __attribute__((address(0x7BAC)));


extern volatile __bit EPHSHK6 __attribute__((address(0x7BB4)));


extern volatile __bit EPHSHK7 __attribute__((address(0x7BBC)));


extern volatile __bit EPHSHK8 __attribute__((address(0x7BC4)));


extern volatile __bit EPHSHK9 __attribute__((address(0x7BCC)));


extern volatile __bit EPINEN0 __attribute__((address(0x7B81)));


extern volatile __bit EPINEN1 __attribute__((address(0x7B89)));


extern volatile __bit EPINEN10 __attribute__((address(0x7BD1)));


extern volatile __bit EPINEN11 __attribute__((address(0x7BD9)));


extern volatile __bit EPINEN12 __attribute__((address(0x7BE1)));


extern volatile __bit EPINEN13 __attribute__((address(0x7BE9)));


extern volatile __bit EPINEN14 __attribute__((address(0x7BF1)));


extern volatile __bit EPINEN15 __attribute__((address(0x7BF9)));


extern volatile __bit EPINEN2 __attribute__((address(0x7B91)));


extern volatile __bit EPINEN3 __attribute__((address(0x7B99)));


extern volatile __bit EPINEN4 __attribute__((address(0x7BA1)));


extern volatile __bit EPINEN5 __attribute__((address(0x7BA9)));


extern volatile __bit EPINEN6 __attribute__((address(0x7BB1)));


extern volatile __bit EPINEN7 __attribute__((address(0x7BB9)));


extern volatile __bit EPINEN8 __attribute__((address(0x7BC1)));


extern volatile __bit EPINEN9 __attribute__((address(0x7BC9)));


extern volatile __bit EPOUTEN0 __attribute__((address(0x7B82)));


extern volatile __bit EPOUTEN1 __attribute__((address(0x7B8A)));


extern volatile __bit EPOUTEN10 __attribute__((address(0x7BD2)));


extern volatile __bit EPOUTEN11 __attribute__((address(0x7BDA)));


extern volatile __bit EPOUTEN12 __attribute__((address(0x7BE2)));


extern volatile __bit EPOUTEN13 __attribute__((address(0x7BEA)));


extern volatile __bit EPOUTEN14 __attribute__((address(0x7BF2)));


extern volatile __bit EPOUTEN15 __attribute__((address(0x7BFA)));


extern volatile __bit EPOUTEN2 __attribute__((address(0x7B92)));


extern volatile __bit EPOUTEN3 __attribute__((address(0x7B9A)));


extern volatile __bit EPOUTEN4 __attribute__((address(0x7BA2)));


extern volatile __bit EPOUTEN5 __attribute__((address(0x7BAA)));


extern volatile __bit EPOUTEN6 __attribute__((address(0x7BB2)));


extern volatile __bit EPOUTEN7 __attribute__((address(0x7BBA)));


extern volatile __bit EPOUTEN8 __attribute__((address(0x7BC2)));


extern volatile __bit EPOUTEN9 __attribute__((address(0x7BCA)));


extern volatile __bit EPSTALL0 __attribute__((address(0x7B80)));


extern volatile __bit EPSTALL1 __attribute__((address(0x7B88)));


extern volatile __bit EPSTALL10 __attribute__((address(0x7BD0)));


extern volatile __bit EPSTALL11 __attribute__((address(0x7BD8)));


extern volatile __bit EPSTALL12 __attribute__((address(0x7BE0)));


extern volatile __bit EPSTALL13 __attribute__((address(0x7BE8)));


extern volatile __bit EPSTALL14 __attribute__((address(0x7BF0)));


extern volatile __bit EPSTALL15 __attribute__((address(0x7BF8)));


extern volatile __bit EPSTALL2 __attribute__((address(0x7B90)));


extern volatile __bit EPSTALL3 __attribute__((address(0x7B98)));


extern volatile __bit EPSTALL4 __attribute__((address(0x7BA0)));


extern volatile __bit EPSTALL5 __attribute__((address(0x7BA8)));


extern volatile __bit EPSTALL6 __attribute__((address(0x7BB0)));


extern volatile __bit EPSTALL7 __attribute__((address(0x7BB8)));


extern volatile __bit EPSTALL8 __attribute__((address(0x7BC0)));


extern volatile __bit EPSTALL9 __attribute__((address(0x7BC8)));


extern volatile __bit FERR __attribute__((address(0x7D5A)));


extern volatile __bit FLTS __attribute__((address(0x7E9A)));


extern volatile __bit FREE __attribute__((address(0x7D34)));


extern volatile __bit FRM0 __attribute__((address(0x7B30)));


extern volatile __bit FRM1 __attribute__((address(0x7B31)));


extern volatile __bit FRM10 __attribute__((address(0x7B3A)));


extern volatile __bit FRM2 __attribute__((address(0x7B32)));


extern volatile __bit FRM3 __attribute__((address(0x7B33)));


extern volatile __bit FRM4 __attribute__((address(0x7B34)));


extern volatile __bit FRM5 __attribute__((address(0x7B35)));


extern volatile __bit FRM6 __attribute__((address(0x7B36)));


extern volatile __bit FRM7 __attribute__((address(0x7B37)));


extern volatile __bit FRM8 __attribute__((address(0x7B38)));


extern volatile __bit FRM9 __attribute__((address(0x7B39)));


extern volatile __bit FSEN __attribute__((address(0x7B7A)));


extern volatile __bit GCEN __attribute__((address(0x7E2F)));


extern volatile __bit GIE __attribute__((address(0x7F97)));


extern volatile __bit GIEH __attribute__((address(0x7F97)));


extern volatile __bit GIEL __attribute__((address(0x7F96)));


extern volatile __bit GIE_GIEH __attribute__((address(0x7F97)));


extern volatile __bit GO __attribute__((address(0x7E11)));


extern volatile __bit GODONE __attribute__((address(0x7E11)));


extern volatile __bit GO_DONE __attribute__((address(0x7E11)));


extern volatile __bit GO_NOT_DONE __attribute__((address(0x7E11)));


extern volatile __bit GO_nDONE __attribute__((address(0x7E11)));


extern volatile __bit HLVDEN __attribute__((address(0x7E94)));


extern volatile __bit HLVDIE __attribute__((address(0x7D02)));


extern volatile __bit HLVDIF __attribute__((address(0x7D0A)));


extern volatile __bit HLVDIN __attribute__((address(0x7C05)));


extern volatile __bit HLVDIP __attribute__((address(0x7D12)));


extern volatile __bit HLVDL0 __attribute__((address(0x7E90)));


extern volatile __bit HLVDL1 __attribute__((address(0x7E91)));


extern volatile __bit HLVDL2 __attribute__((address(0x7E92)));


extern volatile __bit HLVDL3 __attribute__((address(0x7E93)));


extern volatile __bit I2C_DAT __attribute__((address(0x7E3D)));


extern volatile __bit I2C_READ __attribute__((address(0x7E3A)));


extern volatile __bit I2C_START __attribute__((address(0x7E3B)));


extern volatile __bit I2C_STOP __attribute__((address(0x7E3C)));


extern volatile __bit IDLEIE __attribute__((address(0x7B4C)));


extern volatile __bit IDLEIF __attribute__((address(0x7B44)));


extern volatile __bit IDLEN __attribute__((address(0x7E9F)));


extern volatile __bit INT0 __attribute__((address(0x7C08)));


extern volatile __bit INT0E __attribute__((address(0x7F94)));


extern volatile __bit INT0F __attribute__((address(0x7F91)));


extern volatile __bit INT0IE __attribute__((address(0x7F94)));


extern volatile __bit INT0IF __attribute__((address(0x7F91)));


extern volatile __bit INT1 __attribute__((address(0x7C09)));


extern volatile __bit INT1E __attribute__((address(0x7F83)));


extern volatile __bit INT1F __attribute__((address(0x7F80)));


extern volatile __bit INT1IE __attribute__((address(0x7F83)));


extern volatile __bit INT1IF __attribute__((address(0x7F80)));


extern volatile __bit INT1IP __attribute__((address(0x7F86)));


extern volatile __bit INT1P __attribute__((address(0x7F86)));


extern volatile __bit INT2 __attribute__((address(0x7C0A)));


extern volatile __bit INT2E __attribute__((address(0x7F84)));


extern volatile __bit INT2F __attribute__((address(0x7F81)));


extern volatile __bit INT2IE __attribute__((address(0x7F84)));


extern volatile __bit INT2IF __attribute__((address(0x7F81)));


extern volatile __bit INT2IP __attribute__((address(0x7F87)));


extern volatile __bit INT2P __attribute__((address(0x7F87)));


extern volatile __bit INTEDG0 __attribute__((address(0x7F8E)));


extern volatile __bit INTEDG1 __attribute__((address(0x7F8D)));


extern volatile __bit INTEDG2 __attribute__((address(0x7F8C)));


extern volatile __bit INTSRC __attribute__((address(0x7CDF)));


extern volatile __bit IOFS __attribute__((address(0x7E9A)));


extern volatile __bit IPEN __attribute__((address(0x7E87)));


extern volatile __bit IRCF0 __attribute__((address(0x7E9C)));


extern volatile __bit IRCF1 __attribute__((address(0x7E9D)));


extern volatile __bit IRCF2 __attribute__((address(0x7E9E)));


extern volatile __bit IRVST __attribute__((address(0x7E95)));


extern volatile __bit IVRST __attribute__((address(0x7E95)));


extern volatile __bit LA0 __attribute__((address(0x7C48)));


extern volatile __bit LA1 __attribute__((address(0x7C49)));


extern volatile __bit LA2 __attribute__((address(0x7C4A)));


extern volatile __bit LA3 __attribute__((address(0x7C4B)));


extern volatile __bit LA4 __attribute__((address(0x7C4C)));


extern volatile __bit LA5 __attribute__((address(0x7C4D)));


extern volatile __bit LA6 __attribute__((address(0x7C4E)));


extern volatile __bit LATA0 __attribute__((address(0x7C48)));


extern volatile __bit LATA1 __attribute__((address(0x7C49)));


extern volatile __bit LATA2 __attribute__((address(0x7C4A)));


extern volatile __bit LATA3 __attribute__((address(0x7C4B)));


extern volatile __bit LATA4 __attribute__((address(0x7C4C)));


extern volatile __bit LATA5 __attribute__((address(0x7C4D)));


extern volatile __bit LATA6 __attribute__((address(0x7C4E)));


extern volatile __bit LATB0 __attribute__((address(0x7C50)));


extern volatile __bit LATB1 __attribute__((address(0x7C51)));


extern volatile __bit LATB2 __attribute__((address(0x7C52)));


extern volatile __bit LATB3 __attribute__((address(0x7C53)));


extern volatile __bit LATB4 __attribute__((address(0x7C54)));


extern volatile __bit LATB5 __attribute__((address(0x7C55)));


extern volatile __bit LATB6 __attribute__((address(0x7C56)));


extern volatile __bit LATB7 __attribute__((address(0x7C57)));


extern volatile __bit LATC0 __attribute__((address(0x7C58)));


extern volatile __bit LATC1 __attribute__((address(0x7C59)));


extern volatile __bit LATC2 __attribute__((address(0x7C5A)));


extern volatile __bit LATC6 __attribute__((address(0x7C5E)));


extern volatile __bit LATC7 __attribute__((address(0x7C5F)));


extern volatile __bit LB0 __attribute__((address(0x7C50)));


extern volatile __bit LB1 __attribute__((address(0x7C51)));


extern volatile __bit LB2 __attribute__((address(0x7C52)));


extern volatile __bit LB3 __attribute__((address(0x7C53)));


extern volatile __bit LB4 __attribute__((address(0x7C54)));


extern volatile __bit LB5 __attribute__((address(0x7C55)));


extern volatile __bit LB6 __attribute__((address(0x7C56)));


extern volatile __bit LB7 __attribute__((address(0x7C57)));


extern volatile __bit LC0 __attribute__((address(0x7C58)));


extern volatile __bit LC1 __attribute__((address(0x7C59)));


extern volatile __bit LC2 __attribute__((address(0x7C5A)));


extern volatile __bit LC6 __attribute__((address(0x7C5E)));


extern volatile __bit LC7 __attribute__((address(0x7C5F)));


extern volatile __bit LVDEN __attribute__((address(0x7E94)));


extern volatile __bit LVDIE __attribute__((address(0x7D02)));


extern volatile __bit LVDIF __attribute__((address(0x7D0A)));


extern volatile __bit LVDIN __attribute__((address(0x7C05)));


extern volatile __bit LVDIP __attribute__((address(0x7D12)));


extern volatile __bit LVDL0 __attribute__((address(0x7E90)));


extern volatile __bit LVDL1 __attribute__((address(0x7E91)));


extern volatile __bit LVDL2 __attribute__((address(0x7E92)));


extern volatile __bit LVDL3 __attribute__((address(0x7E93)));


extern volatile __bit LVV0 __attribute__((address(0x7E90)));


extern volatile __bit LVV1 __attribute__((address(0x7E91)));


extern volatile __bit LVV2 __attribute__((address(0x7E92)));


extern volatile __bit LVV3 __attribute__((address(0x7E93)));


extern volatile __bit NEGATIVE __attribute__((address(0x7EC4)));


extern volatile __bit NOT_A __attribute__((address(0x7E3D)));


extern volatile __bit NOT_ADDRESS __attribute__((address(0x7E3D)));


extern volatile __bit NOT_BOR __attribute__((address(0x7E80)));


extern volatile __bit NOT_DONE __attribute__((address(0x7E11)));


extern volatile __bit NOT_IPEN __attribute__((address(0x7E87)));


extern volatile __bit NOT_PD __attribute__((address(0x7E82)));


extern volatile __bit NOT_POR __attribute__((address(0x7E81)));


extern volatile __bit NOT_RBPU __attribute__((address(0x7F8F)));


extern volatile __bit NOT_RI __attribute__((address(0x7E84)));


extern volatile __bit NOT_T1SYNC __attribute__((address(0x7E6A)));


extern volatile __bit NOT_T3SYNC __attribute__((address(0x7D8A)));


extern volatile __bit NOT_TO __attribute__((address(0x7E83)));


extern volatile __bit NOT_W __attribute__((address(0x7E3A)));


extern volatile __bit NOT_WRITE __attribute__((address(0x7E3A)));


extern volatile __bit OERR __attribute__((address(0x7D59)));


extern volatile __bit OSC2 __attribute__((address(0x7C06)));


extern volatile __bit OSCFIE __attribute__((address(0x7D07)));


extern volatile __bit OSCFIF __attribute__((address(0x7D0F)));


extern volatile __bit OSCFIP __attribute__((address(0x7D17)));


extern volatile __bit OSTS __attribute__((address(0x7E9B)));


extern volatile __bit OV __attribute__((address(0x7EC3)));


extern volatile __bit OVERFLOW __attribute__((address(0x7EC3)));


extern volatile __bit P1A __attribute__((address(0x7C12)));


extern volatile __bit PA1 __attribute__((address(0x7C12)));


extern volatile __bit PA2 __attribute__((address(0x7C11)));


extern volatile __bit PC3E __attribute__((address(0x7C23)));


extern volatile __bit PCFG0 __attribute__((address(0x7E08)));


extern volatile __bit PCFG1 __attribute__((address(0x7E09)));


extern volatile __bit PCFG2 __attribute__((address(0x7E0A)));


extern volatile __bit PCFG3 __attribute__((address(0x7E0B)));


extern volatile __bit PD __attribute__((address(0x7E82)));


extern volatile __bit PEIE __attribute__((address(0x7F96)));


extern volatile __bit PEIE_GIEL __attribute__((address(0x7F96)));


extern volatile __bit PEN __attribute__((address(0x7E2A)));


extern volatile __bit PGC __attribute__((address(0x7C0E)));


extern volatile __bit PGD __attribute__((address(0x7C0F)));


extern volatile __bit PGM __attribute__((address(0x7C0D)));


extern volatile __bit PIDEE __attribute__((address(0x7B58)));


extern volatile __bit PIDEF __attribute__((address(0x7B50)));


extern volatile __bit PKTDIS __attribute__((address(0x7B6C)));


extern volatile __bit POR __attribute__((address(0x7E81)));


extern volatile __bit PPB0 __attribute__((address(0x7B78)));


extern volatile __bit PPB1 __attribute__((address(0x7B79)));


extern volatile __bit PPBI __attribute__((address(0x7B61)));


extern volatile __bit PPBRST __attribute__((address(0x7B6E)));


extern volatile __bit PRSEN __attribute__((address(0x7DBF)));


extern volatile __bit PSA __attribute__((address(0x7EAB)));


extern volatile __bit PSSAC0 __attribute__((address(0x7DB2)));


extern volatile __bit PSSAC1 __attribute__((address(0x7DB3)));


extern volatile __bit __attribute__((__deprecated__)) RA0 __attribute__((address(0x7C00)));


extern volatile __bit __attribute__((__deprecated__)) RA1 __attribute__((address(0x7C01)));


extern volatile __bit __attribute__((__deprecated__)) RA2 __attribute__((address(0x7C02)));


extern volatile __bit __attribute__((__deprecated__)) RA3 __attribute__((address(0x7C03)));


extern volatile __bit __attribute__((__deprecated__)) RA4 __attribute__((address(0x7C04)));


extern volatile __bit __attribute__((__deprecated__)) RA5 __attribute__((address(0x7C05)));


extern volatile __bit __attribute__((__deprecated__)) RA6 __attribute__((address(0x7C06)));


extern volatile __bit __attribute__((__deprecated__)) RB0 __attribute__((address(0x7C08)));


extern volatile __bit __attribute__((__deprecated__)) RB1 __attribute__((address(0x7C09)));


extern volatile __bit __attribute__((__deprecated__)) RB2 __attribute__((address(0x7C0A)));


extern volatile __bit __attribute__((__deprecated__)) RB3 __attribute__((address(0x7C0B)));


extern volatile __bit __attribute__((__deprecated__)) RB4 __attribute__((address(0x7C0C)));


extern volatile __bit __attribute__((__deprecated__)) RB5 __attribute__((address(0x7C0D)));


extern volatile __bit __attribute__((__deprecated__)) RB6 __attribute__((address(0x7C0E)));


extern volatile __bit __attribute__((__deprecated__)) RB7 __attribute__((address(0x7C0F)));


extern volatile __bit RBIE __attribute__((address(0x7F93)));


extern volatile __bit RBIF __attribute__((address(0x7F90)));


extern volatile __bit RBIP __attribute__((address(0x7F88)));


extern volatile __bit RBPU __attribute__((address(0x7F8F)));


extern volatile __bit __attribute__((__deprecated__)) RC0 __attribute__((address(0x7C10)));


extern volatile __bit __attribute__((__deprecated__)) RC1 __attribute__((address(0x7C11)));


extern volatile __bit RC1IE __attribute__((address(0x7CED)));


extern volatile __bit RC1IF __attribute__((address(0x7CF5)));


extern volatile __bit RC1IP __attribute__((address(0x7CFD)));


extern volatile __bit __attribute__((__deprecated__)) RC2 __attribute__((address(0x7C12)));


extern volatile __bit RC4 __attribute__((address(0x7C14)));


extern volatile __bit RC5 __attribute__((address(0x7C15)));


extern volatile __bit __attribute__((__deprecated__)) RC6 __attribute__((address(0x7C16)));


extern volatile __bit __attribute__((__deprecated__)) RC7 __attribute__((address(0x7C17)));


extern volatile __bit RC8_9 __attribute__((address(0x7D5E)));


extern volatile __bit RC9 __attribute__((address(0x7D5E)));


extern volatile __bit RCD8 __attribute__((address(0x7D58)));


extern volatile __bit RCEN __attribute__((address(0x7E2B)));


extern volatile __bit RCIDL __attribute__((address(0x7DC6)));


extern volatile __bit RCIE __attribute__((address(0x7CED)));


extern volatile __bit RCIF __attribute__((address(0x7CF5)));


extern volatile __bit RCIP __attribute__((address(0x7CFD)));


extern volatile __bit RCMT __attribute__((address(0x7DC6)));


extern volatile __bit RD __attribute__((address(0x7D30)));


extern volatile __bit RD163 __attribute__((address(0x7D8F)));


extern volatile __bit RE3 __attribute__((address(0x7C23)));


extern volatile __bit READ_WRITE __attribute__((address(0x7E3A)));


extern volatile __bit RESUME __attribute__((address(0x7B6A)));


extern volatile __bit RI __attribute__((address(0x7E84)));


extern volatile __bit RSEN __attribute__((address(0x7E29)));


extern volatile __bit RW __attribute__((address(0x7E3A)));


extern volatile __bit RX __attribute__((address(0x7C17)));


extern volatile __bit RX9 __attribute__((address(0x7D5E)));


extern volatile __bit RX9D __attribute__((address(0x7D58)));


extern volatile __bit RXCKP __attribute__((address(0x7DC5)));


extern volatile __bit RXDTP __attribute__((address(0x7DC5)));


extern volatile __bit R_NOT_W __attribute__((address(0x7E3A)));


extern volatile __bit R_W __attribute__((address(0x7E3A)));


extern volatile __bit R_nW __attribute__((address(0x7E3A)));


extern volatile __bit SBOREN __attribute__((address(0x7E86)));


extern volatile __bit SCKP __attribute__((address(0x7DC4)));


extern volatile __bit SCS0 __attribute__((address(0x7E98)));


extern volatile __bit SCS1 __attribute__((address(0x7E99)));


extern volatile __bit SE0 __attribute__((address(0x7B6D)));


extern volatile __bit SEN __attribute__((address(0x7E28)));


extern volatile __bit SENDB __attribute__((address(0x7D63)));


extern volatile __bit SENDB1 __attribute__((address(0x7D63)));


extern volatile __bit SMP __attribute__((address(0x7E3F)));


extern volatile __bit SOFIE __attribute__((address(0x7B4E)));


extern volatile __bit SOFIF __attribute__((address(0x7B46)));


extern volatile __bit SOSCEN __attribute__((address(0x7E6B)));


extern volatile __bit SOSCEN3 __attribute__((address(0x7D8B)));


extern volatile __bit SPEN __attribute__((address(0x7D5F)));


extern volatile __bit SREN __attribute__((address(0x7D5D)));


extern volatile __bit SRENA __attribute__((address(0x7D5D)));


extern volatile __bit SSPEN __attribute__((address(0x7E35)));


extern volatile __bit SSPIE __attribute__((address(0x7CEB)));


extern volatile __bit SSPIF __attribute__((address(0x7CF3)));


extern volatile __bit SSPIP __attribute__((address(0x7CFB)));


extern volatile __bit SSPM0 __attribute__((address(0x7E30)));


extern volatile __bit SSPM1 __attribute__((address(0x7E31)));


extern volatile __bit SSPM2 __attribute__((address(0x7E32)));


extern volatile __bit SSPM3 __attribute__((address(0x7E33)));


extern volatile __bit SSPOV __attribute__((address(0x7E36)));


extern volatile __bit STALLIE __attribute__((address(0x7B4D)));


extern volatile __bit STALLIF __attribute__((address(0x7B45)));


extern volatile __bit START __attribute__((address(0x7E3B)));


extern volatile __bit STKFUL __attribute__((address(0x7FE7)));


extern volatile __bit STKOVF __attribute__((address(0x7FE7)));


extern volatile __bit STKPTR0 __attribute__((address(0x7FE0)));


extern volatile __bit STKPTR1 __attribute__((address(0x7FE1)));


extern volatile __bit STKPTR2 __attribute__((address(0x7FE2)));


extern volatile __bit STKPTR3 __attribute__((address(0x7FE3)));


extern volatile __bit STKPTR4 __attribute__((address(0x7FE4)));


extern volatile __bit STKUNF __attribute__((address(0x7FE6)));


extern volatile __bit STOP __attribute__((address(0x7E3C)));


extern volatile __bit SUSPND __attribute__((address(0x7B69)));


extern volatile __bit SWDTE __attribute__((address(0x7E88)));


extern volatile __bit SWDTEN __attribute__((address(0x7E88)));


extern volatile __bit SYNC __attribute__((address(0x7D64)));


extern volatile __bit SYNC1 __attribute__((address(0x7D64)));


extern volatile __bit T08BIT __attribute__((address(0x7EAE)));


extern volatile __bit T0CKI __attribute__((address(0x7C04)));


extern volatile __bit T0CS __attribute__((address(0x7EAD)));


extern volatile __bit T0IE __attribute__((address(0x7F95)));


extern volatile __bit T0IF __attribute__((address(0x7F92)));


extern volatile __bit T0IP __attribute__((address(0x7F8A)));


extern volatile __bit T0PS0 __attribute__((address(0x7EA8)));


extern volatile __bit T0PS1 __attribute__((address(0x7EA9)));


extern volatile __bit T0PS2 __attribute__((address(0x7EAA)));


extern volatile __bit T0SE __attribute__((address(0x7EAC)));


extern volatile __bit T13CKI __attribute__((address(0x7C10)));


extern volatile __bit T1CKPS0 __attribute__((address(0x7E6C)));


extern volatile __bit T1CKPS1 __attribute__((address(0x7E6D)));


extern volatile __bit T1OSCEN __attribute__((address(0x7E6B)));


extern volatile __bit T1OSI __attribute__((address(0x7C11)));


extern volatile __bit T1OSO __attribute__((address(0x7C10)));


extern volatile __bit T1RD16 __attribute__((address(0x7E6F)));


extern volatile __bit T1RUN __attribute__((address(0x7E6E)));


extern volatile __bit T1SYNC __attribute__((address(0x7E6A)));


extern volatile __bit T2CKPS0 __attribute__((address(0x7E50)));


extern volatile __bit T2CKPS1 __attribute__((address(0x7E51)));


extern volatile __bit T2OUTPS0 __attribute__((address(0x7E53)));


extern volatile __bit T2OUTPS1 __attribute__((address(0x7E54)));


extern volatile __bit T2OUTPS2 __attribute__((address(0x7E55)));


extern volatile __bit T2OUTPS3 __attribute__((address(0x7E56)));


extern volatile __bit T3CCP1 __attribute__((address(0x7D8B)));


extern volatile __bit T3CCP2 __attribute__((address(0x7D8E)));


extern volatile __bit T3CKPS0 __attribute__((address(0x7D8C)));


extern volatile __bit T3CKPS1 __attribute__((address(0x7D8D)));


extern volatile __bit T3NSYNC __attribute__((address(0x7D8A)));


extern volatile __bit T3RD16 __attribute__((address(0x7D8F)));


extern volatile __bit T3SYNC __attribute__((address(0x7D8A)));


extern volatile __bit TMR0IE __attribute__((address(0x7F95)));


extern volatile __bit TMR0IF __attribute__((address(0x7F92)));


extern volatile __bit TMR0IP __attribute__((address(0x7F8A)));


extern volatile __bit TMR0ON __attribute__((address(0x7EAF)));


extern volatile __bit TMR1CS __attribute__((address(0x7E69)));


extern volatile __bit TMR1IE __attribute__((address(0x7CE8)));


extern volatile __bit TMR1IF __attribute__((address(0x7CF0)));


extern volatile __bit TMR1IP __attribute__((address(0x7CF8)));


extern volatile __bit TMR1ON __attribute__((address(0x7E68)));


extern volatile __bit TMR2IE __attribute__((address(0x7CE9)));


extern volatile __bit TMR2IF __attribute__((address(0x7CF1)));


extern volatile __bit TMR2IP __attribute__((address(0x7CF9)));


extern volatile __bit TMR2ON __attribute__((address(0x7E52)));


extern volatile __bit TMR3CS __attribute__((address(0x7D89)));


extern volatile __bit TMR3IE __attribute__((address(0x7D01)));


extern volatile __bit TMR3IF __attribute__((address(0x7D09)));


extern volatile __bit TMR3IP __attribute__((address(0x7D11)));


extern volatile __bit TMR3ON __attribute__((address(0x7D88)));


extern volatile __bit TO __attribute__((address(0x7E83)));


extern volatile __bit TOUTPS0 __attribute__((address(0x7E53)));


extern volatile __bit TOUTPS1 __attribute__((address(0x7E54)));


extern volatile __bit TOUTPS2 __attribute__((address(0x7E55)));


extern volatile __bit TOUTPS3 __attribute__((address(0x7E56)));


extern volatile __bit TRISA0 __attribute__((address(0x7C90)));


extern volatile __bit TRISA1 __attribute__((address(0x7C91)));


extern volatile __bit TRISA2 __attribute__((address(0x7C92)));


extern volatile __bit TRISA3 __attribute__((address(0x7C93)));


extern volatile __bit TRISA4 __attribute__((address(0x7C94)));


extern volatile __bit TRISA5 __attribute__((address(0x7C95)));


extern volatile __bit TRISA6 __attribute__((address(0x7C96)));


extern volatile __bit TRISB0 __attribute__((address(0x7C98)));


extern volatile __bit TRISB1 __attribute__((address(0x7C99)));


extern volatile __bit TRISB2 __attribute__((address(0x7C9A)));


extern volatile __bit TRISB3 __attribute__((address(0x7C9B)));


extern volatile __bit TRISB4 __attribute__((address(0x7C9C)));


extern volatile __bit TRISB5 __attribute__((address(0x7C9D)));


extern volatile __bit TRISB6 __attribute__((address(0x7C9E)));


extern volatile __bit TRISB7 __attribute__((address(0x7C9F)));


extern volatile __bit TRISC0 __attribute__((address(0x7CA0)));


extern volatile __bit TRISC1 __attribute__((address(0x7CA1)));


extern volatile __bit TRISC2 __attribute__((address(0x7CA2)));


extern volatile __bit TRISC6 __attribute__((address(0x7CA6)));


extern volatile __bit TRISC7 __attribute__((address(0x7CA7)));


extern volatile __bit TRMT __attribute__((address(0x7D61)));


extern volatile __bit TRMT1 __attribute__((address(0x7D61)));


extern volatile __bit TRNIE __attribute__((address(0x7B4B)));


extern volatile __bit TRNIF __attribute__((address(0x7B43)));


extern volatile __bit TUN0 __attribute__((address(0x7CD8)));


extern volatile __bit TUN1 __attribute__((address(0x7CD9)));


extern volatile __bit TUN2 __attribute__((address(0x7CDA)));


extern volatile __bit TUN3 __attribute__((address(0x7CDB)));


extern volatile __bit TUN4 __attribute__((address(0x7CDC)));


extern volatile __bit TX __attribute__((address(0x7C16)));


extern volatile __bit TX1IE __attribute__((address(0x7CEC)));


extern volatile __bit TX1IF __attribute__((address(0x7CF4)));


extern volatile __bit TX1IP __attribute__((address(0x7CFC)));


extern volatile __bit TX8_9 __attribute__((address(0x7D66)));


extern volatile __bit TX9 __attribute__((address(0x7D66)));


extern volatile __bit TX91 __attribute__((address(0x7D66)));


extern volatile __bit TX9D __attribute__((address(0x7D60)));


extern volatile __bit TX9D1 __attribute__((address(0x7D60)));


extern volatile __bit TXCKP __attribute__((address(0x7DC4)));


extern volatile __bit TXD8 __attribute__((address(0x7D60)));


extern volatile __bit TXEN __attribute__((address(0x7D65)));


extern volatile __bit TXEN1 __attribute__((address(0x7D65)));


extern volatile __bit TXIE __attribute__((address(0x7CEC)));


extern volatile __bit TXIF __attribute__((address(0x7CF4)));


extern volatile __bit TXIP __attribute__((address(0x7CFC)));


extern volatile __bit UA __attribute__((address(0x7E39)));


extern volatile __bit UERRIE __attribute__((address(0x7B49)));


extern volatile __bit UERRIF __attribute__((address(0x7B41)));


extern volatile __bit ULPWUIN __attribute__((address(0x7C00)));


extern volatile __bit UOEMON __attribute__((address(0x7B7E)));


extern volatile __bit UPP0 __attribute__((address(0x7B78)));


extern volatile __bit UPP1 __attribute__((address(0x7B79)));


extern volatile __bit UPUEN __attribute__((address(0x7B7C)));


extern volatile __bit URSTIE __attribute__((address(0x7B48)));


extern volatile __bit URSTIF __attribute__((address(0x7B40)));


extern volatile __bit USBEN __attribute__((address(0x7B6B)));


extern volatile __bit USBIE __attribute__((address(0x7D05)));


extern volatile __bit USBIF __attribute__((address(0x7D0D)));


extern volatile __bit USBIP __attribute__((address(0x7D15)));


extern volatile __bit UTEYE __attribute__((address(0x7B7F)));


extern volatile __bit UTRDIS __attribute__((address(0x7B7B)));


extern volatile __bit VCFG0 __attribute__((address(0x7E0C)));


extern volatile __bit VCFG01 __attribute__((address(0x7E0C)));


extern volatile __bit VCFG1 __attribute__((address(0x7E0D)));


extern volatile __bit VCFG11 __attribute__((address(0x7E0D)));


extern volatile __bit VDIRMAG __attribute__((address(0x7E97)));


extern volatile __bit VREFM __attribute__((address(0x7C02)));


extern volatile __bit VREFP __attribute__((address(0x7C03)));


extern volatile __bit W4E __attribute__((address(0x7DC1)));


extern volatile __bit WAIT0 __attribute__((address(0x7E5C)));


extern volatile __bit WAIT1 __attribute__((address(0x7E5D)));


extern volatile __bit WCOL __attribute__((address(0x7E37)));


extern volatile __bit WM0 __attribute__((address(0x7E58)));


extern volatile __bit WM1 __attribute__((address(0x7E59)));


extern volatile __bit WR __attribute__((address(0x7D31)));


extern volatile __bit WREN __attribute__((address(0x7D32)));


extern volatile __bit WRERR __attribute__((address(0x7D33)));


extern volatile __bit WUE __attribute__((address(0x7DC1)));


extern volatile __bit ZERO __attribute__((address(0x7EC2)));


extern volatile __bit nA __attribute__((address(0x7E3D)));


extern volatile __bit nADDRESS __attribute__((address(0x7E3D)));


extern volatile __bit nBOR __attribute__((address(0x7E80)));


extern volatile __bit nDONE __attribute__((address(0x7E11)));


extern volatile __bit nIPEN __attribute__((address(0x7E87)));


extern volatile __bit nPD __attribute__((address(0x7E82)));


extern volatile __bit nPOR __attribute__((address(0x7E81)));


extern volatile __bit nRBPU __attribute__((address(0x7F8F)));


extern volatile __bit nRI __attribute__((address(0x7E84)));


extern volatile __bit nT1SYNC __attribute__((address(0x7E6A)));


extern volatile __bit nT3SYNC __attribute__((address(0x7D8A)));


extern volatile __bit nTO __attribute__((address(0x7E83)));


extern volatile __bit nW __attribute__((address(0x7E3A)));


extern volatile __bit nWRITE __attribute__((address(0x7E3A)));

# 18 "/opt/microchip/xc8/v2.10/pic/include/pic18.h"
__attribute__((__unsupported__("The " "flash_write" " routine is no longer supported. Please use the MPLAB X MCC."))) void flash_write(const unsigned char *, unsigned int, __far unsigned char *);
__attribute__((__unsupported__("The " "EraseFlash" " routine is no longer supported. Please use the MPLAB X MCC."))) void EraseFlash(unsigned long startaddr, unsigned long endaddr);


# 49
#pragma intrinsic(__nop)
extern void __nop(void);

# 158
__attribute__((__unsupported__("The " "Read_b_eep" " routine is no longer supported. Please use the MPLAB X MCC."))) unsigned char Read_b_eep(unsigned int badd);
__attribute__((__unsupported__("The " "Busy_eep" " routine is no longer supported. Please use the MPLAB X MCC."))) void Busy_eep(void);
__attribute__((__unsupported__("The " "Write_b_eep" " routine is no longer supported. Please use the MPLAB X MCC."))) void Write_b_eep(unsigned int badd, unsigned char bdat);

# 178
unsigned char __t1rd16on(void);
unsigned char __t3rd16on(void);


# 186
#pragma intrinsic(_delay)
extern __nonreentrant void _delay(unsigned long);
#pragma intrinsic(_delaywdt)
extern __nonreentrant void _delaywdt(unsigned long);
#pragma intrinsic(_delay3)
extern __nonreentrant void _delay3(unsigned char);

# 7 "/opt/microchip/xc8/v2.10/pic/include/c90/stdlib.h"
typedef unsigned short wchar_t;

# 15
typedef struct {
int rem;
int quot;
} div_t;
typedef struct {
unsigned rem;
unsigned quot;
} udiv_t;
typedef struct {
long quot;
long rem;
} ldiv_t;
typedef struct {
unsigned long quot;
unsigned long rem;
} uldiv_t;

# 65
extern double atof(const char *);
extern double strtod(const char *, const char **);
extern int atoi(const char *);
extern unsigned xtoi(const char *);
extern long atol(const char *);

# 73
extern long strtol(const char *, char **, int);

extern int rand(void);
extern void srand(unsigned int);
extern void * calloc(size_t, size_t);
extern div_t div(int numer, int denom);
extern udiv_t udiv(unsigned numer, unsigned denom);
extern ldiv_t ldiv(long numer, long denom);
extern uldiv_t uldiv(unsigned long numer,unsigned long denom);

# 85
extern unsigned long _lrotl(unsigned long value, unsigned int shift);
extern unsigned long _lrotr(unsigned long value, unsigned int shift);
extern unsigned int _rotl(unsigned int value, unsigned int shift);
extern unsigned int _rotr(unsigned int value, unsigned int shift);




extern void * malloc(size_t);
extern void free(void *);
extern void * realloc(void *, size_t);

# 104
extern int atexit(void (*)(void));
extern char * getenv(const char *);
extern char ** environ;
extern int system(char *);
extern void qsort(void *, size_t, size_t, int (*)(const void *, const void *));
extern void * bsearch(const void *, void *, size_t, size_t, int(*)(const void *, const void *));
extern int abs(int);
extern long labs(long);

extern char * itoa(char * buf, int val, int base);
extern char * utoa(char * buf, unsigned val, int base);




extern char * ltoa(char * buf, long val, int base);
extern char * ultoa(char * buf, unsigned long val, int base);

extern char * ftoa(float f, int * status);

# 13 "/opt/microchip/xc8/v2.10/pic/include/c90/stdint.h"
typedef signed char int8_t;

# 20
typedef signed int int16_t;

# 36
typedef signed long int int32_t;

# 52
typedef unsigned char uint8_t;

# 58
typedef unsigned int uint16_t;

# 72
typedef unsigned long int uint32_t;

# 88
typedef signed char int_least8_t;

# 96
typedef signed int int_least16_t;

# 105
typedef signed long int int_least24_t;

# 118
typedef signed long int int_least32_t;

# 136
typedef unsigned char uint_least8_t;

# 143
typedef unsigned int uint_least16_t;

# 151
typedef unsigned long int uint_least24_t;

# 162
typedef unsigned long int uint_least32_t;

# 181
typedef signed char int_fast8_t;

# 188
typedef signed int int_fast16_t;

# 196
typedef signed long int int_fast24_t;

# 208
typedef signed long int int_fast32_t;

# 224
typedef unsigned char uint_fast8_t;

# 230
typedef unsigned int uint_fast16_t;

# 237
typedef unsigned long int uint_fast24_t;

# 247
typedef unsigned long int uint_fast32_t;

# 268
typedef int32_t intmax_t;

# 282
typedef uint32_t uintmax_t;

# 289
typedef int16_t intptr_t;




typedef uint16_t uintptr_t;

# 14 "/opt/microchip/xc8/v2.10/pic/include/c90/string.h"
extern void * memcpy(void *, const void *, size_t);
extern void * memmove(void *, const void *, size_t);
extern void * memset(void *, int, size_t);

# 36
extern char * strcat(char *, const char *);
extern char * strcpy(char *, const char *);
extern char * strncat(char *, const char *, size_t);
extern char * strncpy(char *, const char *, size_t);
extern char * strdup(const char *);
extern char * strtok(char *, const char *);


extern int memcmp(const void *, const void *, size_t);
extern int strcmp(const char *, const char *);
extern int stricmp(const char *, const char *);
extern int strncmp(const char *, const char *, size_t);
extern int strnicmp(const char *, const char *, size_t);
extern void * memchr(const void *, int, size_t);
extern size_t strcspn(const char *, const char *);
extern char * strpbrk(const char *, const char *);
extern size_t strspn(const char *, const char *);
extern char * strstr(const char *, const char *);
extern char * stristr(const char *, const char *);
extern char * strerror(int);
extern size_t strlen(const char *);
extern char * strchr(const char *, int);
extern char * strichr(const char *, int);
extern char * strrchr(const char *, int);
extern char * strrichr(const char *, int);

# 61 "TFT.h"
void TFT_WriteRegister(uint16_t reg, uint16_t data);
void TFT_WriteRegisters(uint16_t reg, uint8_t *data, uint8_t dataSize);
uint16_t TFT_ReadRegister(uint16_t reg);
uint16_t TFT_ReadID(void);
void TFT_Reset(void);
void TFT_SetAddrWindow(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2);
void TFT_FullScreen(void);
void TFT_Init(void);
void TFT_DrawPixel(uint16_t x, uint16_t y, uint16_t color);
void TFT_DrawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color);
void TFT_DrawFillRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color);
void TFT_Flood(uint16_t color, uint32_t len);
void TFT_FillScreen(uint16_t color);
uint16_t TFT_ColorRGBTo16Bit(uint8_t r, uint8_t g, uint8_t b);
void TFT_DrawChar(uint16_t x, uint16_t y, unsigned char c, uint16_t color, uint16_t bg, uint8_t size);
void TFT_DrawString(uint16_t x, uint16_t y, const char *str, uint16_t color, uint16_t bg, uint8_t size);
void TFT_DrawBitmap(uint8_t x, uint8_t y, const uint8_t *bitmap, uint16_t color);

const uint16_t TFT_Init_Sequence[] = {

0x0702, 0x3008,
0x0705, 0x0036,
0x070B, 0x1213,
0x0001, 0x0100,
0x0002, 0x0100,
0x0003, 0x1030,
0x0008, 0x0202,
0x0009, 0x0000,
0x000C, 0x0000,
0x000F, 0x0000,

0x0100, 0x0000,
0x0102, 0x0000,
0x0103, 0x0000,
0xFFFF, 0x0001,
0x0100, 0x1190,
0x0101, 0x0227,
0xFFFF, 0x0001,
0x0102, 0x01BD,
0xFFFF, 0x0001,
0x0103, 0x2D00,
0x0281, 0x000E,
0xFFFF, 0x0001,
0x0200, 0x0000,
0x0201, 0x0000,

0x0300, 0x0000,
0x0301, 0x0707,
0x0302, 0x0606,
0x0305, 0x0000,
0x0306, 0x0D00,
0x0307, 0x0706,
0x0308, 0x0005,
0x0309, 0x0007,
0x030C, 0x0000,
0x030D, 0x000A,

0x0210, 0x0000,
0x0211, 0x00EF,
0x0212, 0x0000,
0x0213, 0x018f,
0x0400, 0x3100,
0x0401, 0x0001,
0x0404, 0x0000,

0x0500, 0x0000,
0x0501, 0x0000,
0x0502, 0x0000,
0x0503, 0x0000,
0x0504, 0x0000,
0x0505, 0x0000,

0x0010, 0x0010,
0x0011, 0x0600,
0x0020, 0x0002,
0x0007, 0x0173
};

const uint8_t TFT_Font[] = {
0x00, 0x00, 0x00, 0x00, 0x00,
0x3E, 0x5B, 0x4F, 0x5B, 0x3E,
0x3E, 0x6B, 0x4F, 0x6B, 0x3E,
0x1C, 0x3E, 0x7C, 0x3E, 0x1C,
0x18, 0x3C, 0x7E, 0x3C, 0x18,
0x1C, 0x57, 0x7D, 0x57, 0x1C,
0x1C, 0x5E, 0x7F, 0x5E, 0x1C,
0x00, 0x18, 0x3C, 0x18, 0x00,
0xFF, 0xE7, 0xC3, 0xE7, 0xFF,
0x00, 0x18, 0x24, 0x18, 0x00,
0xFF, 0xE7, 0xDB, 0xE7, 0xFF,
0x30, 0x48, 0x3A, 0x06, 0x0E,
0x26, 0x29, 0x79, 0x29, 0x26,
0x40, 0x7F, 0x05, 0x05, 0x07,
0x40, 0x7F, 0x05, 0x25, 0x3F,
0x5A, 0x3C, 0xE7, 0x3C, 0x5A,
0x7F, 0x3E, 0x1C, 0x1C, 0x08,
0x08, 0x1C, 0x1C, 0x3E, 0x7F,
0x14, 0x22, 0x7F, 0x22, 0x14,
0x5F, 0x5F, 0x00, 0x5F, 0x5F,
0x06, 0x09, 0x7F, 0x01, 0x7F,
0x00, 0x66, 0x89, 0x95, 0x6A,
0x60, 0x60, 0x60, 0x60, 0x60,
0x94, 0xA2, 0xFF, 0xA2, 0x94,
0x08, 0x04, 0x7E, 0x04, 0x08,
0x10, 0x20, 0x7E, 0x20, 0x10,
0x08, 0x08, 0x2A, 0x1C, 0x08,
0x08, 0x1C, 0x2A, 0x08, 0x08,
0x1E, 0x10, 0x10, 0x10, 0x10,
0x0C, 0x1E, 0x0C, 0x1E, 0x0C,
0x30, 0x38, 0x3E, 0x38, 0x30,
0x06, 0x0E, 0x3E, 0x0E, 0x06,
0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x5F, 0x00, 0x00,
0x00, 0x07, 0x00, 0x07, 0x00,
0x14, 0x7F, 0x14, 0x7F, 0x14,
0x24, 0x2A, 0x7F, 0x2A, 0x12,
0x23, 0x13, 0x08, 0x64, 0x62,
0x36, 0x49, 0x56, 0x20, 0x50,
0x00, 0x08, 0x07, 0x03, 0x00,
0x00, 0x1C, 0x22, 0x41, 0x00,
0x00, 0x41, 0x22, 0x1C, 0x00,
0x2A, 0x1C, 0x7F, 0x1C, 0x2A,
0x08, 0x08, 0x3E, 0x08, 0x08,
0x00, 0x80, 0x70, 0x30, 0x00,
0x08, 0x08, 0x08, 0x08, 0x08,
0x00, 0x00, 0x60, 0x60, 0x00,
0x20, 0x10, 0x08, 0x04, 0x02,
0x3E, 0x51, 0x49, 0x45, 0x3E,
0x00, 0x42, 0x7F, 0x40, 0x00,
0x72, 0x49, 0x49, 0x49, 0x46,
0x21, 0x41, 0x49, 0x4D, 0x33,
0x18, 0x14, 0x12, 0x7F, 0x10,
0x27, 0x45, 0x45, 0x45, 0x39,
0x3C, 0x4A, 0x49, 0x49, 0x31,
0x41, 0x21, 0x11, 0x09, 0x07,
0x36, 0x49, 0x49, 0x49, 0x36,
0x46, 0x49, 0x49, 0x29, 0x1E,
0x00, 0x00, 0x14, 0x00, 0x00,
0x00, 0x40, 0x34, 0x00, 0x00,
0x00, 0x08, 0x14, 0x22, 0x41,
0x14, 0x14, 0x14, 0x14, 0x14,
0x00, 0x41, 0x22, 0x14, 0x08,
0x02, 0x01, 0x59, 0x09, 0x06,
0x3E, 0x41, 0x5D, 0x59, 0x4E,
0x7C, 0x12, 0x11, 0x12, 0x7C,
0x7F, 0x49, 0x49, 0x49, 0x36,
0x3E, 0x41, 0x41, 0x41, 0x22,
0x7F, 0x41, 0x41, 0x41, 0x3E,
0x7F, 0x49, 0x49, 0x49, 0x41,
0x7F, 0x09, 0x09, 0x09, 0x01,
0x3E, 0x41, 0x41, 0x51, 0x73,
0x7F, 0x08, 0x08, 0x08, 0x7F,
0x00, 0x41, 0x7F, 0x41, 0x00,
0x20, 0x40, 0x41, 0x3F, 0x01,
0x7F, 0x08, 0x14, 0x22, 0x41,
0x7F, 0x40, 0x40, 0x40, 0x40,
0x7F, 0x02, 0x1C, 0x02, 0x7F,
0x7F, 0x04, 0x08, 0x10, 0x7F,
0x3E, 0x41, 0x41, 0x41, 0x3E,
0x7F, 0x09, 0x09, 0x09, 0x06,
0x3E, 0x41, 0x51, 0x21, 0x5E,
0x7F, 0x09, 0x19, 0x29, 0x46,
0x26, 0x49, 0x49, 0x49, 0x32,
0x03, 0x01, 0x7F, 0x01, 0x03,
0x3F, 0x40, 0x40, 0x40, 0x3F,
0x1F, 0x20, 0x40, 0x20, 0x1F,
0x3F, 0x40, 0x38, 0x40, 0x3F,
0x63, 0x14, 0x08, 0x14, 0x63,
0x03, 0x04, 0x78, 0x04, 0x03,
0x61, 0x59, 0x49, 0x4D, 0x43,
0x00, 0x7F, 0x41, 0x41, 0x41,
0x02, 0x04, 0x08, 0x10, 0x20,
0x00, 0x41, 0x41, 0x41, 0x7F,
0x04, 0x02, 0x01, 0x02, 0x04,
0x40, 0x40, 0x40, 0x40, 0x40,
0x00, 0x03, 0x07, 0x08, 0x00,
0x20, 0x54, 0x54, 0x78, 0x40,
0x7F, 0x28, 0x44, 0x44, 0x38,
0x38, 0x44, 0x44, 0x44, 0x28,
0x38, 0x44, 0x44, 0x28, 0x7F,
0x38, 0x54, 0x54, 0x54, 0x18,
0x00, 0x08, 0x7E, 0x09, 0x02,
0x18, 0xA4, 0xA4, 0x9C, 0x78,
0x7F, 0x08, 0x04, 0x04, 0x78,
0x00, 0x44, 0x7D, 0x40, 0x00,
0x20, 0x40, 0x40, 0x3D, 0x00,
0x7F, 0x10, 0x28, 0x44, 0x00,
0x00, 0x41, 0x7F, 0x40, 0x00,
0x7C, 0x04, 0x78, 0x04, 0x78,
0x7C, 0x08, 0x04, 0x04, 0x78,
0x38, 0x44, 0x44, 0x44, 0x38,
0xFC, 0x18, 0x24, 0x24, 0x18,
0x18, 0x24, 0x24, 0x18, 0xFC,
0x7C, 0x08, 0x04, 0x04, 0x08,
0x48, 0x54, 0x54, 0x54, 0x24,
0x04, 0x04, 0x3F, 0x44, 0x24,
0x3C, 0x40, 0x40, 0x20, 0x7C,
0x1C, 0x20, 0x40, 0x20, 0x1C,
0x3C, 0x40, 0x30, 0x40, 0x3C,
0x44, 0x28, 0x10, 0x28, 0x44,
0x4C, 0x90, 0x90, 0x90, 0x7C,
0x44, 0x64, 0x54, 0x4C, 0x44,
0x00, 0x08, 0x36, 0x41, 0x00,
0x00, 0x00, 0x77, 0x00, 0x00,
0x00, 0x41, 0x36, 0x08, 0x00,
0x02, 0x01, 0x02, 0x04, 0x02,
0x3C, 0x26, 0x23, 0x26, 0x3C,
0x1E, 0xA1, 0xA1, 0x61, 0x12,
0x3A, 0x40, 0x40, 0x20, 0x7A,
0x38, 0x54, 0x54, 0x55, 0x59,
0x21, 0x55, 0x55, 0x79, 0x41,
0x22, 0x54, 0x54, 0x78, 0x42,
0x21, 0x55, 0x54, 0x78, 0x40,
0x20, 0x54, 0x55, 0x79, 0x40,
0x0C, 0x1E, 0x52, 0x72, 0x12,
0x39, 0x55, 0x55, 0x55, 0x59,
0x39, 0x54, 0x54, 0x54, 0x59,
0x39, 0x55, 0x54, 0x54, 0x58,
0x00, 0x00, 0x45, 0x7C, 0x41,
0x00, 0x02, 0x45, 0x7D, 0x42,
0x00, 0x01, 0x45, 0x7C, 0x40,
0x7D, 0x12, 0x11, 0x12, 0x7D,
0xF0, 0x28, 0x25, 0x28, 0xF0,
0x7C, 0x54, 0x55, 0x45, 0x00,
0x20, 0x54, 0x54, 0x7C, 0x54,
0x7C, 0x0A, 0x09, 0x7F, 0x49,
0x32, 0x49, 0x49, 0x49, 0x32,
0x3A, 0x44, 0x44, 0x44, 0x3A,
0x32, 0x4A, 0x48, 0x48, 0x30,
0x3A, 0x41, 0x41, 0x21, 0x7A,
0x3A, 0x42, 0x40, 0x20, 0x78,
0x00, 0x9D, 0xA0, 0xA0, 0x7D,
0x3D, 0x42, 0x42, 0x42, 0x3D,
0x3D, 0x40, 0x40, 0x40, 0x3D,
0x3C, 0x24, 0xFF, 0x24, 0x24,
0x48, 0x7E, 0x49, 0x43, 0x66,
0x2B, 0x2F, 0xFC, 0x2F, 0x2B,
0xFF, 0x09, 0x29, 0xF6, 0x20,
0xC0, 0x88, 0x7E, 0x09, 0x03,
0x20, 0x54, 0x54, 0x79, 0x41,
0x00, 0x00, 0x44, 0x7D, 0x41,
0x30, 0x48, 0x48, 0x4A, 0x32,
0x38, 0x40, 0x40, 0x22, 0x7A,
0x00, 0x7A, 0x0A, 0x0A, 0x72,
0x7D, 0x0D, 0x19, 0x31, 0x7D,
0x26, 0x29, 0x29, 0x2F, 0x28,
0x26, 0x29, 0x29, 0x29, 0x26,
0x30, 0x48, 0x4D, 0x40, 0x20,
0x38, 0x08, 0x08, 0x08, 0x08,
0x08, 0x08, 0x08, 0x08, 0x38,
0x2F, 0x10, 0xC8, 0xAC, 0xBA,
0x2F, 0x10, 0x28, 0x34, 0xFA,
0x00, 0x00, 0x7B, 0x00, 0x00,
0x08, 0x14, 0x2A, 0x14, 0x22,
0x22, 0x14, 0x2A, 0x14, 0x08,
0x55, 0x00, 0x55, 0x00, 0x55,
0xAA, 0x55, 0xAA, 0x55, 0xAA,
0xFF, 0x55, 0xFF, 0x55, 0xFF,
0x00, 0x00, 0x00, 0xFF, 0x00,
0x10, 0x10, 0x10, 0xFF, 0x00,
0x14, 0x14, 0x14, 0xFF, 0x00,
0x10, 0x10, 0xFF, 0x00, 0xFF,
0x10, 0x10, 0xF0, 0x10, 0xF0,
0x14, 0x14, 0x14, 0xFC, 0x00,
0x14, 0x14, 0xF7, 0x00, 0xFF,
0x00, 0x00, 0xFF, 0x00, 0xFF,
0x14, 0x14, 0xF4, 0x04, 0xFC,
0x14, 0x14, 0x17, 0x10, 0x1F,
0x10, 0x10, 0x1F, 0x10, 0x1F,
0x14, 0x14, 0x14, 0x1F, 0x00,
0x10, 0x10, 0x10, 0xF0, 0x00,
0x00, 0x00, 0x00, 0x1F, 0x10,
0x10, 0x10, 0x10, 0x1F, 0x10,
0x10, 0x10, 0x10, 0xF0, 0x10,
0x00, 0x00, 0x00, 0xFF, 0x10,
0x10, 0x10, 0x10, 0x10, 0x10,
0x10, 0x10, 0x10, 0xFF, 0x10,
0x00, 0x00, 0x00, 0xFF, 0x14,
0x00, 0x00, 0xFF, 0x00, 0xFF,
0x00, 0x00, 0x1F, 0x10, 0x17,
0x00, 0x00, 0xFC, 0x04, 0xF4,
0x14, 0x14, 0x17, 0x10, 0x17,
0x14, 0x14, 0xF4, 0x04, 0xF4,
0x00, 0x00, 0xFF, 0x00, 0xF7,
0x14, 0x14, 0x14, 0x14, 0x14,
0x14, 0x14, 0xF7, 0x00, 0xF7,
0x14, 0x14, 0x14, 0x17, 0x14,
0x10, 0x10, 0x1F, 0x10, 0x1F,
0x14, 0x14, 0x14, 0xF4, 0x14,
0x10, 0x10, 0xF0, 0x10, 0xF0,
0x00, 0x00, 0x1F, 0x10, 0x1F,
0x00, 0x00, 0x00, 0x1F, 0x14,
0x00, 0x00, 0x00, 0xFC, 0x14,
0x00, 0x00, 0xF0, 0x10, 0xF0,
0x10, 0x10, 0xFF, 0x10, 0xFF,
0x14, 0x14, 0x14, 0xFF, 0x14,
0x10, 0x10, 0x10, 0x1F, 0x00,
0x00, 0x00, 0x00, 0xF0, 0x10,
0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
0xF0, 0xF0, 0xF0, 0xF0, 0xF0,
0xFF, 0xFF, 0xFF, 0x00, 0x00,
0x00, 0x00, 0x00, 0xFF, 0xFF,
0x0F, 0x0F, 0x0F, 0x0F, 0x0F,
0x38, 0x44, 0x44, 0x38, 0x44,
0xFC, 0x4A, 0x4A, 0x4A, 0x34,
0x7E, 0x02, 0x02, 0x06, 0x06,
0x02, 0x7E, 0x02, 0x7E, 0x02,
0x63, 0x55, 0x49, 0x41, 0x63,
0x38, 0x44, 0x44, 0x3C, 0x04,
0x40, 0x7E, 0x20, 0x1E, 0x20,
0x06, 0x02, 0x7E, 0x02, 0x02,
0x99, 0xA5, 0xE7, 0xA5, 0x99,
0x1C, 0x2A, 0x49, 0x2A, 0x1C,
0x4C, 0x72, 0x01, 0x72, 0x4C,
0x30, 0x4A, 0x4D, 0x4D, 0x30,
0x30, 0x48, 0x78, 0x48, 0x30,
0xBC, 0x62, 0x5A, 0x46, 0x3D,
0x3E, 0x49, 0x49, 0x49, 0x00,
0x7E, 0x01, 0x01, 0x01, 0x7E,
0x2A, 0x2A, 0x2A, 0x2A, 0x2A,
0x44, 0x44, 0x5F, 0x44, 0x44,
0x40, 0x51, 0x4A, 0x44, 0x40,
0x40, 0x44, 0x4A, 0x51, 0x40,
0x00, 0x00, 0xFF, 0x01, 0x03,
0xE0, 0x80, 0xFF, 0x00, 0x00,
0x08, 0x08, 0x6B, 0x6B, 0x08,
0x36, 0x12, 0x36, 0x24, 0x36,
0x06, 0x0F, 0x09, 0x0F, 0x06,
0x00, 0x00, 0x18, 0x18, 0x00,
0x00, 0x00, 0x10, 0x10, 0x00,
0x30, 0x40, 0xFF, 0x01, 0x01,
0x00, 0x1F, 0x01, 0x01, 0x1E,
0x00, 0x19, 0x1D, 0x17, 0x12,
0x00, 0x3C, 0x3C, 0x3C, 0x3C,
0x00, 0x00, 0x00, 0x00, 0x00
};

# 16 "A6Lib.h"
const uint32_t A6_BAUDRATES[] = { 9600, 57600, 115200 };

void A6_Init(void);
uint8_t A6_IsAlive(void);
uint32_t A6_BaudRateAutoDetect(void);
uint32_t A6_BaudRateGet(void);
uint32_t A6_BaudRateSet(const uint32_t baudRate);
void A6_Command(const char *command, int16_t timeout, char *response, uint8_t responseLen);
uint8_t A6_ReadLine(char *response, uint8_t responseLen, int16_t timeout);
void A6_Process_Random_Comms(void);

# 18 "EUSART.h"
struct {
uint8_t iRead;
uint8_t iWrite;
char buffer[128];
} EUSART_RX;

void EUSART_Init(void);
void EUSART_BaudRateSet(const uint32_t baudRate);
void EUSART_TX_Char(uint8_t c);
void EUSART_TX_String(const char *str, uint8_t len);
void EUSART_RX_Interrupt(void);
uint8_t EUSART_RX_AvailableData(int16_t timeout);
void EUSART_RX_Flush(void);
char EUSART_BufferGetChar(int16_t timeout);

# 27 "commons.h"
extern uint32_t MILLISECONDS;


extern void init(void);
extern void sleepMS(uint32_t ms);
extern void printLine(const char *str, uint16_t color);

extern void Ecg_Init(void);
extern void Ecg_Process(void);
extern void Ecg_Interrupt(void);

# 30 "ecg.h"
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
uint32_t data[3];
uint8_t i;
} ECG_HEARTBEAT;

struct {
uint8_t data[4];
uint8_t i;
} ECG_BUFFER;


uint16_t Ecg_X = 240 - 1;
uint16_t Ecg_Xold = 240 - 1;
uint16_t Ecg_Y = 400 - 1;
uint16_t Ecg_Yold = 400 - 1;


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


const uint8_t ECG_ICON_HEART[] = {
20, 20,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0xf0, 0x01, 0xfc, 0xf9, 0x03,
0xfc, 0xff, 0x03, 0xfe, 0xff, 0x07, 0xfe, 0xff, 0x07, 0xfe, 0xff, 0x07,
0xfe, 0xff, 0x07, 0xfc, 0xff, 0x03, 0xfc, 0xff, 0x03, 0xf8, 0xff, 0x01,
0xf0, 0xff, 0x00, 0xe0, 0x7f, 0x00, 0xc0, 0x3f, 0x00, 0x80, 0x1f, 0x00,
0x00, 0x0f, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

# 12 "ecg.c"
void Ecg_Init(void) {
if(Ecg_CheckLeads() == 0) {
Ecg_Background_Leads_Ok();
} else {
Ecg_Background_Leads_Failure();
}
ECG_HEARTBEAT.i = 0;
ECG_BUFFER.i = 0;
ECG_HEARTRATE.processHeartbeat = 1;
}

void Ecg_Process(void) {
if(ECG_FLAGS.processInterrupt) {
Ecg_ProcessInterrupt();
ECG_FLAGS.processInterrupt = 0;
}

if(ECG_FLAGS.processEcg) {
Ecg_ProcessEcg();
ECG_FLAGS.processEcg = 0;
}

if(ECG_FLAGS.processHeartRate && ECG_FLAGS.leadsOk) {
Ecg_ProcessHeartRate();
ECG_FLAGS.processHeartRate = 0;
}
}

void Ecg_ProcessInterrupt(void) {
if(ECG_FLAGS.msecDelay >= (10 / 5)) {
ECG_FLAGS.processEcg = 1;
ECG_FLAGS.msecDelay = 0;
}
if(ECG_HEARTRATE.msecDelay >= (1200 / 5)) {
ECG_FLAGS.processHeartRate = 1;
ECG_HEARTRATE.msecDelay = 0;
}
}

void Ecg_ProcessEcg(void) {
Ecg_CheckLeads();

if(ECG_FLAGS.leadsOk) {

if(ECG_FLAGS.leadsOkFlag == 0) {
Ecg_Background_Leads_Ok();
ECG_FLAGS.leadsOkFlag = 1;
}


Ecg_Draw();


Ecg_ProcessHeartbeat();
} else {

if(ECG_FLAGS.leadsOkFlag == 1) {
Ecg_Background_Leads_Failure();
ECG_FLAGS.leadsOkFlag = 0;
}
}
}

void Ecg_ProcessHeartRate(void) {
uint8_t heartrate = 0;
char heartrateString[5];
uint32_t heartbeatAverage = 0;

for(uint8_t i=0, j=ECG_HEARTBEAT.i, jPrev=0; i<(3 - 1); i++) {
j = (j == 0) ? (3 - 1) : (j - 1);
jPrev = (j == 0) ? (3 - 1) : (j - 1);
heartbeatAverage += (ECG_HEARTBEAT.data[j] - ECG_HEARTBEAT.data[jPrev]);
}
heartbeatAverage /= (3 - 1);
heartrate = (uint8_t)(60000 / heartbeatAverage);
sprintf(heartrateString, "%3d", heartrate);
TFT_DrawString(8, (400 - 140), heartrateString, 0x07E0, 0x0000, 2);
}

void Ecg_ProcessHeartbeat(void) {
if(ECG_HEARTRATE.processHeartbeat == 1) {

int16_t ecgDeltaSum=0, ecgDeltaAbsSum=0, ecgDeltaDiff=0;
for(uint8_t i=1; i<4; i++) {
int16_t delta = ECG_BUFFER.data[i] - ECG_BUFFER.data[i - 1];
ecgDeltaSum += delta;
ecgDeltaAbsSum += abs(delta);
}
ecgDeltaDiff = ecgDeltaAbsSum - ecgDeltaSum;


if(ecgDeltaDiff > 60) {

ECG_HEARTBEAT.data[ECG_HEARTBEAT.i++] = MILLISECONDS;
if(ECG_HEARTBEAT.i == 3) ECG_HEARTBEAT.i = 0;


TFT_DrawBitmap(5, 25, ECG_ICON_HEART, 0xF800);
ECG_HEARTRATE.heartIconMsecDelay = 100 / 5;
ECG_HEARTRATE.heartIconShown = 1;


ECG_HEARTRATE.heartbeatMsecDelay = 250 / 5;
ECG_HEARTRATE.processHeartbeat = 0;
}
} else {

if(ECG_HEARTRATE.heartIconShown == 1) {
ECG_HEARTRATE.heartIconMsecDelay--;
if(ECG_HEARTRATE.heartIconMsecDelay == 0) {
TFT_DrawFillRect(5, 5, 20, 20, 0x0000);
ECG_HEARTRATE.heartIconShown = 0;
}
}


ECG_HEARTRATE.heartbeatMsecDelay--;
if(ECG_HEARTRATE.heartbeatMsecDelay == 0) {
ECG_HEARTRATE.processHeartbeat = 1;
}
}
}

void Ecg_Interrupt(void) {
ECG_FLAGS.msecDelay++;
ECG_HEARTRATE.msecDelay++;
ECG_FLAGS.processInterrupt = 1;
}

uint16_t Ecg_CheckLeads(void) {
uint8_t leadsStatus = 0;
if(PORTCbits.RC5 == 1) leadsStatus |= 0b00000010;
if(PORTCbits.RC4 == 1) leadsStatus |= 0b00000001;
ECG_FLAGS.leadsOk = (leadsStatus == 0) ? 1 : 0;
return leadsStatus;
}

uint16_t Ecg_Read(void) {
uint16_t ecg;
ADCON0bits.CHS = 0b0000;
ADCON0bits.ADON = 1;
GO_nDONE = 1;
while(GO_nDONE == 1);
ecg = ADRESH;
ecg = ecg << 8;
ecg &= 0xFF00;
ecg |= ADRESL;
ADCON0bits.ADON = 0;
ECG_BUFFER.data[ECG_BUFFER.i++] = (uint8_t)(ecg >> 2);
if(ECG_BUFFER.i == 4) ECG_BUFFER.i = 0;
return ecg;
}

void Ecg_Draw(void) {
uint16_t ecg = Ecg_Read();
ecg /= 5;
Ecg_X = 240 - ecg - 1;
TFT_DrawFillRect(33, (Ecg_Y - 20 + 1), (240 - 33), 20, 0x0000);
TFT_DrawLine(Ecg_Xold, Ecg_Yold, Ecg_X, Ecg_Y, 0x07E0);
Ecg_Xold = Ecg_X;
Ecg_Yold = Ecg_Y;
Ecg_Y--;
if(Ecg_Y == 0) {
Ecg_Y = 400 - 1;
Ecg_Yold = Ecg_Y;
}
}

void Ecg_Background_Leads_Ok(void) {
TFT_FillScreen(0x0000);
TFT_DrawString(8, (400 - 10), "Frequenza:", 0xFFFF, 0x0000, 2);
TFT_DrawLine((33 - 1), 0, (33 - 1), 400, 0xFFFF);
Ecg_Y = 400 - 1;
Ecg_Yold = 400 - 1;
}

void Ecg_Background_Leads_Failure(void) {
TFT_FillScreen(0x0000);
TFT_DrawString(70, 362, "*** Collegare elettrodi ***", 0xFFFF, 0x0000, 2);
}
