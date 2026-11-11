`ifndef					MAC_TB_PKG_SV
`define					MAC_TB_PKG_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— mac_tb_pkg
// —————————————————————————————————————————————————————————————————————————————————
package					mac_tb_pkg						;
// —————————————————————————————————————————————————————
import						uvm_pkg::*					;
// —————————————————————————————————————————————————————
// ————————— mac_tb_pkg
// —————————————————————————————————————————————————————
`include					"mac_transaction.sv"
`include					"mac_sequence.sv"
`include					"mac_sequencer.sv"
`include					"mac_driver.sv"
`include					"mac_monitor.sv"
`include					"mac_scoreboard.sv"
`include					"mac_agent.sv"
`include					"mac_env.sv"
`include					"mac_test.sv"
// —————————————————————————————————————————————————————
endpackage
// —————————————————————————|———————————————————————————|———————————————————————————
`endif