//Arreglos y más direc. indirecto
DATA:
array 3d
5d
7d
9d
Bh
Dh
Fh
11h
n 8
i 0
a 0011b

CODE:

JMP mostrar_arreglo

try_add:
MOV A,(a)
MOV B,(i)
ADD B,(B)
INC (i)

try_sub:
MOV B,(i)
SUB B,(B)
INC (i)

try_and:
MOV B,(i)
AND B,(B)
INC (i)

try_or:
MOV B,(i)
OR B,(B)
INC (i)

JMP end

mostrar_arreglo:
MOV B,0
loop:
MOV A,(B)
INC B
MOV A,B
CMP A,(n)
JGE volver
JMP loop
volver:
JMP try_add

end: