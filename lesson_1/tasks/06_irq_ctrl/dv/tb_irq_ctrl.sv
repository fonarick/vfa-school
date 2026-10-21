/***************************************************
 * Copyright © 2026 Sergey Chusov.
 * Version 1.0.0.
 * Licensed under CC BY-NC-ND 4.0
 * (Attribution-NonCommercial-NoDerivatives).
 * https://creativecommons.org/licenses/by-nc-nd/4.0
 * SPDX-License-Identifier: CC-BY-NC-ND-4.0
 ***************************************************/
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— tb_irq_ctrl
// —————————————————————————————————————————————————————————————————————————————————
module					tb_irq_ctrl						;
// —————————————————————————————————————————————————————
bit [2:0]					reqs_i						;
bit							mode_i						;
bit	[2:0]					reqs_o						;
// —————————————————————————————————————————————————————
// ————————— dut
// —————————————————————————————————————————————————————
irq_ctrl				dut								(
	.reqs_i					(reqs_i						),
	.mode_i					(mode_i						),
	.reqs_o					(reqs_o						)
)														;
// —————————————————————————————————————————————————————
// ————————— tb
// —————————————————————————————————————————————————————
initial begin
	bit	[2:0]				model					  =	'0;
	for (int mode = 0; mode < 2; mode++) begin
		mode_i										  =	mode[0];
		for (int i = 0; i < 2**3; i++) begin
			reqs_i			  =	i[2:0]					;
			#10											;
			begin
				model								  =	'0;
				if (mode == '0) begin
					for (int j = 0; j < 3; j++) begin
						if (i[j] == '1) begin
							model[j]				  =	'1;
							break						;
						end
					end
				end else begin
					for (int j = 0; j < 3; j++) begin
						if (i[2-j] == '1) begin
							model[2-j]				  =	'1;
							break						;
						end
					end
				end
			end
			if (reqs_o != model) begin
				$display("ERROR %0dns | MODEL: 0b%0b, REAL: 0b%0b", $time, model, reqs_o);
				$fatal()								;
			end
		end
	end
	$display("TEST OK")									;
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