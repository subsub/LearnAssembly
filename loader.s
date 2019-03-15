
; Actual code section
.section .text
.extern kernelMain
.global loader

loader:
    mov $kernel_stack, %esp     ; setting the stack pointer
    call kernelMain             ; Calling the kernelMain

_stop:                          ; Extra precaution to keep running
    cli
    hlt
    jmp _stop

; Variable sections
.section .bss
.space 2*1024*1024
kernel_stack: