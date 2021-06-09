%include "io.inc"
;9. Escreva um programa que usa um laço para copiar os elementos de um array unsigned Word
;(16-bit) em um array unsigned doubleword (32-bit).

section .data
    arrayA DW 1d,2d,4d
    ;arrayB DD 0d,0d,0d
section .bss
    arrayB RESD 3

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov ecx,0
    mov esi,0 
    For:
        mov ax, [arrayA + (esi*2)]
        movzx ebx,ax
        mov [arrayB + (esi*4)],ebx
        PRINT_DEC 4,ebx
        inc ecx
        inc esi
     cmp ecx,3
     jne For
           
    xor eax, eax
    ret