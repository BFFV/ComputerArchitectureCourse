DATA:
CODE:
MOV A,3
MOV B,4
CMP A,B
JEQ error

MOV A,B
MOV B,A
CMP A,B
JNE error

MOV A,3
MOV B,4
ADD A,B
CMP A,7
JNE error

MOV A,3
ADD B,A
MOV A,7
CMP A,B
JNE error

MOV A,5
MOV B,3
SUB A,B
CMP A,2
JNE error

MOV A,11
MOV B,12
AND A,B
CMP A,8
JNE error

MOV A,3
MOV B,6
AND B,A
MOV A,2
CMP A,B
JNE error

MOV A,3
MOV B,8
OR A,B
CMP A,11
JNE error

MOV A,3
MOV B,4
OR B,A
MOV A,7
CMP A,B
JNE error

MOV A,11
MOV B,4
XOR A,B
CMP A,15
JNE error

MOV A,3
MOV B,6
XOR B,A
MOV A,5
CMP A,B
JNE error

MOV A,3
MOV B,4
NOT A
CMP A,65532
JNE error

MOV A,3
SHL A
CMP A,6
JNE error

MOV A,20
SHL B,A
MOV A,40
CMP A,B
JNE error

MOV A,10
SHR A
CMP A,5
JNE error

MOV A,7
SHR B,A
MOV A,3
CMP A,B
JNE error

MOV A,3
MOV B,4
INC A
CMP A,4
JNE error

INC B
MOV A,5
CMP A,5
JNE error

MOV A,7
DEC A
CMP A,6
JNE error

fin:
MOV A,16
MOV B,16
JMP fin

error:
MOV A,15
MOV B,15
JMP error