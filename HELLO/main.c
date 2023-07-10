#include <stdio.h>

extern void print_message();

int main()
{
    printf("Chamando código NASM:\n");
    print_message();
    printf("\nCódigo NASM chamado com sucesso!\n");
    return 0;
}
