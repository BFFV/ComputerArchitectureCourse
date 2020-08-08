name "Tarea3"

#start=Interruptor.exe#
;#start=robot.exe#

org 100h

start:  
        MOV AX, 0       
        MOV ES, AX
        MOV AL, 90H ; EN LA DIRECCION 0X90 DEL VECTOR DE INTERRUPCIONES   
        MOV BL, 4H       
        MUL BL          
        MOV BX, AX
        MOV SI, OFFSET [boton_1] ;REFERENCIAMOS LA ISR BOTON_1
        MOV ES:[BX], SI
        ADD BX, 2                                              
        MOV AX, CS     
        MOV ES:[BX], AX
             
        MOV AX, 0       
        MOV ES, AX
        MOV AL, 91H ; EN LA DIRECCION 0X91 DEL VECTOR DE INTERRUPCIONES   
        MOV BL, 4H       
        MUL BL          
        MOV BX, AX
        MOV SI, OFFSET [boton_2] ;REFERENCIAMOS LA ISR BOTON_2
        MOV ES:[BX], SI
        ADD BX, 2   
        MOV AX, CS     
        MOV ES:[BX], AX
          
        MOV AX, 0       
        MOV ES, AX
        MOV AL, 92H ; EN LA DIRECCION 0X92 DEL VECTOR DE INTERRUPCIONES   
        MOV BL, 4H       
        MUL BL          
        MOV BX, AX
        MOV SI, OFFSET [boton_3] ;REFERENCIAMOS LA ISR BOTON_3
        MOV ES:[BX], SI
        ADD BX, 2   
        MOV AX, CS     
        MOV ES:[BX], AX
        
        ;Completar Programa
 
        RET
        
      
      ;Agregar Subrutinas
      

      boton_1:
              ;Completar Codigo ISR
              IRET
              
      boton_2:
              ;Completar Codigo ISR
              IRET
      
      boton_3:
              ;Completar Codigo ISR
              IRET