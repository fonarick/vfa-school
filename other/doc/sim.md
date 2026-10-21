# Памятка по основным используемым в курсе командам симулятора.


## Компиляция, элаборация и симуляция.

Перед запуском симуляции выполняется компиляция и элаборация верификационного окружения и тестируемого дизайна.

Ниже будут приведены примеры команд для 3-step simulation flow, где для компиляции, элаборации и симуляции используются отдельные команды, и 2-step simulation flow, где для компиляции используется отдельная команда, а для элаборации и симуляции общая.


## 3-step simulation flow.

### Компиляция.

```bash
vlog <список-исходных-файлов>
```

Пример:

```bash
vlog fulladder.sv tb_fulladder.sv
```

### Элаборация.

```bash
vopt <название-модуля> <настройки-элаборации> -o <название-оптимизированного-модуля>
```

Пример:

```bash
vopt tb_fulladder +acc -o tb_fulladder_opt
```

### Симуляция.

```bash
vsim <флаг-gui-или-batch> <название-оптимизированного-модуля> -do "<команды>"
```

Пример:

```bash
vsim -gui tb_fulladder_opt -do "add wave sim:/tb_fulladder/DUT/*; run -a;"
```

### Компиляция + элаборация + симуляция.

Пример:

```bash
vlog fulladder.sv tb_fulladder.sv
vopt tb_fulladder +acc -o tb_fulladder_opt
vsim -gui tb_fulladder_opt -do "add wave sim:/tb_fulladder/DUT/*; run -a;"
```


## 2-step simulation flow.

### Компиляция.

```bash
vlog <список-исходных-файлов>
```

Пример:

```bash
vlog fulladder.sv tb_fulladder.sv
```

### Элаборация + симуляция.

```bash
vsim <флаг-gui-или-batch> -voptargs="<настройки-элаборации>" <название-модуля> -do "<команды>"
```

Пример:

```bash
vsim -gui -voptargs="+acc" tb_fulladder -do "add wave sim:/tb_fulladder/DUT/*; run -a;"
```

### Компиляция + элаборация + симуляция.

Пример:

```bash
vlog fulladder.sv tb_fulladder.sv
vsim -gui -voptargs="+acc" tb_fulladder -do "add wave sim:/tb_fulladder/DUT/*; run -a;"
```
