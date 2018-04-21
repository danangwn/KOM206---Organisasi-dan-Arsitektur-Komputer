extern printf
extern fflush
extern scanf
        
section .data
    fmtscan db "%s", 0
    fmtprint db "%d", 10, 0
       
            
section .bss
    str1 resb 21
           
section .text
    global main
            
main:
    cld
    push str1
    push fmtscan
    call scanf
    add esp,8
      
    mov ecx, 20
    mov edi, str1
    mov al, ""
    repne scasb
       
    mov eax, 20
    sub eax, ecx
    mov ebx, 1 
    sub eax,ebx
     
     
    mov ebx, 0
        mov ecx, eax
looping:
 
    mov edi, str1
    mov al, ","
    repne scasb
    add ebx, 1
    cmp ecx, 0
    jne looping
     
     
    push ebx
    push fmtprint
    call printf
    jmp exit
   
  
       
exit:
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
