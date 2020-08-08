;Calculo del promedio de un arreglo

org 100h

MOV CX, 0
MOV CL, [n]         ;CL tendra el valor del tamano completo del arreglo 
MOV SI, 0           ;SI se usara para iterar sobre el arreglo 

MOV AX, 0           ;AL se usara para guardar el promedio
MOV DX, 0           ;DL se usara para guardar los valores del arreglo

start:              ;Loop principal: recorrer el arreglo completo
CMP SI, CX
JGE endprog
                    
LEA BX, arreglo     ;En BX se almacena posicion inicial del arreglo comprimido

MOV DL, [BX + SI]   ;Se almacena en AL el primer valor que indica las repticiones

ADD AL, DL          ;Se acumula el valor del arreglo

INC SI              ;Se incrementa el contador del loop principal
JMP start

endprog:

DIV [n]
MOV [promedio], AL

RET

n        db 5
arreglo  db 6,4,2,3,5
promedio db 0   


