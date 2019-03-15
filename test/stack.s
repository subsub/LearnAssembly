global _main

section .data
    addr db "yellow", 0ah        ; db means define byte

section .text
_main:
    mov r9, addr                ; r9 = addr
    mov [r9], byte 'H'          ; addr = 'Hellow'
    mov [r9+5], byte 'o'        ; addr = 'Helloo'
    mov rax, 0x2000004          ; 'write' syscall
    mov rdi, 1                  ; 'stdout' file descriptor
    mov rsi, addr               ; message
    mov rdx, 7                  ; length of message
    syscall
    mov rax, 0x2000001          ; 'exit' syscall
    mov rdi, 0                  ; program exit
    syscall