processor 16f877		; Importa las librerias
include <p16f877.inc>	; necesarias para compilar en el PIC.

valor1 equ h'21'		; Variables necesarias para la subrutina de retardo
valor2 equ h'22'
valor3 equ h'23'
;cte1 equ 20h
;cte1 equ 8h
cte1 equ 80h
cte2 equ 50h
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
	BSF PORTB,0			; Salida 1 en el puerto B0
	CALL retardo		; Llama a retardo
	BCF PORTB,0			; Salida 0 en el puerto B0
	CALL retardo		; Llama a retardo
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