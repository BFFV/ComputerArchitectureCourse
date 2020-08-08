DATA:

CODE:				// Sumar switches | Velocidad de clock a "full"

PUSH B				// Guardar puntero

input:
 CALL std_io_btn_wait		// Esperar cambio en botones
 IN (B),0			// Ingresar arr[i]
 MOV A,(B)			// Recuperar switches
 INC B				// Incrementar puntero
 CMP A,0			// Si Switches != 0
 JNE input			// Siguiente input

POP B				// Recuperar puntero
MOV A,0				// Resultado = 0

sumar:				
 PUSH A				// Guardar resultado
 MOV A,(B)			// arr[i] a A
 CMP A,0			// Si arr[i] == 0
 JEQ sumar_fin			// Terminar
 POP A				// Recuperar resultado
 ADD A,(B)			// Resultado + arr[i]
 INC B				// Puntero++
 JMP sumar			// Siguiente
 sumar_fin:
 POP A				// Recuperar Resultado

end:
 OUT A,1			// Mostrar en el Display
 JMP end

/////////////////Libreria std_io//////////////////////////////////////////
									//
std_io_btn_wait:		// * en A, * en B			//
 PUSH B				// Guarda B				//
 IN A,1				// Estado actual			//
 std_io_btn_wait_press_lp:						//
  IN B,1			// Nuevo estado				//
  CMP A,B			// Si ==				//
  JEQ std_io_btn_wait_press_lp	// Continuar				//
 XOR B,A			// Bits cambiados			//
 std_io_btn_wait_release_lp:						//
  IN A,1			// Nuevo estado				//
  AND A,B			// Bits aún cambiados			//
  CMP A,0			// SI != 0				//
  JNE std_io_btn_wait_release_lp// Continuar				//
 MOV A,B			// Bits cambiados a A			//
 POP B				// Recupera B				//
RET				// Retorna Bit(s) en A			//
									//
//////////////////////////////////////////////////////////////////////////
