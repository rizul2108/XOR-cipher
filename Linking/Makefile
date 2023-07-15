name := xor-c

build: $(name)

$(name):  $(name).o $(name).c 
	./$(name)

$(name).c:$(name).o
	gcc xor-c.c xor-c.o -o xor-c

$(name).o:$(name).asm
	nasm -f elf64 xor-c.asm

clean:
	rm -rf $(name) $(name).o


