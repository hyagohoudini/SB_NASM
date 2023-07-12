#include <stdio.h>

extern long square(long);
extern long my_abs(long);

int main()
{
    long numero;
    printf("Digite um numero negativo: ");
    scanf("%ld", &numero);
    numero = my_abs(numero);
    printf("Valor positivo: %ld\n", numero);
    long result = square(numero);

    printf("O quadrado de %ld é %ld.\n", numero, result);

    return 0;
}