processor 16f877		; Importa las librerias
include <p16f877.inc>	; necesarias para compilar en el PIC.

ORG 0
GOTO INICIO
ORG 5

INICIO:					; Seccion de inicio
	BSF STATUS,RP0
	BCF STATUS,RP1		; Cambio al banco 1
	MOVLW H'0'			; W <- H'0'
	MOVWF TRISB			; Configura puertos B como salidas
	MOVLW H'07'			; W <- 7
	MOVWF ADCON1		; Configura puerto A como digital
	MOVLW H'1F'			; W <- 1F
	MOVWF TRISA			; Configura puerto A como entradas
	BCF STATUS,RP0		; Cambio al banco 0
	CLRF PORTB			; Limpia PORTB donde se aplican las salidas

SELECTOR:
	BTFSS PORTA, 0		; TESTEA Y SALTA SI LA ENTRADA EN A0 ES 1
	GOTO CERO
	GOTO UNO

CERO:
	MOVLW H'0'			; W <- 0
	MOVWF PORTB			; PORTB <- W
	GOTO SELECTOR

UNO:
	MOVLW H'FF'			; W <- FF
	MOVWF PORTB			; PORTB <- W
	GOTO SELECTOR

END