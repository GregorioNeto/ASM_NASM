%include "io.inc"
;12. Escreva um programa que usa um laço para calcular os sete primeiros valores da sequência
;de números de Fibonacci, descrita pela seguinte fórmula: Fib(1) = 1, Fib(2) = 1, Fib(n) =
;Fib(n – 1) + Fib(n – 2).

section .text

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx,12
    mov eax,0
    mov ebx,1
    mov edx,0

        add eax,ebx
        cmp eax,ebx
        jnz exit
        PRINT_UDEC 4,eax  
        dec ecx
        For:
            PRINT_UDEC 4,eax
            mov edx,eax
            add eax,ebx
            mov ebx,edx
                            
     loop For
    xor eax, eax
exit:
    ret
