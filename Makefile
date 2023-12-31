#Echo color print pattern
red=`tput smso; tput bold; tput setaf 1`
green=`tput smso; tput bold; tput setaf 2`
reset=`tput sgr0`
dim=`tput smso; tput dim`

CC=gcc

FILE?=default_value_if_not_set_in_environment

compile:
	@if [ $(FILE) = "FOR" ]; then\
		make for --no-print-directory;\
	fi
	@if [ $(FILE) = "MATH" ]; then\
		make math --no-print-directory;\
	fi
	@if [ $(FILE) = "HELLO" ]; then\
		make hello --no-print-directory;\
	fi

for:
	@ nasm -f elf32 $(FILE)/$(FILE).asm -o $(FILE)/$(FILE).o;
	@ $(CC) -m32 $(FILE)/$(FILE).o -o $(FILE)/program;
	@ ./$(FILE)/program || true;

math:
	@ nasm -f elf64 $(FILE)/ABS.asm -o $(FILE)/ABS.o;
	@ nasm -f elf64 $(FILE)/SQUARE.asm -o $(FILE)/SQUARE.o;
	@ $(CC) -no-pie $(FILE)/main.c $(FILE)/*.o -o $(FILE)/program;
	@ ./$(FILE)/program || true;

hello:
	@ nasm -f elf64 $(FILE)/$(FILE).asm -o $(FILE)/$(FILE).o;
	@ $(CC) -no-pie $(FILE)/main.c $(FILE)/*.o -o $(FILE)/program;
	@ ./$(FILE)/program || true;


clean:
	@ rm -f $(FILE)/*.o; rm -f $(FILE)/program
	@ echo ${red}Arquivos limpos!${reset}