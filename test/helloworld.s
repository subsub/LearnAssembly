section .text
global _main       ; must be declared for linker (ld)

_main:                  ; tells linker entry point
    mov rax, 0x2000004  ; System call number (sys_write)
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, msg        ; message to write
    mov rdx, len        ; length of message
    syscall

    mov rax, 0x2000001  ; system exit
    mov rdi, 0          ; program exit
    syscall

section .data
msg db "Hello, World!", 0ah     ; string to be printed
len equ $ - msg         ; length of the string