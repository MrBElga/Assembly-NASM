;nao testada ainda
%include 'biblioteca.inc'

section .data
    v1 DW '105', LF, NULL

section .text

global _start

_start:

    CALL converter_valor
    CALL mostrar_valor

    MOV EAX, SYS_EXIT
    MOV EBX, RET_EXIT
    int SYS_CALL

    converter_valor:
        LEA esi, [v1]
        MOV ECX, 0x3
        CALL STRING_to_Int
        ADD EAX, 0x2
        RET

    mostrar_valor:
        CALL INT_to_String
        CALL SaidaResultado
        RET
    ;String para inteiro
    ;entrada ESI (valor a converter) ECX(tamanho)
    ;Saida: EAX

    STRING_to_Int:
        XOR EBX,EBX
    .prox_digito:
        MOVZX EAX, byte[esi];associacao de registradores 
        INC esi
        SUB al, '0'
        IMUL EBX, 0xA
        ADD EBX, EAX ; EBX = EBX*10 + EAX
        LOOP .prox_digito ;while
        MOV EAX, EBX
        RET

    ;interio para string
    ;entrada: EAX
    ;saida BUFFER (valor) TAM_BUFFER(EDX)
    INT_to_String:
        LEA esi, [BUFFER]
        ADD esi, 0x9
        MOV byte[esi], 0xA
        MOV EBX, 0xA
    .prox_digito:
        XOR EDX, EDX
        DIV EBX
        ADD dl, '0'
        DEC esi
        MOV [esi],dl
        TEST EAX, EAX
        JNZ .prox_digito
        RET

