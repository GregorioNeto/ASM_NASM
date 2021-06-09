%include "io.inc"
;2. Escreva um programa que calcula a seguinte expressão usando registradores: A = (A + B) −
;(C + D). Associe valores inteiros aos registradores EAX, EBX, ECX, e EDX.

section .data
    A DB 5d
    B DB 2d
    C DB 3d
    D DB 1d

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax,[A]
    mov ebx,[B]
    mov ecx,[C]
    mov edx,[D]
    add eax,ebx
    add ecx,edx
    neg ecx
    add eax,ecx
    
    PRINT_DEC 1,eax
    xor eax, eax
    ret