;Program: Rearrange
;Program Deion: ordenar maior para menor a array
;Author: Salmo & Greg EC-3 UFC
;Create Date: 08/03/2018
;Revision: 0.1 alpha
;Modified by: - 

%include "io.inc"

section .data
    array DW 1,2,3,4

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ax, [array]
    mov bx, [array+6]
    mov [array], bx
    mov [array +6],ax
    mov ax, [array+2]
    mov bx, [array+4]
    mov [array+2], bx
    mov [array +4],ax
    
    PRINT_UDEC 2, [array]   
    PRINT_UDEC 2, [array+2]
    PRINT_UDEC 2, [array+4]
    PRINT_UDEC 2, [array+6]
    xor eax, eax
    ret