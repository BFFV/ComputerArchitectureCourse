DATA:

 a E5h		// 11100101b
 b B3h		// 10110011b
 bits 0b

CODE:		// Contar bits en 1 compartidos

MOV A, ( a) 	// a a A
AND A , ( 1d )	// A & b a A 
JMP loop	// Empieza desde loop

bit:
 INC  (2h)	// bits ++
 loop:
  CMP A ,0b	// Si A == 0
  JEQ  end	// Terminar
  SHR A		// Si A >> 1 genera carry
  JCR  bit	// Siguiente desde bit
		// Si no
  JMP  loop     // Siguiente desde loop

end:
 MOV A,(10b)	// Resultado a A
 JMP end


