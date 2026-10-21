TOP_MODULE=tb_fulladder
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE}")" && pwd)

verilator -Mdir build --binary --timing --top ${TOP_MODULE} --trace --trace-vcd \
	${SCRIPT_DIR}/../rtl/fulladder.sv \
	${SCRIPT_DIR}/tb_fulladder.sv

cd ${SCRIPT_DIR}/build/
"./V${TOP_MODULE}"
cd ${SCRIPT_DIR}/

gtkwave ${SCRIPT_DIR}/build/wave.vcd waveconfig.gtkw