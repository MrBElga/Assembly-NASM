%include 'biblioteca.inc'

section .data
    titulo DB LF, '+.............+', LF, '| CALCULADORA |', LF, '+.............+', NULL
    obterValor1 DB LF, 'Valor 1: ', NULL
    obterValor2 DB LF, 'Valor 2: ', NULL
    opcao1 DB LF, '1. Adicionar', NULL
    opcao2 DB LF, '2. Subtrair', NULL
    opcao3 DB LF, '3. Multiplicar', NULL
    opcao4 DB LF, '4. Dovodor', NULL
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

    ;funcoes a serem realizadas   
    Adicionar:
        MOV ECX, p1
        CALL mostrarSaida
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


