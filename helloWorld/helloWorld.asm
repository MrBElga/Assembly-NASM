section .data
    msg db 'Hello World!!', 0xA
    tam equ $- msg
    msgB db 'Testando com 2 palavras!!', 0xA
    tamB equ $- msgB

section .text

global _start
                    
_start: 
    MOV EAX, 0x4
    MOV EBX, 0x1
    MOV ECX, msg
    MOV EDX, tam
    int 0x80
    MOV EAX, 0x4
    MOV EBX, 0x1
    MOV ECX, msgB
    MOV EDX, tamB
    int 0x80

    MOV EAX, 0x1
    MOV EBX, 0x0
    int 0x80 