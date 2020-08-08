;Calculo de la potencia pow = base*exp

org 100h

MOV BL, [exp]
MOV CL, [base]

PUSH BX             ;Paso de parmetros (de derecha a izquierda)
PUSH CX

CALL potencia		;potencia(base,exp)

MOV [pow], AL       ;Retorno viene en AX

RET

potencia:			;Subrutina para el calculo de la potencia

PUSH BP
MOV BP, SP			;Actualizamos BP con valor del SP

MOV CL, [BP + 4]	;Recuperamos los dos parámetros
MOV BL, [BP + 6]

MOV AX, 1			;AX = 1

start:
CMP BL,0			;if exp <= 0 goto endpotencia
JLE endpotencia 

MUL CL				;AX = AL * base

DEC BL				;exp--
JMP start

endpotencia:

POP BP
RET 4				;Retornar, desplazando el SP en 4 bytes (2 por cada parametro)

base     db 2  
exp      db 7
pow      db 0 