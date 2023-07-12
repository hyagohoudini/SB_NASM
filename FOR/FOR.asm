; Arquivo de macros imitando for de c
;
; obs: 1- A função de comparação deve altera eax = 0 para falso e eax != 0 para verdadeiro
;      2- É usado uma comparação durante o laço for, então dependendo das operações as flags
;         podem ter sido modificadas

%macro for 3
    %push $for      ; empilha na pilha de contexto um o contexto "for", único

    [section .data]                 ; 
	%$old_eax: dd 0                 ;  reserva espaço na memória para operações
    %$compare_function: dd 0        ;
    %$increment_function: dd 0      ;

	__SECT__
    mov dword [%$increment_function], %3    ; salva endereço de função increment
    mov dword [%$compare_function], %2      ; e compare

    call %1     ; chama função de initialize 

    %$for_loop:

        mov dword [%$old_eax], eax  ; salva o antigo valor de eax na memória
        call [%$compare_function]   ; chama função compare
        cmp eax, 0                  ; compara eax com 0 
        mov eax, dword [%$old_eax]  ; recupera antigo valor de eax
        
        jne %$continue_loop         ; se eax != 0 (verdadeiro) continua loop
            
            jmp %$end_loop          ; senão termina loop

        %$continue_loop:

%endmacro

%macro end_for 0

    %ifctx $for
        call [%$increment_function] ; chama  função de incremento
        jmp %$for_loop              ; volta para loop for

        %$end_loop:
            %pop
    %else 
        %error Esperado declaracao de "for" ; mensagem de erro para caso de fechar "end_for" sem abrir "for"
    %endif

%endmacro

; macros que auxiliam o exemplo
%macro print_res 1
    push %1
    push msg
    call printf
    add esp,8
%endmacro


%macro print_ij 2
    push %2
    push %1
    push ij
    call printf
    add esp,12
%endmacro

%macro print_new_line 0
    push new_line
    call printf
    add esp,4
%endmacro

; data
section .data
    i dd 100
    j dd 100
    res dd 0
    msg db "res = %d",10,0
    ij db "i = %d, j = %d",10,0
    new_line db 10,0
    
;text
section .text

global main
extern printf

main:

    for initiate, compare, incr       ; for (int i = 0, j =0; i < 10 && j < 10; i++, j += 2){
        print_ij dword [i], dword [j] ;      printf("i = %d, j = %d\n", i, j);
        mov eax, 0                    ;
        add eax, dword [i]            ;      res = i + j;
        add eax, dword [j]            ;
        add dword [res], eax          ;
    end_for                          ; }
    
    print_res dword [res]   ; printf("res = %d\n", res)
    print_new_line          ; printf("\n");

    for initiate_i, compare_i, inc_i        ; for (int i = 0; i < 3; i++){
        for initiate_j, compare_j, inc_j    ;   for (int j = 0; j < 3; j++){
                                            ;       
            print_ij dword [i], dword [j]   ;       printf("i = %d, j = %d\n", i, j);
                                            ;
        end_for                             ;    }
    end_for                                 ; }

    ret


; procedures

; primeiro for
initiate:

    mov dword [i], 0
    mov dword [j], 0

    ret

compare:
    ; deve retorna um booleano no registrador eax

    cmp dword [i], 10
    jge false
    cmp dword [j], 10
    jge false

    mov eax, 1
    ret
    false:
        mov eax, 0
    ret

incr:
        inc dword [i]
        
        mov eax,2
        add dword [j], eax

    ret

;-------------------------
; segundo for

initiate_i:
    mov dword [i], 0
    ret

compare_i:
    cmp dword [i], 3
    jge false

    mov eax, 1
    ret

inc_i:
    inc dword [i]
    ret

;-------------------------
; terceiro for

initiate_j:
    mov dword [j], 0
    ret

compare_j:
    cmp dword [j], 3
    jge false

    mov eax, 1
    ret

inc_j:
    inc dword [j]
    ret