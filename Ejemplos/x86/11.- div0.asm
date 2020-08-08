;Este ejemplo implementa una subrutina de interrupcion (ISR) para manejar'
;la excepcion de division por cero

org 100h

MOV AX, 0       
MOV ES, AX
MOV AL, 0 ; En la direccion 0x0 de la tabla de vectores de interrupcion   
MOV BL, 4h       
MUL BL          
MOV BX, AX
MOV SI, offset [divporcero] ;referenciamos el handler de excepciones
MOV ES:[BX], SI
ADD BX, 2   
MOV AX, cs     
MOV ES:[BX], AX
        

MOV BX, 0

DIV BX


RET



divporcero:

MOV AX, 0xFFFF

IRET
