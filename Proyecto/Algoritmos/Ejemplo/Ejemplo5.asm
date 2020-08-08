DATA:

 varA 13
 varB 5

CODE:		// Restar sin SUB ni ADD:

MOV A,(varB)	// varB a A
NOT (varB),A	// A Negado a varB
INC (varB)	// Incrementar varB

MOV A,(varA)

suma:	
 XOR B,(varB)	// Bits que no generan carry a B
 AND A,(varB)	// Bits que generan carry a A
 MOV (varB),B	// Guardar Bits que no generan carry a B
 SHL A 		// Convertir bits a carries en A
 CMP A,0
 JEQ suma_fin	// Terminar si no hay carries
 JMP suma	// Sumar carries
suma_fin:

MOV B,0	
MOV A,(varB)	// Resultado a A

end:
 NOP
 JMP end

