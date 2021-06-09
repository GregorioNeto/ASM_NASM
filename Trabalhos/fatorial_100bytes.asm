%include "io.inc"

;NOME:  Gregório Neto e Salmo Mascarenhas

section .bss
    contaux RESD 4    ;contador auxiliar
    valor   RESD 4    ;valor do usuario 
    vetor_fat2 RESD 25 ;reservando 100 bytes para o segundo vetor
     

section .text
global CMAIN
CMAIN:
    mov ebp, esp       ;for correct debugging 
    
    GET_DEC 4, [vetor_fat2+(4*24)]  ;aqui vai ser o valor do usuario e definitivamente o contador
    mov ecx,[vetor_fat2+(4*24)]     ;aqui vamos armazenar o valor do usuario no contador 
    mov eax,0           ;iremos zerar o eax para efetuar soma   
    dec ecx             ;decremento para entrar no prox numero do fatorial, EX: 4! enter in (3!)   
    jmp SOMAR_FAT       ;aqui pula o carry para efetuar a soma

Carry:                  ;incremento do carry, caso haja carry
    inc ebx
    jmp Back            
 
SOMAR_FAT:
    mov edx,25               ;indice para decrementar no loop(linha 32)
    mov ebx,0                ;incrementador de carry(inicia em 0)
    FOR1:  
        mov [contaux], ecx   ;formar um contador auxiliar para guardar o valor de ecx         
        dec edx              ;dec para acessar o vetor
        add eax,ebx          ;soma do valor com o carry
        mov ebx,0            ;informar que o ebx não tem carry 
    FOR2:  
        add eax,[vetor_fat2+(4*edx)]    ;efetuar soma n vezes(de acordo como valor)
        jc Carry
        Back:                           
     loop FOR2                          ;laço para efetuar as somas
        mov [vetor_fat2+(4*edx)],eax    ;mover o valor somado para guardar
        mov eax,0                       ;teremos que zerar denovo para efetuar a soma no proximo laço do FOR1
        mov ecx,[contaux]               ;aqui o ecx recebe o valor guardado anteriormente para decrementar log abaixo    
        sub edx,0                       ;ver se o edx é menor que zero
        jnz FOR1                        ;enquanto o edx for diferente de 0
     loop SOMAR_FAT                     ;agra decrementa o ecx 

     
    
     mov ecx,25                         ;devolve o valor 25 para ecx
     mov edx,0                          ;o contador do indice
     
MOSTRAR:                                ;mostrar na tela o resultado
    PRINT_HEX 4,[vetor_fat2+(4*edx)]
    inc edx
    loop MOSTRAR
    
        
            
    xor eax, eax
    ret