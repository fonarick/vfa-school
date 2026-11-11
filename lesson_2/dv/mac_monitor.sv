`ifndef					MAC_MONITOR_SV
`define					MAC_MONITOR_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— mac_monitor
// —————————————————————————————————————————————————————————————————————————————————
class					mac_monitor extends uvm_monitor	;
`uvm_component_utils(mac_monitor)
// —————————————————————————————————————————————————————
virtual mac_if				vif							;
uvm_analysis_port #(mac_transaction) ap					;
// —————————————————————————————————————————————————————
// ————————— (string, uvm_component)
// —————————————————————————————————————————————————————
function				new								(
	string					name						,
	uvm_component			parent
)														;
	super.new(name, parent)								;
	ap									  =	new("ap", this);
endfunction
// —————————————————————————————————————————————————————
// ————————— build_phase(uvm_phase): void
// —————————————————————————————————————————————————————
function void			build_phase						(
	uvm_phase				phase
)														;
	if (!uvm_config_db #(virtual mac_if)::get(this, "", "vif", vif))
		`uvm_fatal("MON", "No virtual interface")
endfunction
// —————————————————————————————————————————————————————
// ————————— run_phase(uvm_phase): void
// —————————————————————————————————————————————————————
task					run_phase						(
	uvm_phase				phase
)														;
	mac_transaction			tr							;
	forever begin
		@(posedge vif.clk_i)							;
		if (!vif.areset_i) begin
			tr							  =	mac_transaction::type_id::create("tr");
			tr.clken_i					  =	vif.clken_i	;
			tr.load_i					  =	vif.load_i	;
			tr.dataa_i					  =	vif.dataa_i	;
			tr.datab_i					  =	vif.datab_i	;
			tr.out_o					  =	vif.out_o	;
			tr.ovfl_o					  =	vif.ovfl_o	;
			ap.write(tr)								;
		end
	end
endtask
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif