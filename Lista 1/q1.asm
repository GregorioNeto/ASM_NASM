%include "io.inc"
;1. Faça um programa que receba dois números, calcule e mostre a subtração do primeiro pelo
;segundo.

section .bss
val1 RESB 1
val2 RESB 1
result  RESB 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 1,[val1]
    GET_DEC 1,[val2]
    mov ax,[val1]
    sub ax,[val2]
    mov [result],ax
    PRINT_DEC 1,[result]
    xor eax, eax
    ret