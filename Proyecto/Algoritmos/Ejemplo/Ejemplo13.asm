DATA:

CODE:

MOV B,1		//   Dejar el Puerto de los Leds en el Registro B

MOV A,ABCDh	// | 		
OUT A,0		// | Mostrar "ABCD" en el Display
	
MOV A,AAAAh	// |
OUT A,B		// | Mostrar "1010101010101010" en los Leds

end:
JMP end		//   No Hacer Nada Más