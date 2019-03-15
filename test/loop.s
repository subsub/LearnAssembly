global _main

section .text
_main:
    mov rax, 0x2000004  ; system write
    mov rdi, 0          ; Starting point
    mov r9, 6           ; number of increment
label:
    add rdi, 1          ; rdi += 1
    dec r9              ; r9 -= 1
    cmp r9, 0           ; compare r9 to 0
    jg label            ; jump to label if r9 greater than 0
    mov rax, 0x2000004  ; 'write' syscall
    mov rsi, rdi        ; rsi rdi
    mov rdi, 1          ; 'stdout' file descriptor
    mov rdx, 1          ; length
    syscall
    mov rax, 0x2000001  ; system exit
    mov rdi, 0          ; program exit
    syscall