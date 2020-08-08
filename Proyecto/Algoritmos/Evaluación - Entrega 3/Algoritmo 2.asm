//Arreglos y dir. indirecto

DATA:
vector FCh
1010b
i 0
result 0

CODE:
comparar:
MOV A, 0	//guarda el puntero del arreglo vector en A
MOV B,(i)   	//B=Mem[i]
ADD B,A    	//B=vector+Mem[i]
MOV A,(B)  	//A=Mem[B]
INC B   //B++
MOV (i),B   //guardamos el indice en i

XOR B,(B)
MOV A,B
MOV B,(i)
MOV (vector),A
MOV B,0
SHL (B),A

mostrar_arreglo:
MOV B,(B)
MOV A,(vector)
CMP A,B
JEQ label2

fin:
JMP fin

label2:
MOV B,(i)
NOT (B),A
XOR A,(B)
JMP mostrar_arreglo
