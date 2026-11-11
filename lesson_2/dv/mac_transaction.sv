`ifndef					MAC_TRANSACTION_SV
`define					MAC_TRANSACTION_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— mac_transaction
// —————————————————————————————————————————————————————————————————————————————————
class					mac_transaction extends uvm_sequence_item;
`uvm_object_utils(mac_transaction)
// —————————————————————————————————————————————————————
rand bit					clken_i						;
rand bit					load_i						;
rand bit [7:0]				dataa_i						;
rand bit [7:0]				datab_i						;
bit	[15:0]					out_o						;
bit							ovfl_o						;
// —————————————————————————————————————————————————————
// ————————— (string)
// —————————————————————————————————————————————————————
function				new								(
	string					name		  =	"mac_transaction"
)														;
	super.new(name)										;
endfunction
// —————————————————————————————————————————————————————
// ————————— c_stimulus
// —————————————————————————————————————————————————————
constraint				c_stimulus						{
	clken_i dist										{
		1				 :=	90							,
		0				 :=	10
	}													;
	load_i dist											{
		1				 :=	20							,
		0				 :=	80
	}													;
	dataa_i dist										{
		8'h00			 :/	10							,
		8'hFF			 :/	10							,
		[8'h01:8'hFE]	 :/	50
	}													;
	datab_i dist										{
		8'h00			 :/	10							,
		8'hFF			 :/	10							,
		[8'h01:8'hFE]	 :/	50
	}													;
}
// —————————————————————————————————————————————————————
// ————————— convert2string(): string
// —————————————————————————————————————————————————————
function string			convert2string					(
)														;
	return					$sformatf("clken=%0b, load=%0b, a=%0h, b=%0h | out=%0h, ovfl=%0b", clken_i, load_i, dataa_i, datab_i, out_o, ovfl_o);
endfunction
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif