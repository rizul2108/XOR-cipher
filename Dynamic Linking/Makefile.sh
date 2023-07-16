nasm -f elf64 xor-c.asm 
mkdir lib 
gcc -shared xor-c.o -o libxor.so
mv libxor.so lib
current_dir=$(pwd)
LD_LIBRARY_PATH="$current_dir/lib"
export LD_LIBRARY_PATH
gcc xor-c.c -o xor-c -lxor -L lib
./xor-c
