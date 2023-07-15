nasm -f elf64 xor-c.asm
gcc xor-c.c xor-c.o -o xor-c
./xor-c
