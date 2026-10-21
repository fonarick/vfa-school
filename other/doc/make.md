# Памятка по особенностям GNU Make, используемым в курсе.


## Аргументы.

Основные аргументы:
- `<переменная>=<значение>`;
- `-n`.

### Аргумент `<переменная>=<значение>`

Служит для переопределения переменных, объявленных в Makefile.

Примеры: 

```bash
make WAVES=0
```

```bash
make SIM_OPTS=-gui
```

### Аргумент `-n`

Служит для вывода всех команд, которые были бы исполнены при вызове, в терминал. Сами команды не исполняются.

Примеры: 

```bash
make -n
```

```bash
make -n SIM_OPTS=-gui
```


## Пользовательские переменные основного Makefile курса.

Вызов:

```bash
make help
```

Выведет список пользовательских переменных.

**Обратите внимание, что у GNU Make нет опции help, автор собственноручно ее реализует!**

Вывод:

```
 This is common examples/tasks Makefile.

 You can run concrete example/task from directory of this Makefile via:
   | make EXAMPLE=<example-directory>

 Available arguments:

   * EXAMPLE  - example directory                
                default is ''

   * SIM_OPTS - simulation options               
                default is '-gui'

   * COMP_OPTS - compilation options
                default is ''

   * RTL_FILE - file with list of all RTL sources
                default is '$(EXAMPLE)/dv/build/rtl.f'

   * TB_FILE  - file with list of all DV sources 
                default is '$(EXAMPLE)/dv/build/tb.f'

   * CONFIG   - additional configuration files
                default is ''

   * INCLUDE  - include files (in package for example);
                these files are tracked but not compiled
                default is ''

   * TOP      - top module for simulation        
                default is 'testbench'

   * OUT      - simulation logs directory        
                default is '$(EXAMPLE)/out'

   * WAVES    - waveform save enable             
                default is '1'

 Examples:

   * Run example 02_sum with batch
     | make EXAMPLE=02_sum SIM_OPTS=-c

   * Run example 03_sum with batch with randomization seed 12345
     | make EXAMPLE=03_sum SIM_OPTS="-c -sv_seed 12345"

   * Run example 10_initial with GUI with no waveform saving
     | make EXAMPLE=10_initial WAVES=0

   * Run example 06_alu with batch and passing define VERSION_4
     to the compilation
     | make EXAMPLE=06_alu SIM_OPTS=-c COMP_OPTS=+define+VERSION_4
     
```
