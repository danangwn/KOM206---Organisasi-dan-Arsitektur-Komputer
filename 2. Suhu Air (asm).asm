extern printf
extern fflush
extern scanf
  
section .data
    fmt db "%d", 0
    msgc db "dingin", 10, 0
    msgb db "hangat", 10, 0
    msga db "panas", 10, 0

  
section .bss
    num1 resd 1

section .text
    global main
  
main:
    push num1
    push fmt
    call scanf
    add esp, 8
  
    mov eax, [num1]
  
    cmp eax, 35
    jbe e
  
    cmp eax, 60
    jbe d
 
    push msga
    call printf
    add esp, 4
    jmp cp
  
d:
    push msgb
    call printf
    add esp, 4
    jmp cp
  
e:
    push msgc
    call printf
    add esp, 4
    jmp cp
  
cp:
    push 0
    call fflush
  
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
