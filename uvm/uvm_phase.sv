`ifndef					UVM_PHASE_SV
`define					UVM_PHASE_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— uvm - uvm_phase
// —————————————————————————————————————————————————————————————————————————————————
class					uvm_phase						;
// —————————————————————————————————————————————————————
string						name						;
int							m_objection_count			;
event						m_phase_done				;
// —————————————————————————————————————————————————————
// ————————— (string)
// —————————————————————————————————————————————————————
function				new								(
	string					name
)														;
	this.name							  =	name		;
	m_objection_count					  =	0			;
endfunction
// —————————————————————————————————————————————————————
// ————————— raise_objection(uvm_component): void
// —————————————————————————————————————————————————————
function void			raise_objection					(
	uvm_component			comp
)														;
	m_objection_count++									;
	`uvm_info("PHASE", $sformatf("raised (count=%0d)", m_objection_count), UVM_HIGH)
endfunction
// —————————————————————————————————————————————————————
// ————————— drop_objection(uvm_component): void
// —————————————————————————————————————————————————————
function void			drop_objection					(
	uvm_component			comp
)														;
	m_objection_count--									;
	`uvm_info("PHASE", $sformatf("dropped (count=%0d)", m_objection_count), UVM_HIGH)
	if (m_objection_count == 0)
		->m_phase_done									;
endfunction
// —————————————————————————————————————————————————————
// ————————— wait_for_phase_done(): void
// —————————————————————————————————————————————————————
task					wait_for_phase_done				(
)														;
	if (m_objection_count > 0)
		@(m_phase_done)									;
endtask
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif