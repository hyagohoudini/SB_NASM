section .text
global my_abs

my_abs:
	; Recebendo valor de entrada
	mov  rax, rdi
	; verifica se negativo ou nao
    mov rbx, 0
    cmp rax, rbx
    jl negativo
    
    ; Retornando o valor original
	ret

    negativo:
        ; muda sinal do valor e retorna
        mov rbx, -1
        mul rbx
        ret