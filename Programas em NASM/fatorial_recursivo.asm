%include "io.inc"

section .text
global CMAIN
CMAIN:
    PUSH 5
    CALL Fat
    PRINT_UDEC 4, EAX
    xor eax, eax
    ret
    
Fat:
    enter 0, 0
    mov EBX, [ebp+8]
    CMP EBX, 1
    JA NEXT
    MOV EAX, 1
    JMP endFat
    NEXT:
    DEC EBX
    PUSH EBX
    CALL Fat
    MUL DWORD[ebp+8]
    
endFat: 
    leave
    ret 4