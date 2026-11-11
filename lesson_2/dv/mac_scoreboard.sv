`ifndef					MAC_SCOREBOARD_SV
`define					MAC_SCOREBOARD_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— mac_scoreboard
// —————————————————————————————————————————————————————————————————————————————————
class					mac_scoreboard extends uvm_scoreboard;
`uvm_component_utils(mac_scoreboard)
// —————————————————————————————————————————————————————
uvm_analysis_imp #(mac_transaction, mac_scoreboard) ap	;

int							pass_count	  =	0			;
int							fail_count	  =	0			;

bit	[15:0]					ref_out						;
bit							ref_ovfl					;
// —————————————————————————————————————————————————————
// ————————— (string, uvm_component)
// —————————————————————————————————————————————————————
function				new								(
	string					name						,
	uvm_component			parent
)														;
	super.new(name, parent)								;
	ap									  =	new("ap", this);
	ref_out								  =	'0			;
	ref_ovfl							  =	'0			;
endfunction
// —————————————————————————————————————————————————————
// ————————— write(mac_transaction): void
// —————————————————————————————————————————————————————
function void			write							(
	mac_transaction			tr
)														;
	bit	[15:0]				ref_mult					;
	bit	[16:0]				ref_sum						;
	if (ref_out !== tr.out_o || ref_ovfl !== tr.ovfl_o) begin
		fail_count++									;
		`uvm_error("SCB", $sformatf("MISMATCH! EXP: out=%0h ovfl=%0b; ACT: out=%0h ovfl=%0b", ref_out, ref_ovfl, tr.out_o, tr.ovfl_o))
	end else begin
		pass_count++									;
	end
	ref_mult			  =	tr.dataa_i * tr.datab_i		;
	ref_sum				  =	{1'b0, ref_out} + {1'b0, ref_mult};
	if (tr.clken_i) begin
		if (tr.load_i) begin
			ref_out		  =	ref_mult					;
			ref_ovfl	  =	1'b0						;
		end else begin
			ref_out		  =	ref_sum[15:0]				;
			ref_ovfl	  =	ref_sum[16]					;
		end
	end
endfunction
// —————————————————————————————————————————————————————
// ————————— report_phase(uvm_phase): void
// —————————————————————————————————————————————————————
function void			report_phase					(
	uvm_phase				phase
)														;
	$display("\n========================================");
	$display("MAC Scoreboard Report:")					;
	$display("PASS: %0d", pass_count)					;
	$display("FAIL: %0d", fail_count)					;
	$display("========================================\n");
	if (fail_count > 0)
		`uvm_error("SCB", "TEST FAILED")
	else
		`uvm_info("SCB", "TEST PASSED", UVM_LOW)
endfunction
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif