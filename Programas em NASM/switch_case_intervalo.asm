%include "io.inc"

section .data
switch DB 5
DD Process_0
size EQU ($-switch)
DB 10
DD Process_1
DB 15
DD Process_2
DB 20
DD Process_3
tamanhoDosCasos EQU ($-switch)/size
DD 25

msg0 DB "Está entre 5 e 10 (inclusive)",0
msg1 DB "Está entre 11 e 15 (inclusive)",0
msg2 DB "Está entre 16 e 20(inclusive)",0
msg3 DB "Está entre 21 e 25 (inclusive)",0
Def1  DB "Não está em nenhum dos intervalos",0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 1,AL
    MOV EBX,switch
    MOV ECX, tamanhoDosCasos
    
    L1: 
    CMP AL,[EBX]
    JB L2
    CMP AL, [EBX + size]
    JA L2
    CALL [EBX+1]
    PRINT_STRING [EAX]
    JMP L3
    
    L2:
    ADD EBX, size
    DEC ECX
    JNZ L1
    call Def
    PRINT_STRING [EAX]
    L3:
    xor eax, eax
    ret
    
    ;--------------------------------------------------
    Process_0:
    ; 
    ;   Copia a mensagem do caso para o EAX
    ;   Receives: ---
    ;   Requires: ---
    ;   Returns: EAX = mensagem a ser printada
    ;--------------------------------------------------
        MOV EAX,msg0
        RET
        
     ;--------------------------------------------------
    Process_1:
    ; 
    ;   Copia a mensagem do caso para o EAX
    ;   Receives: ---
    ;   Requires: ---
    ;   Returns: EAX = mensagem a ser printada
    ;--------------------------------------------------
        MOV EAX,msg1
        RET
        
    ;--------------------------------------------------
    Process_2:
    ; 
    ;   Copia a mensagem do caso para o EAX
    ;   Receives: ---
    ;   Requires: ---
    ;   Returns: EAX = mensagem a ser printada
    ;--------------------------------------------------
        MOV EAX,msg2
        RET
        
    ;--------------------------------------------------
    Process_3:
    ; 
    ;   Copia a mensagem do caso para o EAX
    ;   Receives: ---
    ;   Requires: ---
    ;   Returns: EAX = mensagem a ser printada
    ;--------------------------------------------------
        MOV EAX,msg3
        RET
        
    ;--------------------------------------------------
    Def:
    ; 
    ;   Copia a mensagem do caso para o EAX
    ;   Receives: ---
    ;   Requires: ---
    ;   Returns: EAX = mensagem a ser printada
    ;--------------------------------------------------
        MOV EAX,Def1
        RET