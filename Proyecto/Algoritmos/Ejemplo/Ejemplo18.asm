DATA:
			
CODE:	// Ritmo para cacerolazos

loop:
 MOV A,750
 CALL led_beep
 CALL led_beep
 MOV A,375
 CALL led_beep
 CALL led_beep
 MOV A,750
 CALL led_beep
JMP loop


led_beep: // Mseg en A, * en B
  PUSH A
  SHR A
  PUSH A
  MOV A,FFFFh
  OUT A,1
  POP A
  CALL std_wait_ms
  PUSH A
  MOV A,0h
  OUT A,1
  POP A
  CALL std_wait_ms
  POP A
RET


//////////////////Libraria wait //////////////////////////////////////////
									//
std_wait_abs_s_ms:		// Seg en A, Mseg en B			//
 PUSH B				// Guarda Mseg				//
 std_wait_abs_s:		 					//
  IN B,2			// Seg actual				//
  CMP A,B			// Seg > Seg actual			//
  JGT std_wait_abs_s		// Continuar espera			//
 POP B				// Recupera Mseg			//
 JMP std_wait_abs_s_sanity	// Comprobar sanidad de Seg		//
 std_wait_abs_ms_lp:							//
  MOV B,A			// Mseg a B				//
  POP A				// Recupera Seg				//
  std_wait_abs_s_sanity:						//
   PUSH B			// Guarda Mseg				//
   IN B,2			// Seg actual				//
   CMP A,B			// Seg != Seg actual			//
   JNE std_wait_abs_ms_end	// Terminar espera			//
   POP B			// Recupera Mseg			//
  PUSH A			// Guarda Seg				//
  MOV A,B			// Mseg a A				//
  IN B,3			// Mseg actual				//
  CMP A,B			// Mseg > Mseg actual			//
  JGT std_wait_abs_ms_lp	// Continuar espera			//
  MOV B,A			// Mseg a B				//
  POP A				// Recupera Seg				//
  RET				// Void					//
 std_wait_abs_ms_end:							//
 POP B				// Recupera Mseg			//
RET				// Void					//
									//
std_wait_ms:			// Mseg en A, * en B			//
 PUSH A				// Guarda los Mseg			//
 PUSH B				// Guarda B				//
 IN B,3				// Mseg actual				//
 ADD A,B			// Mas Mseg delay			//
 IN B,2				// Seg actual				//
 std_wait_ms_divide_lp:							//
  CMP A,1000			// Si Mseg < 1000			//
  JLT std_wait_ms_divide_end	// Terminar división			//
  SUB A,1000			// Mseg - 1000				//
  INC B				// Seg ++				//
  JMP std_wait_ms_divide_lp	// Continuar división			//
 std_wait_ms_divide_end:						//
 XOR A,B			// Intercambiar registros		//
 XOR B,A			// 					//
 XOR A,B			//					//
 CALL std_wait_abs_s_ms		// Espera absoluta Seg Mseg		//
 POP B				// Recupera B				//
 POP A				// Recupera los Mseg			//
RET				// Void					//
									//
//////////////////////////////////////////////////////////////////////////