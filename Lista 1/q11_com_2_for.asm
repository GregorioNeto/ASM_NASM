%include "io.inc"
;11. Usando um laço e endereço indexado, escreva o código que rotaciona os membros inteiros
;de 32-bit adiante em uma posição. O valor do final do array deve ir para a primeira posição.
;Por exemplo, o array [10,20,30,40] será transformado em [40,10,20,30].

section .data
 arraY DD 10d,20d,30d,40d
 size DD ($-arraY)/4

section .bss
arrayAux RESD 4

section .text 
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov ecx,[size]
    mov ebx,0
    mov edi,3
    For1:
        mov edx,[arraY+(edi*4)] ;edx=40;edx=10    
        mov eax,[arraY+(ebx*4)] ;eax=10; eax=20
        mov [arrayAux+(ebx*4)],edx;40;
        mov edi,ebx ;edi=0
        inc ebx ;edi=1
        mov [arrayAux+(ebx*4)],eax 
        loop For1
    mov ecx,[size]
    mov ebx,0
    For2:
        mov eax,[arrayAux+(ebx*4)]
        mov [arraY+(ebx*4)],eax
        inc ebx
        loop For2 
    xor eax, eax
    ret
    
    ;10 -> 20