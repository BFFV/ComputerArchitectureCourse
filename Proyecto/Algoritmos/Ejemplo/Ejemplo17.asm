DATA:

odd 0		// Es impar
last 0		// Fue impar

CODE:		// Parpadeo Inverso | Velocidad de clock a "full"

loop:

 IN A,2		// |
 AND A,1	// |
 MOV (odd),A	// | Segundo es Impar ?

 IN B,0		//   Leer Switches

 MOV A,0	// |
 NOT A		// |
 ADD A,(odd)	// |
 XOR A,B	// | Si fue Par, Invertir Switches

 OUT A,1	//   Resultado a Leds

 MOV A,(last)	// |
 CMP A,(odd)    // |
 JEQ loop       // | Si Hubo Cambio

  MOV B,1	// |
  XOR (last)	// | Invierte Variable

  IN A,1	// |
  OUT A,0	// | Y Envia Botones al Display 

JMP loop	//   Repetir

