;A file copy program                                               file_copy.asm
;
;Objective: To copy a file using the int 0x80 services.
;    Input: Requests names of the input and output files.
;   Output: Creates a new output file and copies contents of the input file.

%define BUF_SIZE 256

section .data
    extencao db ".crpt", 0
    
section .bss
in_file_name resb 100
out_file_name resb 100
fd_in resd 1
fd_out resd 1
in_buf resd BUF_SIZE

section .text

global encriptar
encriptar:
    
    xor esi,esi ; esi = 0
    xor ecx,ecx ; esi = 0 
    mov eax,[esp+8] ; eax = &name[0] (eax recebe o endereço incial de name)

;----copia o nome para in_file_name----;
copy_name:
    mov ecx,[eax+esi]       ;ecx = name[esi]
    mov [in_file_name+esi],cl   ; in_file_name[esi] = cl 
    cmp ecx,0               ; verifica se o nome terminou
    je finish_copy        ; se tiver terminado sai do loop
    inc esi                 ; se não incrementa e faz de novo
    jmp copy_name          ; jump pra fazer de novo

finish_copy:      
    call add_extension 
    
;----open the input file----;
    mov EAX,5            ;file open
    mov EBX,in_file_name ;input file name pointer   
    mov ECX,0            ;access bits (read only)
    mov EDX,0700         ;file permissions
    int 0x80
    mov [fd_in],EAX      ;store fd for use in read routine
    cmp EAX,0
    jge create_file
    jmp done

;----create output file----;    
create_file:
    mov EAX,8                ;file create
    mov EBX,out_file_name    ;output file name pointer
    mov ECX,777             ;r/w/e by owner only    
    int 0x80
    mov [fd_out],EAX         ;store fd for use in write routine
    cmp EAX,0                ;create error if fd < 0
    jge repeat_read
    jmp close_exit

;----read input file----;
repeat_read:
    mov EAX,3             ;file read
    mov EBX, [fd_in]      ;file descriptor
    mov ECX, in_buf       ;input buffer
    mov EDX, BUF_SIZE     ;size
    int 0x80
;---------------------------------------------ENCRIPTAR--------------------------------------------   
    mov edi,0
    mov esi,[esp+4]
    push eax
    dec eax
encriptaar:
    xor [in_buf+edi],esi
    inc edi
    cmp eax,edi
    jne encriptaar    
    pop eax
;---------------------------------------------FIM_ENCRIPTAR-----------------------------------------

;----write to output file----;
    mov EDX,EAX           ;byte count
    mov EAX,4             ;file write
    mov EBX,[fd_out]      ;file descripto
    mov ECX,in_buf        ;input buffer
    int 0x80
    cmp EDX,BUF_SIZE      ; EDX = # bytes read
    jl  copy_done         ; EDX < BUF_SIZE indicates end-of-file
    jmp repeat_read

;----copy_done----    
copy_done:
    mov EAX,6             ;close output file
    mov EBX,[fd_out]
    int 0x80
close_exit:   
    mov EAX,6             ;close input file
    mov EBX,[fd_in]
    int 0x80
done:
   mov eax, 1
   int 0x80
   ret
   
;----ADD a exensão pedida na questão----;   
add_extension:
    xor esi,esi;esi=0
    xor ecx,ecx;ecx=0
    xor eax,eax;eax=0

;----repetir para copiar o nome----;    
loopcopianome:
    mov ecx,[in_file_name+esi] ; cl = in_file_name[esi]
    cmp cl,0                  ;verifica se o nome terminou  
    je add_ext                 ;se tiver terminado adciona ".crtp" 
    mov [out_file_name+esi],cl ;se não out_file_name[esi] = in_file_name[esi]
    inc esi                     ;esi++
    jmp loopcopianome           ; repete    

;----add a extensao----;    
add_ext:
    mov ecx,[extencao+eax]   ;cl = extenca[eax]
    mov [out_file_name+esi],cl  ;out_file_name[esi] = cl => extenca[eax]
    inc esi                     ;esi++        
    inc eax                     ;eax++
    cmp eax,6                  ;depois de 6 vezes (tamaho de ".crpt")
    jle add_ext                  ;faz de novo    
    
    ret