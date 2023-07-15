name := xor-c

build: $(name)

$(name):  $(name).o $(name).c 
	./$(name)

$(name).c:$(name).o
	gcc $(name).c $(name).o -o  $(name)

$(name).o:$(name).asm
	nasm -f elf64 $(name).asm

clean:
	rm -rf $(name) $(name).o


