DATA: //esto es un comentario, solo se permite comentarios de una linea
var1 F0F0h //se declara la variable var1, valor máximo
var2 1110b
var3 20d //hola
CODE: //para separar la zona de definicion de variables del codigo
MOV A,(var1) 
MOV B,(var2) 
MOV A,(var3)
INC A 
SUB A,B //A=A-B
ADD A,B //A=A+B
JMP fin
INC B

fin:
JMP fin