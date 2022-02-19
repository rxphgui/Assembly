BITS 64 

global _start

section .rodata

    data_helloword db "Hello c'est Hatsu", 0xa, 0
    data_helloword_len equ $-data_helloword

section .text

_start :
    call _xoring
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, data_helloword
    mov rdx, data_helloword_len
    syscall 
    jmp _exit

_xoring :
    xor rax, rax 
    xor rdi, rdi
    xor rsi, rsi
    xor rdx, rdx
    ret

_exit :
    mov rax, 0x3C
    mov rdi, 0
    syscall