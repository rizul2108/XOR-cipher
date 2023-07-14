nasm -f elf xorCipher.asm                       # assemble the program
ld -m elf_i386 -s -o xorCipher xorCipher.o      # to link the object file and create an executable file  
./xorCipher                                     # runs the executable file
