segment .data
	LF        equ 0xA  ; Line Feed
	NULL      equ 0xD  ; Final da String
	SYS_EXIT  equ 0x1  ; Codigo de chamada para finalizar
	RET_EXIT  equ 0x0  ; Operacao com Sucesso
	STD_IN    equ 0x0  ; Entrada padrao
	STD_OUT   equ 0x1  ; Saida padrao
	SYS_READ  equ 0x3  ; Operacao de Leitura
	SYS_WRITE equ 0x4  ; Operacao de Escrita
	SYS_CALL  equ 0x80 ; Envia informacao ao SO

section .data
    msg db "Digite seu nome:", LF, NULL
    tam equ $- msg
    msgB db 'Bem vindo '
    tamB equ $- msgB


section .bss
    nome resb 1 

section .text

global _start

_start: 
    MOV EAX, SYS_WRITE
    MOV EBX, STD_OUT
    MOV ECX, msg
    MOV EDX, tam
    int SYS_CALL

    MOV EAX, SYS_READ
    MOV EBX, STD_IN
    MOV ECX, nome
    MOV EDX, 0xA
    int SYS_CALL

    MOV EAX, SYS_WRITE
    MOV EBX, STD_OUT
    MOV ECX, msgB
    MOV EDX, tamB
    int SYS_CALL

    MOV EAX, SYS_WRITE
    MOV EBX, STD_OUT
    MOV ECX, nome
    MOV EDX, 0xA
    int SYS_CALL

    MOV EAX, SYS_EXIT
    MOV EBX, RET_EXIT
    int SYS_CALL