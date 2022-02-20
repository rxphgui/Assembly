BITS 64

global _start

section .bss 
    input1 resb 10

section .text

_start :
    call _input
    jmp _exit

_input :
    mov rax, 0x0
    mov rdi, 0x0
    mov rsi, input1
    mov rdx, 10
    syscall
    jmp _input2

_input2 :
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, input1
    mov rdx, 10
    ret

_exit :
    mov rax, 0x3C
    mov rdi, 0
    syscall