processor 16f877		; Importa las librerias
include <p16f877.inc>	; necesarias para compilar en el PIC.

valor1 equ h'21'
valor2 equ h'22'
valor3 equ h'23'
cte1 equ 90h			; Aproximadamente 1 segundo
cte2 equ 60h
cte3 equ 60h

ORG 0
GOTO INICIO
ORG 5

INICIO:
	CLRF PORTA
	BSF STATUS,RP0
	BCF STATUS,RP1		; Cambio al banco 1
	CLRF TRISB			; Configura puertos B como salidas
	MOVLW H'06'
	MOVWF ADCON1		; Configura puerto A como digital
	MOVLW H'07'
	MOVWF TRISA			; Configura puerto A como entradas
	BCF STATUS,RP0		; Cambio al banco 0
	CLRF PORTB			; Limpia PORTB donde se aplican las salidas

SELECTOR
	MOVFW PORTA			; W <- Entradas en A
 	ADDWF PCL,1			; Suma la entrada en A a pcl para dar el salto
	GOTO ACCION0
	GOTO ACCION1
	GOTO ACCION2
	GOTO ACCION3
	GOTO ACCION4
	GOTO ACCION5

ACCION0
	MOVLW H'00'			; W <- 0
	MOVWF PORTB			; PORTB <- W
	GOTO SELECTOR

ACCION1
	MOVLW H'FF'			; W <- FF
	MOVWF PORTB			; PORTB <- W
	GOTO SELECTOR

ACCION2
	MOVLW H'01'
	MOVWF PORTB
	CALL RETARDO
ACCION2_1
	RLF PORTB
	CALL RETARDO
	BTFSS PORTB,7
	GOTO ACCION2_1
	GOTO SELECTOR

ACCION3
	MOVLW H'80'
	MOVWF PORTB
	CALL RETARDO
ACCION3_1
	RRF PORTB
	CALL RETARDO
	BTFSS PORTB,0
	GOTO ACCION3_1
	GOTO SELECTOR

ACCION4
	MOVLW H'80'
	MOVWF PORTB
	CALL RETARDO
ACCION4_1
	RRF PORTB
	CALL RETARDO
	BTFSS PORTB,0
	GOTO ACCION4_1
ACCION4_2
	MOVLW H'01'
	MOVWF PORTB
	CALL RETARDO
ACCION4_3
	RLF PORTB
	CALL RETARDO
	BTFSS PORTB,7
	GOTO ACCION4_3
	GOTO SELECTOR

ACCION5
	CLRF PORTB			; PORTB <- W
	CALL RETARDO
	MOVLW H'FF'			; W <- FF
	MOVWF PORTB			; PORTB <- W
	CALL RETARDO
	GOTO SELECTOR

RETARDO					; Subrutina de retardo. Mantiene ocupado al PIC
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