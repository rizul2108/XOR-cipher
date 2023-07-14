;storing codes in variables to use them later
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
    ;print message to take input of input string 
    mov eax, SYS_WRITE 
    mov ebx, STDOUT
    mov ecx, msg1 
    mov edx, len1 
    int 0x80 

    ;take input from user of the string to be encrypted
    mov eax, SYS_READ 
    mov ebx, STDIN
    mov ecx, input 
    mov edx, 32
    int 0x80 

    ;print message to take input of key character to xorred with
    mov eax, SYS_WRITE 
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80 

    ;take input from user of the character
    mov eax, SYS_READ 
    mov ebx, STDIN
    mov ecx, key 
    mov edx, key_len 
    int 0x80 

    ;move input string and key in registers for loop 
    mov esi, input 
    mov edi, key 

loop:
    mov dl, byte [esi]  ;move the first character of string in dl register
    xor dl, byte [edi]  ;xor it with the key and gets storred in dl register
    mov byte [esi], dl  ;replace the previously storred char with new xorred char
    inc esi             ;move the register to next character
    cmp byte [esi+1], 0 ;check if the next character is a null string then loop ends
    jne loop            ;otherwise same loop runs again

    ;print message to print the encrypted string
    mov eax, SYS_WRITE 
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 0x80 

    ;print encrypted string
    mov eax, SYS_WRITE 
    mov ebx, STDOUT
    mov ecx, input
    mov edx, 32
    int 0x80 

    ;print a newline
    mov eax, SYS_WRITE        
    mov ebx, STDOUT        
    mov ecx, 0xA  
    mov edx, 1        
    int 0x80          

exit:
    ;exits
    mov eax, SYS_EXIT
    xor ebx, ebx 
    int 0x80 
