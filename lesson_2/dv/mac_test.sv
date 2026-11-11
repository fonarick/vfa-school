`ifndef					MAC_TEST_SV
`define					MAC_TEST_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— mac_test
// —————————————————————————————————————————————————————————————————————————————————
class					mac_test extends uvm_test		;
`uvm_component_utils(mac_test)
// —————————————————————————————————————————————————————
mac_env						env							;
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
	env					  =	mac_env::type_id::create("env", this);
endfunction
// —————————————————————————————————————————————————————
// ————————— run_phase(uvm_phase): void
// —————————————————————————————————————————————————————
task					run_phase						(
	uvm_phase				phase
)														;
	mac_sequence			seq							;
	phase.raise_objection(this)							;

	seq					  =	mac_sequence::type_id::create("seq");
	seq.num_items		  =	200							;
	seq.start(env.agnt.sqr)								;

	phase.drop_objection(this)							;
endtask
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif