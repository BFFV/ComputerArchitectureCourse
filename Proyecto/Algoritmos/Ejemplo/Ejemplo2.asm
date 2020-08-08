DATA:

CODE:		// Swaps

MOV A,3		// A = 3
MOV B,5		// B = 5

MOV (0),A	// |
MOV A,B		// |
MOV B,(0)	// | Swap con MOV y variable auxiliar

SUB A,B		// A = 2

XOR A,B		// | 
XOR B,A		// |
XOR A,B		// | Swap con XOR
