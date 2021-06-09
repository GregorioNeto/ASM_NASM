%include "io.inc"
;11. Usando um laço e endereço indexado, escreva o código que rotaciona os membros inteiros
;de 32-bit adiante em uma posição. O valor do final do array deve ir para a primeira posição.
;Por exemplo, o array [10,20,30,40] será transformado em [40,10,20,30].



section .data
    arraY DD 10d,20d,30d,40d
    size EQU($-arraY)/4
    array2 DD 10d,20d

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx,size
    mov edx,0
    
    For:
        mov eax,[arraY+(edx*4)]   ;guardar valores
        xchg [arraY+(size*3)],eax ;troca do ultimo com o primeiro
        mov [arraY+(edx*4)],eax   ;passar valores para o array
        inc edx
        loop For
        
    xor eax, eax
    ret