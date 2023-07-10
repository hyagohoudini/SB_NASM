#Echo color print pattern
red=`tput smso; tput bold; tput setaf 1`
green=`tput smso; tput bold; tput setaf 2`
reset=`tput sgr0`
dim=`tput smso; tput dim`

CC=gcc

FILE?=default_value_if_not_set_in_environment

compile:
	@ nasm -f elf32 $(FILE).asm -o $(FILE).o;
	@ $(CC) -m32 $(FILE).o -o program ;
	@ ./program || true;

clean:
	@ rm -f *.o
	@ echo ${red}Arquivos limpos!${reset}