/***************************************************
 * Copyright © 2026 Sergey Chusov.
 * Version 1.0.0.
 * Licensed under CC BY-NC-ND 4.0
 * (Attribution-NonCommercial-NoDerivatives).
 * https://creativecommons.org/licenses/by-nc-nd/4.0
 * SPDX-License-Identifier: CC-BY-NC-ND-4.0
 ***************************************************/
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— mac - tb
// —————————————————————————————————————————————————————————————————————————————————
module					mac_tb							;
// —————————————————————————————————————————————————————
bit							clk_i						;
mac_if						vif							(.clk_i(clk_i));
// —————————————————————————————————————————————————————
// ————————— dut
// —————————————————————————————————————————————————————
mac						dut								(
	.clk_i					(vif.clk_i					),
	.areset_i				(vif.areset_i				),
	.clken_i				(vif.clken_i				),
	.load_i					(vif.load_i					),
	.dataa_i				(vif.dataa_i				),
	.datab_i				(vif.datab_i				),
	.out_o					(vif.out_o					),
	.ovfl_o					(vif.ovfl_o					)
)														;

always #5 clk_i			  =	~clk_i						;
// —————————————————————————————————————————————————————
// ————————— tb
// —————————————————————————————————————————————————————
initial begin
	import					uvm_pkg::*					;
	uvm_config_db #(virtual mac_if)::set(null, "*", "vif", vif);
	run_test("mac_test")								;
	$finish												;
end
// —————————————————————————————————————————————————————
// ————————— misc
// —————————————————————————————————————————————————————
initial begin
	$dumpfile("wave.vcd");
	$dumpvars(0, tb_irq_ctrl);
end
// —————————————————————————————————————————————————————
endmodule
// —————————————————————————|———————————————————————————|———————————————————————————