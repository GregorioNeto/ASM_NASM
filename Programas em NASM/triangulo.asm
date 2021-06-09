%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov esi,0
    
    GET_DEC 1,al
    GET_DEC 1,bl
    GET_DEC 1,cl 
    cmp al,0
    jz ZERO
    cmp bl,0
    jz ZERO
    cmp cl,0
    jz ZERO
    
   V.Triangulo:
        mov dl,al   ;A+B>=C
        add dl,bl
        cmp dl,cl
        jb NAO_E_TRIANGULO
        mov dl,bl   ;B+C>=A
        add dl,cl
        cmp dl,al
        jb NAO_E_TRIANGULO
        mov dl,al   ;A+C>=B
        add dl,cl
        cmp dl,bl
        jb NAO_E_TRIANGULO
   
   V.TipoDoTriangulo:    
         cmp al,bl
         je ISOCELES
         cont1:
            cmp bl,cl
            je EQUILATERO
         cont2:
            cmp al,cl 
            je ISOCELES1
         cont3:   
            cmp esi,0
            jz ESCALENO
            cmp esi,1
            je RESULT
            PRINT_STRING "O TRIANGULO É EQUILATERO"                        
    xor eax, eax
    ret
NAO_E_TRIANGULO:
   PRINT_STRING "NAO E UM TRIANGULO"
   ret 
ZERO:
   PRINT_STRING "NAO FOI POSSIVEL POR CONTA DO ZERO"
    ret           
ISOCELES:
    inc esi
    jmp cont1
EQUILATERO:
    inc esi
    jmp cont2   
ESCALENO:
    PRINT_STRING "O TRIANGULO É ESCALENO"
    ret
ISOCELES1:
    inc esi
    jmp cont3
    
RESULT:
    PRINT_STRING "O TRIANGULO É ISOCELES"
    ret