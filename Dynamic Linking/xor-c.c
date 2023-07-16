#include <stdio.h>
#include <string.h>
#include"xorCiph.h"
// void xorCipher(char* str,char key);
int main() {
    char str[100];
    char key;

    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);

    printf("Enter a key: ");
    key=getchar();

     xorCipher(str,key);

    printf("Encrypted String: %s", str);

    return 0;
}