%include 'bibliotecaE.inc'

section .text

global _start

_start:
    LEA esi, [BUFFER];Load Effective Adress, associa um registro de memoria do bss com um desse arquivo
    ADD esi, 0x9 ;inicializando esi, colocando o ponteiro 0x9 inicio de string em hexa
    MOV byte[esi], 0xA  ;movendo para dentro do byte de esi o LF, basicamente dentro de esi tem um \n
    
    DEC esi ;andando esi para tras
    MOV dl, 0x31; 'a' 
    ADD dl ,'0' ; convertendo para numero 
    MOV [esi], dl ;movendo apra esi o registrador dl

    DEC esi ;andando esi para tras
    MOV dl, 0x37; 'g' 
    ADD dl ,'0' ; convertendo para numero 
    MOV [esi], dl ;movendo apra esi o registrador dl

    DEC esi ;andando esi para tras
    MOV dl, 0x3C; 'l' 
    ADD dl ,'0' ; convertendo para numero 
    MOV [esi], dl ;movendo apra esi o registrador dl

    DEC esi ;andando esi para tras
    MOV dl, 0x15; 'E' 
    ADD dl ,'0' ; convertendo para numero 
    MOV [esi], dl ;movendo apra esi o registrador dl

    DEC esi ;andando esi para tras
    MOV dl, 0x12; 'B' 
    ADD dl ,'0' ; convertendo para numero 
    MOV [esi], dl ;movendo apra esi o registrador dl

    DEC esi ;andando esi para tras
    MOV dl, 0x42; 'r' 
    ADD dl ,'0' ; convertendo para numero 
    MOV [esi], dl ;movendo apra esi o registrador dl

    DEC esi ;andando esi para tras
    MOV dl, 0x1D; 'M' 
    ADD dl ,'0' ; convertendo para numero 
    MOV [esi], dl ;movendo apra esi o registrador dl

    call SaidaResultado ;chamada do bloco SaidaResultado da biblioteca*
    
    MOV EAX, SYS_EXIT
    MOV EBX, RET_EXIT
    int SYS_CALL


; A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z
; 11 12 13 14 15 16 17 18 19 1A 1B 1C 1D 1E 1F 20 21 22 23 24 25 26 27 28 29 2A

; a  b  c  d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z
; 31 32 33 34  35  36  37  38  39  3A  3B  3C  3D  3E  3F  40  41  42  43  44  45  46  47  48  49  4A