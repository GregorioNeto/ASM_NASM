%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push 10
    push 93
    call Proc
    xor eax, eax
    ret
    
    
Proc:
    enter 4,8           ;4 de variável local e 8 de parâmeto
    MOV eax,0           ;zerar para a soma
    ADD eax,[ebp+12]    ;primeiro valor inserido na pilha
    ADD eax,[ebp+8]     ;segundo valor inserido na pilha
    MOV [ebp-4],eax     ;mover para uma variavel global o valor da soma em eax
    PRINT_UDEC 4,[ebp-4]
    leave   
    ret 8               ;Ele retorna e desimpilha 4 bytes da pilha
    