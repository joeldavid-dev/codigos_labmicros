processor 16f877
include <p16f877.inc>

R1 EQU 0x20

	ORG 0 
	GOTO INICIO
	ORG 5 				;INICIO PROGRAMA
 	
INICIO:
	CLRW 				;LIMPIAR W
	CLRF R1				;LIMIPIAR R1
	CLRF STATUS			;LIMPIAR BANDERAS
	GOTO UNO_NUEVE
	
UNO_NUEVE:
	MOVF R1, W			;MUEVE EL VALOR DE R1 A W
	ADDLW 0X01			;W = W+1
	MOVWF R1 			;R1=w
	SUBLW 0X09			;W = W-0X09, PARA SABER SI YA LLEG� A 9
	BTFSS STATUS,Z 		;SI Z = 1 LLEGO A 9 Y SALTA UNA LINEA
	GOTO UNO_NUEVE
	GOTO DIEZ
	
DIEZ:
	MOVLW 0x10			;W=0X10
	MOVWF R1 			;R1=w
	GOTO ONCE_DIECINUEVE

ONCE_DIECINUEVE:
	MOVF R1, W			;MUEVE EL VALOR DE R1 A W
	ADDLW 0X01			;W = W+1
	MOVWF R1 			;R1=w
	SUBLW 0X19			;W = W-0X19, PARA SABER SI YA LLEG� A 19
	BTFSS STATUS,Z 		;SI Z = 1 LLEGO A 19 Y SALTA UNA LINEA
	GOTO ONCE_DIECINUEVE
	GOTO VEINTE

VEINTE:
	MOVLW 0x20			;W=0X20
	MOVWF R1 			;R1=w
	GOTO INICIO

	END