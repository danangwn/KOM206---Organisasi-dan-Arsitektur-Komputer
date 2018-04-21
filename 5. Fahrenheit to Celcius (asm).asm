extern scanf
extern printf
extern fflush
   
section .data
    baca db "%f", 0
    cetak db "%.2f", 10, 0
    f dd 32.0
    e dd 1.8
           
section .bss
    a resd 1
    b resd 1
    g resd 1
   
section .text
    global main
       
main:
    push a
    push baca
    call scanf
    add esp, 12
	
	fld dword[a]
	fsub dword[f]
	
	fstp dword[b]
	
	fld dword[b]
	fdiv dword[e]
	
	fstp qword[g]
	
	push dword[g+4]
	push dword[g]
	push cetak
	call printf
	add esp,12


exit:
       
    push 0
    call fflush
       
    mov eax, 1
    mov ebx, 0
    int 0x80
