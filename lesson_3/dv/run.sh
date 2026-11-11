TOP_MODULE=mac_tb
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE}")" && pwd)

verilator -Mdir build --assert --binary --timing --top ${TOP_MODULE} -I../../uvm/ -Wno-IMPLICITSTATIC -Wno-DEFOVERRIDE --trace --trace-vcd \
	-DUVM_VERBOSITY=UVM_NONE \
	${SCRIPT_DIR}/tb_classes.sv

cd ${SCRIPT_DIR}/build/
"./V${TOP_MODULE}"
cd ${SCRIPT_DIR}/

gtkwave ${SCRIPT_DIR}/build/wave.vcd waveconfig.gtkw