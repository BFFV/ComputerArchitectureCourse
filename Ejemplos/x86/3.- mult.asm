;Calculo de la multiplicacion res = a*b

org 100h

MOV AX, 0           
MOV CX, 0           
MOV DX, 0           


;MOV CL, [a]         ;CL guarda el valor de a 
;MOV DL, [b]         ;DL guarda el valor de b 
;

;start:              
;CMP CL, 0           ;IF a <= 0 GOTO end
;JLE endprog
;
;ADD AX, DX          ;AX += b
;                    
;
;DEC CL              ;a--
;JMP start
;
;endprog:

MOV AL, [a]
MUL [b]
 
MOV [res], AX       ;res = AX


RET

a        db 10
b        db 200
res      dw 0   




