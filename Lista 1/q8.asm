%include "io.inc"

;8. Reescreva o exercício anterior considerando val2 e val4 inteiros de 32-bit.

section .data
    val2 DD 3d
    val4 DD 5d
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov ebx,10
    add ebx,[val2]
    sub ebx,[val4]
    mov eax,ebx
    PRINT_DEC 4,eax
    xor eax, eax
    ret