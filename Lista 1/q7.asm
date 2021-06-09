%include "io.inc"

;7. Implemente a seguinte expressão em assembly: AX = (val2 + BX) –val4. Assuma que val2 e
;val4 são variáveis inteiras de 16-bit.

section .data
    val2 DW 3
    val4 DW 5
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov bx,10
    add bx,[val2]
    sub bx,[val4]
    mov ax,bx
    PRINT_DEC 2,ax
    xor eax, eax
    ret