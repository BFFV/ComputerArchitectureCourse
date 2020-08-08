;Calculo del factorial recursivo

org 100h

MOV BL, [n]

PUSH BX             ;Paso de parmetros (de derecha a izquierda)

CALL factorial

MOV [fact], AL       ;Retorno

RET

factorial:

PUSH BP
MOV BP, SP

MOV BL, [BP + 4]    ;Recuperamos parametro

CMP BL, 0           ;if n== 0 goto set1
JE  set1

MOV CL, BL          ;Parametro para llamada fact(n-1)
DEC CL
PUSH CX

CALL factorial		;Paso recursivo
			
MOV BL, [BP + 4]    ;Recuperamos el parametro n original
MUL BL				;AX = AL*n
	
JMP endfact

set1:               ;Caso base de recursion
MOV AX,1

endfact:

POP BP
RET 2				; Retorno desplazando 2 bytes (1 parametro)

n        db 2   
fact     db 0



