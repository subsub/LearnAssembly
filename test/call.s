global _main

_main:
    call func
    call func_two
    call func_three
    mov rax, 0x2000001          ; exit system call
    syscall

func:
    mov rdi, 42             ; rdi = 42
    pop rax                 ; rax = location next to call func
    jmp rax

func_two:
    mov rdi, 10
    ret

func_three:
    ; prolog
    push rbp
    mov rbp, rsp            ; save top of the stack (rsp) to rbp
    ; end prolog
    sub rsp, 3
    mov [rsp], byte 'H'
    mov [rsp+1], byte 'i'
    mov [rsp+2], byte 0ah
    mov rax, 0x2000004      ; write system call
    mov rdi, 1              ; stdout system call
    mov rsi, rsp            ; print rsp
    mov rdx, 3              ; length
    syscall
    mov rdi, 0              ; success program exit
    ; epilog
    mov rsp, rbp            ; set back rsp
    pop rbp
    ret
    ; end epilog