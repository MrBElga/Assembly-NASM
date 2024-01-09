segment .data
	LF        EQU 0xA  ; Line Feed
	NULL      EQU 0xD  ; Final da String
	SYS_EXIT  EQU 0x1  ; Codigo de chamada para finalizar
	RET_EXIT  EQU 0x0  ; Operacao com Sucesso
	STD_IN    EQU 0x0  ; Entrada padrao
	STD_OUT   EQU 0x1  ; Saida padrao
	SYS_READ  EQU 0x3  ; Operacao de Leitura
	SYS_WRITE EQU 0x4  ; Operacao de Escrita
	SYS_CALL  EQU 0x80 ; Envia informacao ao SO
    TAM_BUFFER EQU 0xA ; buffer de tamanho 10

segment .bss
  
segment .text

	;saida do terminal da string
mostrarSaida:
	CALL tamStr
	MOV EAX, SYS_WRITE
	MOV EBX, STD_OUT
	INT SYS_CALL
	RET

	;calcular tamanho da string EDX 
	;Entrada valor da string em ECX
	;sainha tamanho da string em EDX

tamStr:
	MOV EDX, ECX

proxChar:
	CMP BYTE[EDX], NULL
	JZ terminei
	INC EDX
	JMP proxChar

terminei:
	SUB EDX, ECX
	RET 

