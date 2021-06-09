%include "io.inc"

    ;section .data
    ;contaux DD 0d    ;contador auxiliar
    ;valor   DD 0d    ;valor do usuario 


section .bss
    contaux RESD 4    ;contador auxiliar
    valor   RESD 4    ;valor do usuario 

section .text
global CMAIN
CMAIN:
    mov ebp, esp       ;for correct debugging 
    
    GET_DEC 4, [valor]  ;aqui vai ser o valor do usuario e definitivamente o contador
    mov ecx,[valor]     ;aqui vamos armazenar o valor do usuario no contador   
    mov eax,0           ;iremos zerar o eax para efetuar soma   
    dec ecx             ;decremento para entrar no prox numero do fatorial, EX: 4! enter in (3!)   
    
    FOR1:  
      mov [contaux], ecx   ;formar um contador auxiliar para guardar o valor de ecx          
    
    FOR2:
        add eax,[valor]    ;efetuar soma n vezes(de acordo como valor)
     loop FOR2             ;laço para efetuar as somas
        mov [valor],eax    ;mover o valor somado para guardar
        mov eax,0          ;teremos que zerar denovo para efetuar a soma no proximo laço do FOR1
        mov ecx,[contaux]  ;aqui o ecx recebe o valor guardado anteriormente para decrementar log abaixo
     loop FOR1             ;agra decrementa o ecx  
    
    PRINT_DEC 4,[valor]     ;RESULTADO
       
            
    xor eax, eax
    ret