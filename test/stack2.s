global _main

section .text
_main:
    sub rsp, 4              ; substract esp by 4 to allocate 4 byte
    mov [rsp], byte 'H'     ; Add H to stack
    mov [rsp+1], byte 'e'   ; add e to stack
    mov [rsp+2], byte 'y'   ; add y to stack
    mov [rsp+3], byte '!'   ; add ! to stack
    mov rax, 0x2000004      ; write syscall
    mov rdi, 1              ; stdout syscall
    mov rsi, rsp            ; pointer esp to write
    mov rdx, 4              ; number of bytes to write
    syscall
    
    sub rsp, 4              ; pop one stack
    mov [rsp], byte 0ah     ; enter character
    mov rax, 0x2000004      ; write syscall
    mov rdi, 1              ; stdout syscall
    mov rsi, rsp            ; pointer rsp to write
    mov rdx, 4              ; number of bytes to write
    syscall
    
    mov rax, 0x2000001      ; exit syscall
    mov rdi, 0              ; program exit
    syscall