`ifndef					UVM_SEQUENCER_SV
`define					UVM_SEQUENCER_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— uvm - comps - sequencer
// —————————————————————————————————————————————————————————————————————————————————
class					uvm_sequencer				   #(
	type					T			  =	uvm_sequence_item
) extends uvm_component									;
// —————————————————————————————————————————————————————
uvm_seq_item_export #(T)	seq_item_export				;
// —————————————————————————————————————————————————————
// ————————— (string, uvm_component)
// —————————————————————————————————————————————————————
function				new								(
	string					name						,
	uvm_component			parent
)														;
	super.new(name, parent)								;
	seq_item_export						  =	new("seq_item_export", this);
endfunction
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif