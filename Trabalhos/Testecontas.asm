%include "io.inc"

section .data
SwitchCase DD 1
DD Case1
size EQU($-SwitchCase)
DD 300
DD Case2
DD 500
DD Case3
DD 700
DD Case4
DD 800
DD Case5
DD 1000
DD Case6
SizeOfCase EQU ($-SwitchCase)/size


msg1 DB "Vai ter 50% de aumento",0
msg2 DB "Vai ter 40% de aumento",0
msg3 DB "Vai ter 30% de aumento",0
msg4 DB "Vai ter 20% de aumento",0
msg5 DB "Vai ter 10% de aumento",0
msg6 DB "Vai ter 5% de aumento",0
def1  DB "Salário Indeterminado",0
  
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    GET_DEC 2,eax
    mov ebx,SwitchCase
    mov ecx,size
    
        For1:
            cmp eax,[ebx]
            jb For2
            cmp eax,[ebx+size] 
            ja  For2
            call [ebx+4]
            PRINT_STRING [EAX]
            jmp For3
        For2:
            add ebx,size
            dec ecx
            jnz For1
            call def
            PRINT_STRING [eax]
        For3:               
    xor eax, eax
    ret
    
    
Case1:
    mov eax,msg1
    ret
Case2:
    mov eax,msg2
    ret
Case3:
    mov eax,msg3
    ret
Case4:
    mov eax,msg4
    ret
Case5:
    mov eax,msg5
    ret
Case6:
    mov eax,msg6
    ret
def:
    mov eax,def1
    ret