#start=robot.exe#
#start=InterruptGenerator.exe#

org 100h

start:  
        MOV AX, 0       
        MOV ES, AX
        MOV AL, 09H ; EN LA DIRECCION 0X09 DEL VECTOR DE INTERRUPCIONES   
        MOV BL, 4H       
        MUL BL          
        MOV BX, AX
        MOV SI, OFFSET [turnleft] ;REFERENCIAMOS LA ISR TURNLEFT
        MOV ES:[BX], SI
        ADD BX, 2   
        MOV AX, CS     
        MOV ES:[BX], AX
        
        MOV AX, 0       
        MOV ES, AX
        MOV AL, 0BH  ; EN LA DIRECCION 0X0B DEL VECTOR DE INTERRUPCIONES  
        MOV BL, 4H       
        MUL BL          
        MOV BX, AX
        MOV SI, OFFSET [forward]  ;REFERENCIAMOS LA ISR FORWARD
        MOV ES:[BX], SI
        ADD BX, 2   
        MOV AX, CS     
        MOV ES:[BX], AX  
        
        MOV AX, 0       
        MOV ES, AX
        MOV AL, 0CH   ; EN LA DIRECCION 0X0C DEL VECTOR DE INTERRUPCIONES 
        MOV BL, 4H       
        MUL BL          
        MOV BX, AX
        MOV SI, OFFSET [turnright]  ;REFERENCIAMOS LA ISR TURNRIGHT
        MOV ES:[BX], SI
        ADD BX, 2   
        MOV AX, CS     
        MOV ES:[BX], AX 
        
        MOV AX, 0       
        MOV ES, AX
        MOV AL, 0DH   ; EN LA DIRECCION 0X0D DEL VECTOR DE INTERRUPCIONES 
        MOV BL, 4H       
        MUL BL          
        MOV BX, AX
        MOV SI, OFFSET [examine]    ;REFERENCIAMOS LA ISR EXAMINE
        MOV ES:[BX], SI
        ADD BX, 2   
        MOV AX, CS     
        MOV ES:[BX], AX
        
        MOV AX, 0       
        MOV ES, AX
        MOV AL, 0EH   ; EN LA DIRECCION 0X0E DEL VECTOR DE INTERRUPCIONES 
        MOV BL, 4H       
        MUL BL          
        MOV BX, AX
        MOV SI, OFFSET [turnon]     ;REFERENCIAMOS LA ISR TURNON
        MOV ES:[BX], SI
        ADD BX, 2   
        MOV AX, CS     
        MOV ES:[BX], AX
        
        MOV AX, 0
        MOV ES, AX
        MOV AL, 0FH     ; EN LA DIRECCION 0X0F DEL VECTOR DE INTERRUPCIONES      
        MOV BL, 4H       
        MUL BL          
        MOV BX, AX
        MOV SI, OFFSET [turnoff]     ;REFERENCIAMOS LA ISR TURNOFF
        MOV ES:[BX], SI
        ADD BX, 2   
        MOV AX, CS     
        MOV ES:[BX], AX

      ;Programa principal
      waiting:
              MOV AL, 7         
              JMP waiting              
              RET
      
      ;Subrutinas
      waitcommand:
      loop1:  IN AL, 11  
              AND AL, 10b
              JNE loop1              
              RET         
              
      waitdata:
      loop3:  IN AL, 11  
              AND AL, 01b
              JE loop3
              RET
              
      
      ;ISRs
      
      forward:
              PUSHA  ;Backup de todos los registros
              
              CALL waitcommand
              MOV AL, 1  ; forward.
              OUT 9, AL  ;
              
              MOV AL, 20h   ;EOI al PIC1
              OUT 20h, AL
              
              POPA   ;Devolver todos los registros
              IRET
      
      turnright:
              PUSHA
              
              CALL waitcommand
              MOV AL, 3  ; turn right.
              OUT 9, AL  ;         
              
              MOV AL, 20h   ;EOI al PIC1
              OUT 20h, AL
                      
              POPA
              IRET 
              
      turnleft:
              PUSHA
              
              CALL waitcommand
              MOV AL, 2  ; turn left.
              OUT 9, AL  ;
              
              MOV AL, 20h   ;EOI al PIC1
              OUT 20h, AL
                      
              POPA
              IRET
      
      examine:
              PUSHA
              
              CALL waitcommand
              MOV AL, 4  ; examine.
              OUT 9, AL  
              CALL waitdata             
              MOV AL, 20h   ;EOI al PIC1
              OUT 20h, AL
              
              
              POPA
              IRET
         
      turnon:
              PUSHA
              
              CALL waitcommand
              MOV AL, 5  ; on.
              OUT 9, AL  ;
              
              MOV AL, 20h   ;EOI al PIC1
              OUT 20h, AL
              
              
              POPA
              IRET
      
      turnoff:
              PUSHA
              
              CALL waitcommand
              MOV AL, 6  ; off.
              OUT 9, AL  ;
              
              MOV AL, 20h   ;EOI al PIC1
              OUT 20h, AL
              
              
              POPA
              IRET