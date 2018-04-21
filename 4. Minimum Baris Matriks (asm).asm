segment .data
    M           dd      17, 14, 24, 11, 18
                dd      21,  6, 13, 19, 25
                dd      10, 22, 20, 12,  7
                dd      3,  15, 23,  5,  1
                dd      8,   4,  9, 16,  2
    ncol        dd      5
    fmt_in      db      "%d", 0
    fmt_out     db      "%d", 10, 0

segment .bss
    n           resd    1
    idx         resd    1
    dval        resd    1

segment .text
    extern scanf, printf, fflush
    global main

    main

    .scan
                push n                  ; scanf("%d", &n)
                push fmt_in
                call scanf
                add esp, 8

    .diag_idx                           ; idx = n * ncol
                mov eax, [n]
                mov ebx, [ncol]
                mul ebx
                mov [idx], eax
                             ; dval = M[idx]
                mov ecx, [idx]
    loops:            
                mov eax, [M + ecx*4]
                add ecx, 1
                mov ebx, [M + ecx*4]
                cmp eax, ebx
                ja loops
                mov [dval], eax

    .print
                push dword [dval]       ; printf("%d\n", dval)
                push fmt_out
                call printf
                push 0                  ; fflush(NULL)
                call fflush
                add esp, 12
    .exit
                mov eax, 1              ; exit(0)
                mov ebx, 0
                int 0x80
