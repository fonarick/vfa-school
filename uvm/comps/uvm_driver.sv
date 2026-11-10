`ifndef					UVM_DRIVER_SV
`define					UVM_DRIVER_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— uvm - comps - driver
// —————————————————————————————————————————————————————————————————————————————————
class					uvm_driver					   #(
	type					T			  =	uvm_sequence_item
) extends uvm_component									;
// —————————————————————————————————————————————————————
uvm_seq_item_port #(T)		seq_item_port				;
// —————————————————————————————————————————————————————
// ————————— (string, uvm_component)
// —————————————————————————————————————————————————————
function				new								(
	string					name						,
	uvm_component			parent
)														;
	super.new(name, parent)								;
	seq_item_port						  =	new("seq_item_port", this);
endfunction
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif