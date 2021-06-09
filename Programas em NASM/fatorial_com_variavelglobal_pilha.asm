%include "io.inc"

section .text
global CMAIN
CMAIN:
    push 3
    call Fat
    PRINT_UDEC 4,eax
    xor eax, eax
    ret

Fat:
    enter 4,0
    MOV ebx,[ebp+8]
    CMP ebx,1
    JA Next
    MOV eax,1
    JMP endFat
    
    Next:
    MOV [ebp-4],ebx
    DEC ebx
    PUSH ebx
    CALL Fat
    MUL DWORD [ebp-4] ;salvar em eax, próprio do mul
    
endFat:
    leave 
    ret 4