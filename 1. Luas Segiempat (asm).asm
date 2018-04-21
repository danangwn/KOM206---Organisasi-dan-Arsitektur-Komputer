extern printf
extern fflush
extern scanf
  
section .data
    fmt db "%d %d",0
    fmtPrint db "%d", 10, 0
  
 section .bss
    i resd 1
    j resd 1
  
section .text
    global main
  
main:
  
;input
push i
push j
push fmt
call scanf
add esp, 12
  
;literasi
mov eax, [j]
mov ebx, [i]
mul ebx

;print 
push eax
push fmtPrint
call printf
add esp, 8
     
exit:
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
