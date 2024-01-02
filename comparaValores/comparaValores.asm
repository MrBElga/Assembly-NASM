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

section .data
    X DD 1 ;dd significa define double word e db tem 1 bit e dw define word ou seja um char de 2 bits dq 4 bits dt 10 bits
    Y DD 10
    msg DB 'X eh maior que Y', LF , NULL
    tam EQU $- msg
    msg2 DB 'Y eh maior que X', LF , NULL
    tam2 EQU $- msg2

section .bss
    
section .text

global _start

_start: 
    MOV EAX, DWORD[X]
    MOV EBX, DWORD[Y]
    CMP EAX, EBX    ; comparacao coloca os dois em uma "fila" e fica olhando para os dois deve  fazer comparacao apos
    JGE maior       ;EAX >= EBX
    MOV ECX, msg2
    MOV EDX, tam2
    JMP final       ;jmp para pular o bloco de maior

maior:
    MOV ECX, msg
    MOV EDX, tam

final:
    MOV EAX, SYS_WRITE
    MOV EBX, STD_OUT
    int SYS_CALL

    MOV EAX, SYS_EXIT
    MOV EBX, RET_EXIT
    int SYS_CALL