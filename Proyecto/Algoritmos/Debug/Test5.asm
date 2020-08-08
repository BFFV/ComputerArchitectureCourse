DATA:
var1 5
var2 4
var3 3

CODE:
MOV A,9
ADD B,14
MOV A,B
CMP A,23
JNE error

MOV A,9
ADD B,(var1) //a+mem en b
MOV A,14
CMP A,B
JNE error

MOV A,14
MOV B,9
SUB B,A
MOV A,5
CMP A,B
JNE error

MOV A,9
SUB B,3
MOV A,6
CMP A,B
JNE error

MOV A,14
SUB B,(var2)
MOV A,10
CMP A,B
JNE error

MOV A,14
AND B,9
MOV A,8
CMP A,B
JNE error

MOV A,9
AND B,(var3) //3
MOV A,1
CMP A,B
JNE error

MOV A,9
OR B,14
MOV A,15
CMP A,B
JNE error

MOV A,5
OR B,(var2) // 4
MOV A,5
CMP A,B
JNE error

MOV A,14
XOR B,9
MOV A,7
CMP A,B
JNE error

MOV A,14
XOR B,(var3) // 3
MOV A,13
CMP A,B
JNE error

MOV A,5
NOT B,A
MOV A,65530
CMP A,B
JNE error

fin:
MOV A,16
MOV B,16
JMP fin

error:
MOV A,15
MOV B,15
JMP error