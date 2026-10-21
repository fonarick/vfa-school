TOP_MODULE=tb_irq_ctrl
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE}")" && pwd)

verilator -Mdir build --binary --timing --top ${TOP_MODULE} -Wno-IMPLICITSTATIC --trace --trace-vcd \
	${SCRIPT_DIR}/../rtl/src/irq_ctrl.sv \
	${SCRIPT_DIR}/tb_irq_ctrl.sv

cd ${SCRIPT_DIR}/build/
"./V${TOP_MODULE}"
cd ${SCRIPT_DIR}/

gtkwave ${SCRIPT_DIR}/build/wave.vcd waveconfig.gtkw