%include "io.inc"

section .data
    list DW 10h,20h,30h,40h         ;gerando lista de um byte ou seja 8 bits
    ListSize EQU  ($ - list)/2      ;aqui é o contador de corrente ($) que mostra o ultimo 
                                    ;endereço da memoria. o EQU é o indicador de um inteiro

section .bss
    x RESB 2

section .text
global CMAIN
CMAIN:
    
    mov ebp, esp
    mov eax, [list+(0*2)]   ; armazendando no registrador eax o elemento 2 e no tamanho de 2 bytes
    mov [x],eax             ; fazendo a variavel x nao inicializada receber o valor de eax
    PRINT_HEX 2 , [x]       ; print do valor da variavel que foi guardada pelo eax
   
    xor eax, eax
    ret