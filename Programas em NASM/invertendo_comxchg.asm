;Program: Rearrange with xchg
;Program Deion: ordenar maior para menor a array com xchg
;Author: Salmo & Greg EC-3 UFC
;Create Date: 08/03/2018
;Revision: 0.1 alpha
;Modified by: -

%include "io.inc"

section .data
    array DW 1,2,3,4    ;array que reserva 2 byte para cada dado da variável iniciada

section .text
global CMAIN
CMAIN:
    mov  ebp, esp        ; for correct debugging
    mov  ax, [array]     ;movendo o valor[0](valor= 1) de array para ax
    xchg ax, [array+6]   ;trocando o valor de ax atual(1) com o array da ultima posição(valo=4)
    mov  [array],ax      ;movendo para que o array receba o valo trocado[valor=4] 
    mov  ax, [array+2]   ;movendo o valor[1](valor =2) de array para ax
    xchg ax, [array+4]   ;trocando o valor de ax atual(= 2) com o array da posição[2](valor=3)
    mov  [array+2],ax    ;movendo para que o [array+2] receba o valor trocado[valor=3] 
    
    
    PRINT_UDEC 2,[array]
    PRINT_UDEC 2,[array+2]
    PRINT_UDEC 2,[array+4]
    PRINT_UDEC 2,[array+6]

    xor eax, eax
    ret