section .text
global square

square:
    ; Recebendo valor de entrada
    mov rax, rdi

    ; Calculando o quadrado do valor
    imul rax, rax

    ; Retornando o resultado
    ret