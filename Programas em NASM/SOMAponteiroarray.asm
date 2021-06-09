%include "io.inc"

        ;Um operador indireto armazena o endereço de uma variável,
        ;usualmente um array ou string. Ele pode ser dsreferenciado
        ;(mesmo modo de um ponteiro).

section .data
arrayW DW 1000h , 2000h , 3000h , 4000h ;array com 3 valores em hexa

section .text
global CMAIN
CMAIN:
    mov ebp, esp        ;for correct debugging
    mov esi , arrayW    ;mover para esi(ponteiro) o arrayW(criado, como se fosse vetor)
    mov ax , [esi]      ;mover o primeiro valor de esi para ax (1000h -> ax)
    add esi, 2          ;add 2 bytes em esi para pular para os proximos 2 bytes(pois ta em DW), ou seja esi está em 2000h
    add ax , [esi]      ;somar o ax = 1000h com esi 2000h    
    add esi , 2         ;ja tinha pulado 2 e agra add 2 bytes em esi para pular para os proximos 2 bytes(pois ta em DW), ou seja esi está em 3000h
    add ax , [esi]      ;somar o ax 3000h com os 3000h de esi
 
   
     PRINT_HEX 2,ax
    
    xor eax, eax
    ret