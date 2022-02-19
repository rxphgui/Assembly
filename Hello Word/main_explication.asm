BITS 64 

global _start // lancement du prog

section .rodata

    data_helloword db "Hello c'est Hatsu", 0xa, 0 // creation de notre string 
    data_helloword_len equ $-data_helloword // size pour notre syscall 

section .text

_start :

    call _xoring // mettre les registres à 0
    mov rax, 0x1 // On met le sys_write 
    mov rdi, 0x1 // On met le unsigned int fd
    mov rsi, data_helloword // On met notre string
    mov rdx, data_helloword_len // La size de notre string
    syscall // Notre Appel Kernel
    jmp _exit 

_xoring :

    xor rax, rax // On sait que a x a = 0
    xor rdi, rdi // Ça nous permet de mettre
    xor rsi, rsi // Les registres à 0
    xor rdx, rdx
    ret 

_exit :

    mov rax, 0x3C // On met le sys_close
    mov rdi, 0 // On met le unsigned int fd
    syscall // Notre Appel Kernel


