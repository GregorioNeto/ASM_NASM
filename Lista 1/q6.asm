%include "io.inc"
;6. Escreva um programa que recebe um vetor de 10 elementos digitados pelo usuário,
;incrementa em uma unidade cada valor e escreve o resultado na tela.

section .bss
   arraY RESB 10 ;vetor

section .text
global CMAIN
CMAIN:
    mov ebp, esp        ; for correct debugging
    mov ecx,0           ;limite vai ser 10(elementos)
    
    For:    
        GET_DEC 1,[arraY+ecx]   ;pega os 10 elementos de cada posição reservada para array
        mov al,[arraY+ecx]      ;
        inc al
        mov [arraY+ecx],al
        PRINT_DEC 1,[arraY+ecx]
        inc ecx
    cmp ecx,10 
    jne For 
    
    xor eax, eax
    ret