#start=robot.exe#


org 100h
; Ejemplo de como ocupar la instruccion IN para leer datos de IO (en este caso
; datos del robot)
;Mas detalles del funcionamiento del robot en http://www.emu8086.com/virtual_devices.html
start:  
            MOV AL, 4       ; examine.
            OUT 9, AL       ; 
                    
            MOV AL, 0       ; reset command.
            OUT 9, AL       ;
        
            
            IN AL, 10       ; read data
            MOV [data], AL
                    
            JMP start
        
            RET

data    db 0

