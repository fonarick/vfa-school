`ifndef					MAC_ENV_SV
`define					MAC_ENV_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— mac_env
// —————————————————————————————————————————————————————————————————————————————————
class					mac_env extends uvm_env			;
`uvm_component_utils(mac_env)
// —————————————————————————————————————————————————————
mac_agent					agnt						;
mac_scoreboard				scb							;
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
	agnt				  =	mac_agent::type_id::create("agnt", this);
	scb					  =	mac_scoreboard::type_id::create("scb", this);
endfunction
// —————————————————————————————————————————————————————
// ————————— connect_phase(uvm_phase): void
// —————————————————————————————————————————————————————
function void			connect_phase					(
	uvm_phase				phase
)														;
	agnt.mon.ap.connect(scb.ap)							;
endfunction
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif