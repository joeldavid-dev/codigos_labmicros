processor 16f877
include <p16f877.inc>


ORG 0
GOTO INICIO
ORG 5

INICIO:
	CLRF PORTA
	BSF STATUS,RP0
	BCF STATUS,RP1
	MOVLW H'0'
	MOVWF TRISB
 	CLRF PORTB


	MOVLW 06H
	MOVWF ADCON1
	MOVLW 3FH
	MOVWF TRISA
	BCF STATUS, RP0


loop2:
	MOVF PORTA, W
	ANDLW 0X0F  ; W-> PORTA & 00000111
 	ADDWF PCL, F
	GOTO ACCION1
	GOTO ACCION2
	GOTO ACCION3
	GOTO ACCION4
	GOTO ACCION5
	GOTO ACCION6
	GOTO ACCION7
	GOTO ACCION8
	GOTO ACCION9


ACCION1:
	MOVLW 0X00   ; PARO-PARO
	MOVWF PORTB
	GOTO loop2

ACCION2:		; PARO-HORARIO M2

	MOVLW B'00001000'
	MOVWF PORTB
	GOTO loop2

ACCION3:        ; PARO-ANTIHORARIO M2

	MOVLW B'00000100'
	MOVWF PORTB
	GOTO loop2

ACCION4: 		;HORARIO - PARO M2

	MOVLW B'00000001'
	MOVWF PORTB
	GOTO loop2


ACCION5: 		;ANTIHORARIO - PARO M2

	MOVLW B'00000010'
	MOVWF PORTB
	GOTO loop2

ACCION6: 		;HORARIO - HORARIO M2 ETIQUETA

	MOVLW B'00001001'
	MOVWF PORTB
	GOTO loop2

ACCION7: 		;ANTIHORARIO - ANTIHORARIO M2 ETIQUETA

	MOVLW  B'00000110'
	MOVWF PORTB
	GOTO loop2

ACCION8: 		;HORARIO - ANTIHORARIO M2 ETIQUETA

	MOVLW B'00000101'
	MOVWF PORTB
	GOTO loop2

ACCION9: 		;ANTIHORARIO - HORARIO M2 ETIQUETA

	MOVLW B'00001010'
	MOVWF PORTB
	GOTO loop2
END