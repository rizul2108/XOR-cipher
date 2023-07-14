SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data 
    msg1 db "Enter string to be encrypted with XOR-cipher ", 0xA, 0xD 
    len1 equ $-msg1 

    msg2 db "Please enter a key to encrypt", 0xA, 0xD 
    len2 equ $-msg2 

    msg3 db "The encrypted string is: "
    len3 equ $-msg3

    key_len equ 1

section .bss
    input resb 100
    key resb 1

section .text
    global _start

_start:
    mov eax, SYS_WRITE 
    mov ebx, STDOUT
    mov ecx, msg1 
    mov edx, len1 
    int 0x80 

    mov eax, SYS_READ 
    mov ebx, STDIN
    mov ecx, input 
    mov edx, 32
    int 0x80 

    mov eax, SYS_WRITE 
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80 

    mov eax, SYS_READ 
    mov ebx, STDIN
    mov ecx, key 
    mov edx, key_len 
    int 0x80 

    mov esi, input 
    mov edi, key 

loop:
    mov dl, byte [esi]
    xor dl, byte [edi] 
    mov byte [esi], dl
    inc esi 
    cmp byte [esi+1], 0
    jne loop

    mov eax, SYS_WRITE 
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 0x80 

    mov eax, SYS_WRITE 
    mov ebx, STDOUT
    mov ecx, input
    mov edx, 32
    int 0x80 

    mov eax, SYS_WRITE        
    mov ebx, STDOUT        
    mov ecx, 0xA  
    mov edx, 1        
    int 0x80          

exit:
    mov eax, SYS_EXIT
    xor ebx, ebx 
    int 0x80 
