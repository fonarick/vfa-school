# ***************************************************
# * Copyright © 2026 Sergey Chusov.
# * Version 1.0.0.
# * Licensed under CC BY-NC-ND 4.0
# * (Attribution-NonCommercial-NoDerivatives).
# * https://creativecommons.org/licenses/by-nc-nd/4.0
# * SPDX-License-Identifier: CC-BY-NC-ND-4.0
# ***************************************************

## Пример простейшего Makefile.
##
## Цели:
##   run        - запуск исполняемого файла;
##   E_FILENAME - компиляция C-файла в исполняемый;
##   clean      - очистка.
##
## Переменные:
##   C_FILENAME - имя C-файла;
##   E_FILENAME - имя исполняемого файла.
##
## Примеры запуска:
##   make
##   make E_FILENAME=main
##   make E_FILENAME=main clean
##   make clean

# Имя C-файла
C_FILENAME = hello_world.c

# Имя исполняемого файла
E_FILENAME = hello_world.elf

# Запуск исполняемого файла
run: $(E_FILENAME)
	./$(E_FILENAME)

# Компиляция C-файла
$(E_FILENAME): $(C_FILENAME)
	gcc $(C_FILENAME) -o $(E_FILENAME)

# Очистка
clean:
	rm -rf $(E_FILENAME)

# Подключение Makefile с целью 'help'
# для вывода строк, начинающихся с '##'
include ../../../common/make/make_help.mk
