%include 'biblioteca.inc'

section .data
    titulo DB LF, '+.............+', LF, '| CALCULADORA |', LF, '+.............+', NULL
    obterValor1 DB LF, 'Valor 1: ', NULL
    obterValor2 DB LF, 'Valor 2: ', NULL
    opcao1 DB LF, '1. Adicionar', NULL
    opcao2 DB LF, '2. Subtrair', NULL
    opcao3 DB LF, '3. Multiplicar', NULL
    opcao4 DB LF, '4. Dividir', NULL
    msgOpc DB LF, 'Opcao: ', NULL
    msgErro DB LF, 'Valor de Opcao Invalido', NULL
    p1 DB LF, 'Processo de Adicao', NULL
    p2 DB LF, 'Processo de Subtracao', NULL
    p3 DB LF, 'Processo de Multiplicacao', 
    p4 DB LF, 'Processo de Dividir', NULL
    msgFim DB LF, 'Finalizado', NULL

    section .bss
        opc RESB 1
        num1 RESB 1 
        num2 RESB 1 

    section .text
    
    global _start

    _start:
        MOV ECX, titulo
        CALL mostrarSaida

        ;mostrar opcoes
        MOV ECX, opcao1
        CALL mostrarSaida
        MOV ECX, opcao2
        CALL mostrarSaida
        MOV ECX, opcao3
        CALL mostrarSaida
        MOV ECX, opcao4
        CALL mostrarSaida

        ;mensagem de opcao
        MOV ECX, msgOpc
        CALL mostrarSaida
        MOV EAX, SYS_READ
        MOV EBX, STD_IN
        MOV ECX, opc
        MOV EDX, 0x2
        INT SYS_CALL

       ;converter opc para numero String para numero
        MOV AH, [opc]
        SUB AH, '0'

        ;verifica se vlaores de  0 a 3
        CMP AH, 4
        JG mostrerro
        CMP AH, 1
        JL mostrerro
       

        ;obter os valores 
        MOV ECX, obterValor1
        CALL mostrarSaida
        MOV EAX, SYS_READ
        MOV EBX, STD_IN
        MOV ECX, num1
        MOV EDX, 0x3
        INT SYS_CALL

        MOV ECX, obterValor2
        CALL mostrarSaida
        MOV EAX, SYS_READ
        MOV EBX, STD_IN
        MOV ECX, num2
        MOV EDX, 0x3
        INT SYS_CALL

        MOV AH, [opc]
        SUB AH, '0'

        CMP AH, 1
        JE Adicionar
        CMP AH, 2
        JE Subtrair
        CMP AH, 3
        JE Multiplicar
        CMP AH, 4
        JE Dividir
  
    saida:
        MOV ECX, msgFim
        CALL mostrarSaida

        MOV EAX, SYS_EXIT
        MOV EBX, RET_EXIT
        INT SYS_CALL
    

    converter_valor_num1:
        LEA esi, [num1]
        MOV ECX, 0x3
        CALL STRING_to_Int
        ADD EAX, 0x2
        RET

    converter_valor_num2:
        LEA esi, [num2]
        MOV ECX, 0x3
        CALL STRING_to_Int
        ADD EAX, 0x2
        RET   
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

     mostrar_valor:
        CALL INT_to_String
        CALL SaidaResultado
        RET
    ;funcoes a serem realizadas   
    Adicionar:
        MOV ECX, p1
        CALL mostrarSaida
        ;CALL converter_valor_num1
        ;CALL mostrar_valor  
        ;CALL converter_valor_num2
        ;CALL mostrar_valor  
        MOV EAX, [num1]
        ADD [num2], EAX
      
        ;CALL mostrarSaida
        JMP saida

    Subtrair:
        MOV ECX, p2
        CALL mostrarSaida
        JMP saida

    Multiplicar:
        MOV ECX, p3
        CALL mostrarSaida
        JMP saida

    Dividir:
        MOV ECX, p4
        CALL mostrarSaida
        JMP saida

    mostrerro:
        MOV ECX, msgErro
        CALL mostrarSaida
        JMP saida


