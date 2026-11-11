`ifndef					MAC_DRIVER_SV
`define					MAC_DRIVER_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— mac_driver
// —————————————————————————————————————————————————————————————————————————————————
class					mac_driver extends uvm_driver #(mac_transaction);
`uvm_component_utils(mac_driver)
// —————————————————————————————————————————————————————
virtual mac_if				vif							;
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
	if (!uvm_config_db #(virtual mac_if)::get(this, "", "vif", vif))
		`uvm_fatal("DRV", "No virtual interface")
endfunction
// —————————————————————————————————————————————————————
// ————————— reset_phase(uvm_phase)
// —————————————————————————————————————————————————————
task					reset_phase						(
	uvm_phase				phase
)														;
	`uvm_info("DRV", "Starting reset sequence", UVM_LOW);
	phase.raise_objection(this)							;
	// rst
	vif.areset_i						 <=	'1			;
	vif.clken_i							 <=	'0			;
	vif.load_i							 <=	'0			;
	vif.dataa_i							 <=	'0			;
	vif.datab_i							 <=	'0			;
	repeat (3)
		@(posedge vif.clk_i)							;
	vif.areset_i						 <=	'0			;
	// ~rst
	`uvm_info("DRV", "Reset sequence completed", UVM_LOW)
	phase.drop_objection(this)							;
endtask
// —————————————————————————————————————————————————————
// ————————— run_phase(uvm_phase)
// —————————————————————————————————————————————————————
task					run_phase						(
	uvm_phase				phase
)														;
	mac_transaction			tr							;
	forever begin
		seq_item_port.get_next_item(tr)					;
		@(posedge vif.clk_i)							;
		vif.clken_i						 <=	tr.clken_i	;
		vif.load_i						 <=	tr.load_i	;
		vif.dataa_i						 <=	tr.dataa_i	;
		vif.datab_i						 <=	tr.datab_i	;
		seq_item_port.item_done()						;
	end
endtask
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif