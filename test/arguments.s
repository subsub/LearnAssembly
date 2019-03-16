global _main

_main:
    push 12                 ; add 21 to the stack
    call times2
    mov rdi, rax
    mov rax, 0x2000001      ; exit syscall
    syscall

times2:
    ; prolog
    push rbp
    mov rbp, rsp
    ; end prolog

    mov rax, [rbp+16]        ; get parameter
    add rax, rax            ; rax += rax

    ; epilog
    mov rsp, rbp
    pop rbp
    ret