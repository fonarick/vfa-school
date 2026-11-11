`ifndef					MAC_SEQUENCE_SV
`define					MAC_SEQUENCE_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— mac_sequence
// —————————————————————————————————————————————————————————————————————————————————
class					mac_sequence extends uvm_sequence #(mac_transaction);
`uvm_object_utils(mac_sequence)
// —————————————————————————————————————————————————————
int							num_items	  =	200			;
// —————————————————————————————————————————————————————
// ————————— (string)
// —————————————————————————————————————————————————————
function				new								(
	string					name		  =	"mac_sequence"
)														;
	super.new(name)										;
endfunction
// —————————————————————————————————————————————————————
// ————————— body(): void
// —————————————————————————————————————————————————————
task					body							(
)														;
	`uvm_info("SEQ", $sformatf("Starting sequence with %0d items", num_items), UVM_LOW)
	repeat(num_items) begin
		req				  =	mac_transaction::type_id::create("req");
		start_item(req)									;
		assert(req.randomize() == 1) else `uvm_error("SEQ", "Randomize failed")
		finish_item(req)								;
	end
	`uvm_info("SEQ", "Sequence completed", UVM_LOW)	;
endtask
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif