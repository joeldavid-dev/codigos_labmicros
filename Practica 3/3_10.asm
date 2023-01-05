processor 16f877		; Importa las librerias
include <p16f877.inc>	; necesarias para compilar en el PIC.

valor1 equ h'21'		; Variables necesarias para la subrutina de retardo
valor2 equ h'22'
valor3 equ h'23'
;cte1 equ 20h
;cte1 equ 8h
cte1 equ h'FF'			; Aproximadamente 2 segundo
cte2 equ 60h
cte3 equ 60h

ORG 0
GOTO INICIO
ORG 5

INICIO:					; Seccion de inicio
	BSF STATUS,RP0
	BCF STATUS,RP1		; Cambio al banco 1
	MOVLW H'0'			; W <- h'0'
	MOVWF TRISB			; Configura puertos B como salidas
	BCF STATUS,RP0		; Cambio al banco 0
	CLRF PORTB			; Limpia PORTB donde se aplican las salidas

loop2
	MOVLW b'01000001'	; W <- estado 1
	MOVWF PORTB			; PORTB <- W
	CALL retardo		; Tiempo que permanece encendido
	MOVLW b'00100001'	; W <- estado 2
	MOVWF PORTB			; PORTB <- W
	CALL retardo		; Tiempo que permanece encendido
	MOVLW b'00010100'	; W <- estado 3
	MOVWF PORTB			; PORTB <- W
	CALL retardo		; Tiempo que permanece encendido
	MOVLW b'00010010'	; W <- estado 4
	MOVWF PORTB			; PORTB <- W
	CALL retardo		; Tiempo que permanece encendido
	GOTO loop2			; Reinicia
 
retardo					; Subrutina de retardo. Mantiene ocupado al PIC
	MOVLW cte1			; durante cierta cantidad de tiempo. Despues regresa a
	MOVWF valor1		; la linea de codigo donde se invoco.
tres
	MOVLW cte2
	MOVWF valor2
dos
	MOVLW cte3
	MOVWF valor3
uno
	DECFSZ valor3
	GOTO uno
	DECFSZ valor2
	GOTO dos
	DECFSZ valor1
	GOTO tres
	RETURN
END