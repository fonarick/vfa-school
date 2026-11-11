`ifndef					UVM_SV
`define					UVM_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— uvm
// —————————————————————————————————————————————————————————————————————————————————
`include					"uvm_macros.sv"
// —————————————————————————————————————————————————————
// ————————— uvm_pkg
// —————————————————————————————————————————————————————
package					uvm_pkg							;
	typedef class			uvm_phase					;
	typedef class			uvm_test					;
	typedef class			uvm_object					;
	typedef class			uvm_object_wrapper			;
	typedef class			uvm_sequence_item			;
	typedef class			uvm_sequencer				;
	`include				"uvm_component.sv"
	`include				"uvm_component_registry.sv"
	`include				"uvm_config_db.sv"
	`include				"uvm_factory.sv"
	`include				"uvm_object.sv"
	`include				"uvm_object_registry.sv"
	`include				"uvm_object_wrapper.sv"
	`include				"uvm_phase.sv"
	`include				"tlm/uvm_analysis_imp.sv"
	`include				"tlm/uvm_analysis_port.sv"
	`include				"tlm/uvm_seq_item_export.sv"
	`include				"tlm/uvm_seq_item_port.sv"
	`include				"comps/uvm_agent.sv"
	`include				"comps/uvm_driver.sv"
	`include				"comps/uvm_env.sv"
	`include				"comps/uvm_monitor.sv"
	`include				"comps/uvm_scoreboard.sv"
	`include				"comps/uvm_sequence.sv"
	`include				"comps/uvm_sequence_item.sv"
	`include				"comps/uvm_sequencer.sv"
	`include				"comps/uvm_test.sv"
endpackage
// —————————————————————————————————————————————————————
// —————————————————————————|———————————————————————————|———————————————————————————
`endif