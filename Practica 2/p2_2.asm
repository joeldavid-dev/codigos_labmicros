PROCESSOR 16f877
INCLUDE <p16f877.inc> 
	
	MENOR EQU H'40'

	ORG 0
	GOTO INICIO 
	ORG 5

INICIO:
	BCF STATUS,RP1		; RP1 = 0
	BSF STATUS,RP0		; RP0 = 1, MUEVE AL BANCO 1
	MOVLW 0X20			; W <-- 0X20
	MOVWF FSR			; MUEVE CONTENIDO DE W A FSR. FSR = 0X20
	MOVFW INDF			; W <-- VALOR EN EL REGISTRO 0X20
	BCF STATUS,RP0		; RP0 = 0, MUEVE AL BANCO 0
	MOVWF MENOR			; MENOR <-- W

LOOP:
	INCF FSR			; INCREMENTO FSR
	MOVFW MENOR			; W <-- MENOR
	SUBWF INDF,W		; W = W - VALOR EN EL REGISTRO ACTUAL
	BTFSS STATUS,C		; SI CARRY = 1, SALTA (COMPARA PARA SABER SI ES MENOR)
	MOVFW INDF			; W <-- VALOR EN EL REGISTRO ACTUAL
	BTFSS STATUS,C		; SI CARRY = 1, SALTA (COMPARA PARA SABER SI ES MENOR)
	MOVWF MENOR			; MENOR <-- W
	BTFSS FSR,6			; SI EL BIT 6 DE FSR ES 1, SALTA
	GOTO LOOP			; SI NO, REGRESA A LOOP
	GOTO $

END