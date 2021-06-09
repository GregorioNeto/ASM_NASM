;Program: Soma
;Program Deion: soma valores
;Author: Greg EC-3 UFC
;Create Date: 15/03/18
;Revision: 0.1 alpha
;Modified by: - 

%include "io.inc"

section .bss
    soma RESB 1 ;reserva um byte  na memória
    a    RESB 1
    b    RESB 1


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 1, a ;Recebe do input um valor de 1 byte
    GET_DEC 1, b
    mov al, [a] ; O valor guardado em a é movido para a partição (al) de 8 bits do EAX 
    add al, [b]
    mov [soma], al
    PRINT_DEC 1, [soma]
    xor eax, eax
    ret