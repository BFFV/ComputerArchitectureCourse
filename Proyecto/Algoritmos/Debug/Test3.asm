DATA:
var 10
CODE:
JMP paso1
MOV A,16
paso1:
MOV A,3
CMP A,4
JNE paso2
JMP loop
paso2:
MOV A,3
CMP A,3
JEQ paso3
JMP loop
paso3:
MOV A,10
CMP A,4
JGT paso4
JMP loop
paso4:
CMP A,20
JLT paso5
JMP loop
paso5:
CMP A,8
JGE next1
JMP loop
next1:
CMP A,(var)
JGE paso6
JMP loop
paso6:
CMP A,11
JLE next2
JMP loop
next2:
CMP A,(var)
JLE paso7
JMP loop
paso7:
MOV A,255
ADD A,10
CMP A,B
JCR fin
JMP loop
loop:
MOV A,15
MOV B,15
JMP loop
fin:
MOV A,16
MOV B,16
JMP fin