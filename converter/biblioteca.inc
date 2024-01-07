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
    BUFFER RESB 0x1

segment .text

SaidaResultado:
    MOV EAX, SYS_WRITE
    MOV EBX, STD_OUT 
    MOV ECX, BUFFER
    MOV EDX, TAM_BUFFER
    int SYS_CALL
    RET