all: xor-c

xor-c: xor-c.o xorCiph.h libxor.so setEnvVariable
	gcc xor-c.c -o xor-c -lxor -I include -L lib
	./xor-c

xorCiph.h: makeDir
	echo "void xorCipher(char* str,char key); " > xorCiph.h
	mv xorCiph.h include

libxor.so: makeDir xor-c.o
	gcc -shared xor-c.o -o libxor.so	
	mv libxor.so lib

xor-c.o: xor-c.asm
	nasm -f elf64 xor-c.asm -o xor-c.o

makeDir:
	mkdir -p lib include

setEnvVariable:
    $(eval current_dir := $(shell pwd))
    export LD_LIBRARY_PATH=$(current_dir)/lib

clean:
	rm -rf xor-c xor-c.o lib include

