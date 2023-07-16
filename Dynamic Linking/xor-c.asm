section .text
global xorCipher: function

xorCipher:
    loop:
    mov dl, byte [rdi]  ;move the first character of string in dl register
    xor dl, byte [r9]  ;xor it with the key and gets storred in dl register
    mov byte [rdi], dl  ;replace the previously storred char with new xorred char
    inc rdi             ;move the register to next character
    cmp byte [rdi+1], 0 ;check if the next character is a null string then loop ends
    jne loop            ;otherwise same loop runs again
    ret    