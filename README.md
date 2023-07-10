# SB - Trabalho NASM

### Matrículas/Alunos:

- 170105067 Hyago Gabriel Oliveira Figueiredo

### Clonar repo:

```
git clone https://github.com/
```

## COMO RODAR:

#### Utilizar os próximos comandos no root da pasta do trabalho

- Para rodar a parte 1 - pré-processador:
  ```
  make FILE=FOR
  ```
- Para rodar a parte 2 - montador:
  ```
    make FILE=HELLO
  ```

- Para limpas objetos e saídas anteriores
  ```
  make clean FILE=***FOR/HELLO***
  ```

  **IMPORTANTE QUE NÃO HAJA MUDANÇA NOS DIRETÓRIOS PARA UM BOM FUNCIONAMENTO DO PROGRAMA**

## Saída do Programa:
- **Implementação do for:** Saída para for simples e, em seguida, encadeamento de for's para teste do uso do contexto 

- **Implementação para hello:** Tentativa de manter-se ao básico, buscando prints implementados externamente em linguagem nasm

## Indicações da plataforma utilizada:

- Compilador: GCC e NASM
- Sistema Operacional: Pop!\_OS 22.04 & Win11
- Ambiente utilizado para programar: Visual Studio Code