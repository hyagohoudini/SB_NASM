section .data
    hello db 'Hello, NASM!', 0

section .text
    global print_message

print_message:
    ; Escreve a mensagem na saída padrão
    mov eax, 4      ; sys_write
    mov ebx, 1      ; fd = stdout
    mov ecx, hello  ; ponteiro para a mensagem
    mov edx, 13     ; tamanho da mensagem
    int 0x80

    ; Retorna para o código em C e finaliza o programa
    ret
