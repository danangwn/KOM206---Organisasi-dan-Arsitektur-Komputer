extern printf
extern fflush
extern scanf
 
section .data
    fmt     db  "%d", 0
    fmt1    db  "%d", 10, 0
section .bss
    a resd 1
    sum resd 1
section .TEXT
  
    global main
 
main:
    push a
    push fmt
    call scanf
    add esp, 8
 
	
	mov edx, [a]
	mov eax, 0
	mov ebx, 0
loops:
	add eax, ebx
	add ebx, 3
	cmp ebx, edx
	jbe loops
	
hasil:
    push eax
    push fmt1
    call printf
    add esp, 8
     
    push 0
    call fflush
    mov eax,1
    mov ebx,0
    int 0x80
     
    
