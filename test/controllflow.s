section .data
    msgSuccess db "Success!", 0ah
    lenSuccess equ $ - msgSuccess           ; equ is used to define constant
    msgError db "Error!", 0ah
    lenError equ $ - msgError
section .text
global _main
_main:
    mov rax, 0x2000004      ; system write
    mov rdi, 1              ; program stdout
    mov rdx, 100            ; rdx = 100
    cmp rdx, 200            ; compare rdx to 200
    jl skip                 ; jump to skip if rdx is less than 200
    mov rsi, msgError       ; Error message
    mov rdx, lenError       ; error message length
    syscall                 ; system call
    jmp exit                ; jump to exit
skip:
    mov rax, 0x2000004      ; system write
    mov rdi, 1              ; file descriptor stdout
    mov rsi, msgSuccess     ; message
    mov rdx, lenSuccess     ; message length
    syscall                 ; system call
    mov rdi, 0              ; program exit
    jmp exit                ; jump to exit
    mov rax, 0x2000003      ; exit code 3 should be skipped
    mov rdi, 2
exit:
    mov rax, 0x2000001      ; system exit
    syscall