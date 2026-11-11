TOP_MODULE=mac_tb
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE}")" && pwd)

verilator -Mdir build --binary --timing --top ${TOP_MODULE} -I../../uvm/ -Wno-IMPLICITSTATIC --trace --trace-vcd \
	${SCRIPT_DIR}/../rtl/mac.sv \
	${SCRIPT_DIR}/../../uvm/uvm.sv \
	${SCRIPT_DIR}/mac_tb.sv

cd ${SCRIPT_DIR}/build/
"./V${TOP_MODULE}"
cd ${SCRIPT_DIR}/

gtkwave ${SCRIPT_DIR}/build/wave.vcd waveconfig.gtkw