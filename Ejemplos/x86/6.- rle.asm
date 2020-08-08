;Algoritmo inverso a RLE: descomprime un arreglo comprimido en RLE (Run Length Encoding)

org 100h

MOV CL, [n]         ;CL tendra el valor del tamano completo del arreglo 
MOV SI, 0           ;SI se usara para iterar sobre el arreglo comprimido
MOV DI, 0           ;DI se usara para iterar sobre el arreglo descomprimido

start:              ;Loop principal: recorrer el arreglo comprimido completo
CMP SI, CX
JGE endprog
                    
LEA BX, comp        ;En BX se almacena posicion inicial del arreglo comprimido

MOV AL, [BX + SI]   ;Se almacena en AL el primer valor que indica las repticiones
INC SI
MOV DL, [BX + SI]   ;Se almacena en DL el segundo valor que indica el valor a repetir

MOV DH, 0           ;DH se usara como contador para revisar el fin del loop

innerloop:          ;Loop interno: va copiando el valor a repetir en el resultado
LEA BX, descomp     ;BX ahora almacena la posicion inicial del arreglo descomprimido
CMP DH, AL
JGE endloop

MOV [BX + DI], DL   ;Se copia el valor a repetir en el arreglo descomprimido

INC DI              ;Se incrementa el indice del arreglo
INC DH              ;Se incrementa el contador del loop interno
JMP innerloop

endloop:

INC SI              ;Se incrementa el contador del loop principal
JMP start

endprog:

RET

n        db 4       

comp     db 6,4,2,3

descomp  db ?,?,?,?,?,?,?,?            

