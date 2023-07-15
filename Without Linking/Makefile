# to link the object file and create an executable file and then run executable file

xorCipher:xorCipher.o
	ld -m elf_i386 -s -o xorCipher xorCipher.o
	./xorCipher
	
# assemble the program

xorCipher.o:xorCipher.asm
	nasm -f elf xorCipher.asm 			                                     
