DATA:
var1 12
var2 5
var3 7
res1 0
res2 0
res3 0
CODE:
MOV A,(var1)
MOV (res1),A
MOV A,(res1)
CMP A,12
JNE error

MOV B,(var1)
MOV (res1),B
MOV B,(res1)
MOV A,12
CMP A,B
JNE error

MOV (var1),A
ADD A,(var2)
CMP A,17
JNE error 

MOV A,(var1)
MOV B,(var2)
ADD (res2)
MOV A,(res2)
CMP A,17
JNE error

MOV A,(var1)
SUB A,(var3)
CMP A,5
JNE error

MOV A,(var3)
MOV B,(var2)
SUB (res2)
MOV A,(res2)
CMP A,2
JNE error

MOV A,(var3)
AND A,(var2)
CMP A,5
JNE error

MOV A,(var2)
MOV B,(var1)
AND (res2)
MOV A,(res2)
CMP A,4
JNE error

MOV A,(var1)
OR A,(var2)
CMP A,13
JNE error

MOV A,(var2)
MOV B,(var3)
OR (res2)
MOV A,(res2)
CMP A,7
JNE error

MOV A,(var3)
XOR A,(var2)
CMP A,2
JNE error

MOV A,(var2)
MOV B,(var3)
XOR (res2)
MOV A,(res2)
CMP A,2
JNE error

MOV A,(var2)
NOT (res3),A
MOV A,(res3)
CMP A,65530
JNE error

MOV A,(var3)
SHL (res3),A
MOV A,(res3)
CMP A,14
JNE error

MOV A,(var3)
SHR (res3),A
MOV A,(res3)
CMP A,3
JNE error

INC (res3)
MOV A,(res3)
CMP A,4
JNE error

fin:
MOV A,16
MOV B,16
JMP fin

error:
MOV A,15
MOV B,15
JMP error