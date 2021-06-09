%include "io.inc"
;INVERTENDO STRING POR INDEXAÇÃO, OU SEJA, POR INDICES


section .data
    source DB "This is the source string",0
    size DB ($-source)
section .bss
    target RESB size-source

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov esi, 25
    mov ecx, [size]
    For:
        mov al,[source+esi]
        mov [target+esi],al        
        PRINT_CHAR al
        dec esi 
    loop For
    
    xor eax, eax
    ret