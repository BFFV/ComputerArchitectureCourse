;Este ejemplo dibuja lineas de colores en pantalla ocupando
;el display del emulador, mediante llamadas a interrupciones de software
;Mas detalles en http://www.emu8086.com/interrupts.html
org 100h

    MOV AL, 13h    	
    MOV AH, 0
    INT 10h         ; Setear pantalla en Modo Video 
    
    MOV BX, colores
    MOV CX, 10      ; Setear columna del pixel a pintar
for1:
    MOV AL, [BX]    ; Setear color del pixel a pintar
    MOV DX, 20      ; Setear fila del pixel a pintar

    for2:
        MOV AH, 0Ch
        INT 10h         ; Set pixel(cx,dx)=al
        
        INC DX
        CMP DX, 100
        JNE for2
    
    INC BX
    ADD CX,5
    CMP CX, 40
    JNE for1  
    
     
    RET


colores:    db 1110b
            db 1111b
            db 1110b
            db 1111b
            db 1110b
            db 1111b
            
