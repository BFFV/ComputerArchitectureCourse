;Calculo de la serie de fibonacci

org 100h

MOV BL, [n]

PUSH BX             ;Paso de parmetros (de derecha a izquierda)

CALL fibonnaci

MOV [fib], AL       ;Retorno

RET

fibonnaci:

PUSH BP
MOV BP, SP

MOV BL, [BP + 4]    ;Recuperamos parametro

CMP BL, 0           ;if n== 0 goto set1
JE  set1

CMP BL, 1           ;if n== 1 goto set1
JE  set1

MOV CL, BL          ;Parametro para llamada fib(n-1)
DEC CL
PUSH CX

CALL fibonnaci		;Primera llamada recursiva

MOV BL, [BP + 4]    ;Recuperamos valor n original

MOV CL, BL          ;Parametro para llamada fib(n-2)
SUB CL, 2
PUSH CX

CALL fibonnaci		;Segunda llamada recursiva

JMP endfib  		

set1:               ; Caso base de recursion
ADD AL, 1			; Acumulamos 1 en AL por cada vez que llegamos a el caso base

endfib:

POP BP
RET 2				; Retorno desplazando en 2 bytes (1 parametro)

n        db 3   
fib      db 0