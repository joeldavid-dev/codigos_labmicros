processor 16f877
include <p16f877.inc>

valor1 equ h'21'
valor2 equ h'22'
valor3 equ h'23'
cte1 equ 1h
cte2 equ 20h
cte3 equ 19h

VAR1 equ h'25'
VAR2 equ h'26'

ORG 0
GOTO INICIO
ORG 5

INICIO:
	CLRF PORTA		; PORTA = 0
	BSF STATUS,RP0
	BCF STATUS,RP1	; Mueve a banco 1
	MOVLW H'0'		; w <- 0
	MOVWF TRISC		; TRISC = 0, configura como salida
 	CLRF PORTC		; Limpia los puertos

	MOVLW 06H		; w = 6H
	MOVWF ADCON1	; ADCON1 = 6H, para configurar puerto A como digital
	MOVLW 0FH		; w = "0000 1111"
	MOVWF TRISA		; TRISA = "0000 1111", configura puerto a como entrada, solo primeros 4 bits
	BCF STATUS, RP0	; Regresa al banco 0
	CLRF VAR1		;
	CLRF VAR2		; Limpia las variables


LOOP:
	MOVF PORTA, W	; W <- Entradas en A
	SUBLW 0X04		; W -> PORTA - B'100'
 	BTFSC STATUS,Z	; SALTA SI Z ES 0
	GOTO ACCION1
	
	MOVF PORTA, W	; W <- Entradas en A
	SUBLW 0X02		; W -> PORTA - B'010'
 	BTFSC STATUS,Z	; SALTA SI Z ES 0
	GOTO ACCION2

	MOVF PORTA, W	; W <- Entradas en A
	SUBLW 0X01		; W -> PORTA - B'001'
 	BTFSC STATUS,Z	; SALTA SI Z ES 0
	GOTO ACCION3

	GOTO LOOP

ACCION1:			; POSICION IZQUIERDA, 1MS ARRIBA
	MOVLW b'00000001'
	MOVWF PORTC
	call retardo
	call retardo
	
	MOVLW b'00000000'
	MOVWF PORTC
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	GOTO LOOP

ACCION2:			; POSICION CENTRAL,1.5 MS ARRIBA
	MOVLW b'00000001'
	MOVWF PORTC
	call retardo
	call retardo
	call retardo	
	
	MOVLW b'00000000'
	MOVWF PORTC
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	GOTO LOOP

ACCION3:			; POSICION DERECHA, 2MS ARRIBA
	MOVLW b'00000001'
	MOVWF PORTC
	call retardo
	call retardo
	call retardo
	call retardo	
	
	MOVLW b'00000000'
	MOVWF PORTC
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	GOTO LOOP

retardo:
	MOVLW cte1
 	MOVWF valor1
tres:
	MOVLW cte2
	MOVWF valor2
dos:
	MOVLW cte3
	MOVWF valor3
uno:
	DECFSZ valor3
	GOTO uno
	DECFSZ valor2
	GOTO dos
	DECFSZ valor1
	GOTO tres
	RETURN

END