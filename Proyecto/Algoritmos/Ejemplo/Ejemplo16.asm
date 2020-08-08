DATA:

CODE: 		// Peudo Reloj | Velocidad de clock a "full"

loop:

 IN A,2		// | 
 OUT A,0	// | Mostrar Segundos en el Display	

 IN A,3		// |	
 OUT A,1	// | Y Milisegundos en los Leds	

JMP loop	//   Repetir