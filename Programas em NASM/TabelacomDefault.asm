%include "io.inc"

section .data
switch DB 'A'
DD Processo_A
size EQU ($-switch)
DB 'B'
DD Processo_B
DB 'C'
DD Processo_C
DB 'D'
DD Processo_D
sizeFinal EQU($-switch)/size

msgA DB "Arroz",0
msgB DB "Baiao",0
msgC DB "Macarrao",0
msgD DB "Feijao",0
defoult DB "não deu",0 
section .text
global CMAIN
CMAIN:
    GET_CHAR al
    mov ecx,sizeFinal
    mov ebx, switch
    
 For1:
      cmp al,[ebx]
      jne For2
      call [ebx+1]
      PRINT_STRING [edx] 
      NEWLINE
      jmp For3 
 For2:
     add ebx,size
     dec ecx
     jnz For1
     call Defoult
     PRINT_STRING [edx]
 For3:
               
    xor eax, eax
    ret
    
 Processo_A:
 mov edx,msgA
 ret
 Processo_B:
 mov edx,msgB
 ret
 Processo_C:
 mov edx,msgC
 ret
 Processo_D:
 mov edx,msgD
 ret
 Defoult:
 mov edx,defoult
 ret