DATA:		// Variables a sumar

 a 5 
 b Ah 

CODE:		// Sumar variables

MOV A,0		// 0 a A
ADD A,(a)	// A + a a A
ADD A,(b)	// A + b a A
MOV B,A		// Resultado a B

end:
 DEC A		// A--
JMP end