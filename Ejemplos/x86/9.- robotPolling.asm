;Este ejemplo utiliza el robot del emulador para mostrar
;el mecanismo de polling
;Mas detalles del funcionamiento del robot en http://www.emu8086.com/virtual_devices.html
#start=robot.exe#


org 100h


start: 
        CALL waitcommand
         
        MOV AL, 1  ; move forward.
        OUT 9, AL  ;
        
        CALL waitcommand

        MOV AL, 4  ; examine.
        OUT 9, AL  ;
        
        CALL waitdata

        IN AL, 10
        CMP AL, 0
        JE start
        
        CALL waitcommand
        
        MOV AL, 3  ; turn right.
        OUT 9, AL  ;
        
        JMP start
        
        RET


waitcommand:
                   
loop1:  IN AL, 11  
        AND AL, 10b
        CMP AL, 0
        JNE loop1
        MOV AL, 0  ; reset command.
        OUT 9, AL  ; 
        RET
        
waitdata:
loop2:  IN AL, 11  
        AND AL, 01b
        CMP AL, 0
        JE loop2
        RET

