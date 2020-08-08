DATA:

CODE:			// Sumar inputs

MOV B,0			// Puntero en 0
IN (B),0		// Guardar switches
IN A,2			// Nada a A
ADD A,(B)		// Sumar inputs
IN B,8000h		// Nada a B
ADD A,B			// Sumar inputs

MOV B,0			// Puntero en 0
IN (B),1		// Guardar botones
ADD A,(B)		// Sumar inputs
IN (B),FFFFh		// Guardar nada
ADD A,(B)		// Sumar inputs
OUT A,0			// Mostrar en el Display

end:
 JMP end
