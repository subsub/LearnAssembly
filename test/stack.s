global _main

section .data
    addr db "yellow"

section .text
_main:
    mov [addr], byte 'H'        ; addr = 'Hello'
    mov [addr+5], byte '!'      ; addr = 'Hello!
    mov rax, 0x2000004          ; 'write' syscall
    mov rdi, 1                  ; 'stdout' file descriptor
    mov rsi, addr               ; message
    mov rdx, 7                  ; length of message
    syscall
    mov rax, 0x2000001          ; 'exit' syscall
    mov rdi, 0                  ; program exit
    syscall