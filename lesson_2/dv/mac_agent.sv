`ifndef					MAC_AGENT_SV
`define					MAC_AGENT_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— mac_agent
// —————————————————————————————————————————————————————————————————————————————————
class					mac_agent extends uvm_agent		;
`uvm_component_utils(mac_agent)
// —————————————————————————————————————————————————————
mac_sequencer				sqr							;
mac_driver					drv							;
mac_monitor					mon							;
// —————————————————————————————————————————————————————
// ————————— (string, uvm_component)
// —————————————————————————————————————————————————————
function				new								(
	string					name						,
	uvm_component			parent
)														;
	super.new(name, parent)								;
endfunction
// —————————————————————————————————————————————————————
// ————————— build_phase(uvm_phase): void
// —————————————————————————————————————————————————————
function void			build_phase						(
	uvm_phase				phase
)														;
	sqr					  =	mac_sequencer::type_id::create("sqr", this);
	drv					  =	mac_driver::type_id::create("drv", this);
	mon					  =	mac_monitor::type_id::create("mon", this);
endfunction
// —————————————————————————————————————————————————————
// ————————— connect_phase(uvm_phase): void
// —————————————————————————————————————————————————————
function void			connect_phase					(
	uvm_phase				phase
)														;
	drv.seq_item_port.connect(sqr.seq_item_export)		;
endfunction
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif