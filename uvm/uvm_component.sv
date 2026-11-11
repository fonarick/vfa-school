`ifndef					UVM_COMPONENT_SV
`define					UVM_COMPONENT_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— uvm - uvm_component
// —————————————————————————————————————————————————————————————————————————————————
class					uvm_component extends uvm_object;
// —————————————————————————————————————————————————————
uvm_component				m_parent					;
uvm_component				m_children			[string];
// —————————————————————————————————————————————————————
// ————————— (string, uvm_component)
// —————————————————————————————————————————————————————
function				new								(
	string					name						,
	uvm_component			parent
)														;
	super.new(name)										;
	m_parent							  =	parent		;
	if (parent != null)
		parent.m_children[name]			  =	this		;
endfunction
// —————————————————————————————————————————————————————
// ————————— get_full_name(): string
// —————————————————————————————————————————————————————
virtual function string	get_full_name					(
)														;
	if (m_parent == null)
		return				name						;
	return					{m_parent.get_full_name(), ".", name};
endfunction
// —————————————————————————————————————————————————————
// ————————— get_type_name(): string
// —————————————————————————————————————————————————————
virtual function string	get_type_name					(
)														;
	return					"uvm_component"				;
endfunction
// ————————————————————————————————————————————————————————————————————————————————— phase
// —————————————————————————————————————————————————————
// ————————— build_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual function void	build_phase						(
	uvm_phase				phase
)														;
endfunction
// —————————————————————————————————————————————————————
// ————————— connect_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual function void	connect_phase					(
	uvm_phase				phase
)														;
endfunction
// —————————————————————————————————————————————————————
// ————————— end_of_elaboration_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual function void	end_of_elaboration_phase		(
	uvm_phase				phase
)														;
endfunction
// —————————————————————————————————————————————————————
// ————————— start_of_simulation_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual function void	start_of_simulation_phase		(
	uvm_phase				phase
)														;
endfunction
// —————————————————————————————————————————————————————
// ————————— pre_reset_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual task			pre_reset_phase					(
	uvm_phase				phase
)														;
endtask
// —————————————————————————————————————————————————————
// ————————— reset_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual task			reset_phase						(
	uvm_phase				phase
)														;
endtask
// —————————————————————————————————————————————————————
// ————————— post_reset_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual task			post_reset_phase				(
	uvm_phase				phase
)														;
endtask
// —————————————————————————————————————————————————————
// ————————— pre_configure_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual task			pre_configure_phase				(
	uvm_phase				phase
)														;
endtask
// —————————————————————————————————————————————————————
// ————————— configure_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual task			configure_phase					(
	uvm_phase				phase
)														;
endtask
// —————————————————————————————————————————————————————
// ————————— post_configure_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual task			post_configure_phase			(
	uvm_phase				phase
)														;
endtask
// —————————————————————————————————————————————————————
// ————————— run_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual task			run_phase						(
	uvm_phase				phase
)														;
endtask
// —————————————————————————————————————————————————————
// ————————— pre_shutdown_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual task			pre_shutdown_phase				(
	uvm_phase				phase
)														;
endtask
// —————————————————————————————————————————————————————
// ————————— shutdown_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual task			shutdown_phase					(
	uvm_phase				phase
)														;
endtask
// —————————————————————————————————————————————————————
// ————————— post_shutdown_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual task			post_shutdown_phase				(
	uvm_phase				phase
)														;
endtask
// —————————————————————————————————————————————————————
// ————————— extract_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual function void	extract_phase					(
	uvm_phase				phase
)														;
endfunction
// —————————————————————————————————————————————————————
// ————————— check_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual function void	check_phase						(
	uvm_phase				phase
)														;
endfunction
// —————————————————————————————————————————————————————
// ————————— report_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual function void	report_phase					(
	uvm_phase				phase
)														;
endfunction
// —————————————————————————————————————————————————————
// ————————— final_phase(uvm_phase): void
// —————————————————————————————————————————————————————
virtual function void	final_phase						(
	uvm_phase				phase
)														;
endfunction
// —————————————————————————————————————————————————————
endclass
// —————————————————————————————————————————————————————————————————————————————————
// —————————————————————————————————————————————————————
// ————————— uvm_collect_components(input uvm_component, ref uvm_component): void
// —————————————————————————————————————————————————————
function automatic void	uvm_collect_components			(
	input uvm_component		comp						,
	ref uvm_component		components				 [$]
)														;
	if (comp == null)
		return											;
	components.push_back(comp)							;
	foreach (comp.m_children[c])
		uvm_collect_components(comp.m_children[c], components);
endfunction
// —————————————————————————————————————————————————————
// ————————— uvm_execute_component_phase(input uvm_component, input string, input uvm_phase): void
// —————————————————————————————————————————————————————
task automatic			uvm_execute_component_phase		(
	input uvm_component		comp						,
	input string			phase_name					,
	input uvm_phase			phase
)														;
	case (phase_name)
		"pre_reset":		comp.pre_reset_phase(phase)	;
		"reset":			comp.reset_phase(phase)		;
		"post_reset":		comp.post_reset_phase(phase);
		"pre_configure":	comp.pre_configure_phase(phase);
		"configure":		comp.configure_phase(phase)	;
		"post_configure":	comp.post_configure_phase(phase);
		"run":				comp.run_phase(phase)		;
		"pre_shutdown":		comp.pre_shutdown_phase(phase);
		"shutdown":			comp.shutdown_phase(phase)	;
		"post_shutdown":	comp.post_shutdown_phase(phase);
		default:			$fatal(1, "Unknown task phase: %s", phase_name);
	endcase
endtask
// —————————————————————————————————————————————————————
// ————————— uvm_run_phase_top_down(uvm_component, string, uvm_phase): void
// —————————————————————————————————————————————————————
function automatic void	uvm_run_phase_top_down			(
	uvm_component			comp						,
	string					phase_name					,
	uvm_phase				phase
)														;
	if (comp == null)
		return											;

	case (phase_name)
	"build":				comp.build_phase(phase)		;
	endcase

	foreach (comp.m_children[c])
		uvm_run_phase_top_down(comp.m_children[c], phase_name, phase);
endfunction
// —————————————————————————————————————————————————————
// ————————— uvm_run_phase_bottom_up(uvm_component, string, uvm_phase): void
// —————————————————————————————————————————————————————
function automatic void	uvm_run_phase_bottom_up			(
	uvm_component			comp						,
	string					phase_name					,
	uvm_phase				phase
)														;
	if (comp == null)
		return											;

	foreach (comp.m_children[c])
		uvm_run_phase_bottom_up(comp.m_children[c], phase_name, phase);

	case (phase_name)
	"connect":				comp.connect_phase(phase)	;
	"end_of_elaboration":	comp.end_of_elaboration_phase(phase);
	"start_of_simulation":	comp.start_of_simulation_phase(phase);
	"extract":				comp.extract_phase(phase)	;
	"check":				comp.check_phase(phase)		;
	"report":				comp.report_phase(phase)	;
	"final":				comp.final_phase(phase)		;
	endcase
endfunction
// —————————————————————————————————————————————————————
// ————————— uvm_run_phase_parallel(uvm_component, string, uvm_phase): void
// —————————————————————————————————————————————————————
task automatic			uvm_run_phase_parallel			(
	input uvm_component		comp						,
	input string			phase_name					,
	input uvm_phase			phase
)														;
	uvm_component			components[$]				;
	if (comp == null) begin
		$fatal(1, "Phase '%s': null component", phase_name);
		return											;
	end
	if (phase == null) begin
		$fatal(1, "Phase '%s': null phase", phase_name);
		return											;
	end
	uvm_collect_components(comp, components)			;
	foreach (components[i]) begin
		if (components[i] == null) begin
			$fatal(1, "Phase '%s': components[%0d] is null", phase_name, i);
			return										;
		end
	end
	fork
		begin
			foreach (components[i]) begin
				automatic uvm_component current_comp = components[i];
				fork
					uvm_execute_component_phase(
						current_comp,
						phase_name,
						phase
					)									;
				join_none
			end
			#1step										;
			while (phase.m_objection_count != 0) begin
				#1step									;
			end
			disable fork								;
		end
	join
endtask
// —————————————————————————————————————————————————————
// ————————— run_test(string): void
// —————————————————————————————————————————————————————
task automatic			run_test						(
	string					test_name	  =	""
)														;
	uvm_component			comp						;
	uvm_test				test						;

	uvm_phase				build_ph	  =	new("build");
	uvm_phase				connect_ph	  =	new("connect");
	uvm_phase				end_of_elaboration_ph = new("end_of_elaboration");
	uvm_phase				start_of_simulation_ph = new("start_of_simulation");
	uvm_phase				pre_reset_ph  =	new("pre_reset");
	uvm_phase				reset_ph	  =	new("reset");
	uvm_phase				post_reset_ph =	new("post_reset");
	uvm_phase				pre_configure_ph = new("pre_configure");
	uvm_phase				configure_ph  =	new("configure");
	uvm_phase				post_configure_ph = new("post_configure");
	uvm_phase				run_ph		  =	new("run")	;
	uvm_phase				pre_shutdown_ph = new("pre_shutdown");
	uvm_phase				shutdown_ph	  =	new("shutdown");
	uvm_phase				post_shutdown_ph = new("post_shutdown");
	uvm_phase				extract_ph	  =	new("extract");
	uvm_phase				check_ph	  =	new("check");
	uvm_phase				report_ph	  =	new("report");
	uvm_phase				final_ph	  =	new("final");

	// create test
	comp				  =	uvm_factory::get().create_component_by_name(test_name, "uvm_test_top", null);
	if (comp == null)
		$fatal($sformatf("[%0t] [FATAL] [%s] [%s] %s", $time, "UVM", "RUN_TEST", {"Test ", test_name, " not found"}));
	if (!$cast(test, comp))
		$fatal($sformatf("[%0t] [FATAL] [%s] [%s] %s", $time, "UVM", "RUN_TEST", "Not a uvm_test"));

	uvm_run_phase_top_down(test, "build", build_ph);
	uvm_run_phase_bottom_up(test, "connect", connect_ph);
	uvm_run_phase_bottom_up(test, "end_of_elaboration", end_of_elaboration_ph);
	uvm_run_phase_bottom_up(test, "start_of_simulation", start_of_simulation_ph);
	uvm_run_phase_parallel(test, "pre_reset", pre_reset_ph);
	uvm_run_phase_parallel(test, "reset", reset_ph);
	uvm_run_phase_parallel(test, "post_reset", post_reset_ph);
	uvm_run_phase_parallel(test, "pre_configure", pre_configure_ph);
	uvm_run_phase_parallel(test, "configure", configure_ph);
	uvm_run_phase_parallel(test, "post_configure", post_configure_ph);
	uvm_run_phase_parallel(test, "run", run_ph);
	uvm_run_phase_parallel(test, "pre_shutdown", pre_shutdown_ph);
	uvm_run_phase_parallel(test, "shutdown", shutdown_ph);
	uvm_run_phase_parallel(test, "post_shutdown", post_shutdown_ph);
	uvm_run_phase_bottom_up(test, "extract", extract_ph);
	uvm_run_phase_bottom_up(test, "check", check_ph);
	uvm_run_phase_bottom_up(test, "report", report_ph);
	uvm_run_phase_bottom_up(test, "final", final_ph);
endtask
// —————————————————————————|———————————————————————————|———————————————————————————
`endif