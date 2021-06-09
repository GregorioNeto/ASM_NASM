%include "io.inc"
;10. Escreva um programa com um laço e endereçamento indireto que copie uma string da
;origem para o destino, invertendo a ordem dos caracteres no processo. Use as seguintes
;variáveis:
;• source DB "This is the source string",0
;• target RESB $-source


section .data
    source DB "This is the source string",0
    size DB ($-source)
section .bss
    target RESB size-source

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov esi, (source + 25)
    mov ecx, [size]
    mov edx,0 
    For:
        mov al,[esi]       
        mov [target+edx],al
        mov bl,al
        PRINT_CHAR bl
        dec esi
        inc edx            
    loop For
    
    xor eax, eax
    ret