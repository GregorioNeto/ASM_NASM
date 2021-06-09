%include "io.inc"

section .data
    val1 dd 1000h
    val2 dd 4000h
    val3 dd 2000h
    
section .bss
    finalVal: RESW 1
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov eax, [val1]
    add eax, [val2]
    sub eax, [val3]
    mov [finalVal], eax
    
    mov edx, 3000h
    PRINT_HEX 4, eax
    
    
    xor eax, eax
    ret