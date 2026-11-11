`ifndef					UVM_COMPONENT_REGISTRY_SV
`define					UVM_COMPONENT_REGISTRY_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— uvm - uvm_component_registry
// —————————————————————————————————————————————————————————————————————————————————
class					uvm_component_registry		   #(
	type					T			  =	uvm_component,
	string					NAME		  =	""
) extends uvm_object_wrapper							;
// —————————————————————————————————————————————————————
typedef uvm_component_registry #(T, NAME) this_type		;
// —————————————————————————————————————————————————————
// ————————— ()
// —————————————————————————————————————————————————————
function				new								(
)														;
	uvm_factory::get().register(this)					;
endfunction
// —————————————————————————————————————————————————————
// ————————— get(): uvm_component_registry #(T, NAME)
// —————————————————————————————————————————————————————
static function this_type get							(
)														;
	static this_type		m_inst		  =	new()		;
	return					m_inst						;
endfunction
// —————————————————————————————————————————————————————
// ————————— create(string, uvm_component): T
// —————————————————————————————————————————————————————
static function T		create							(
	string					name						,
	uvm_component			parent
)														;
	T						comp		  =	new(name, parent);
	return					comp						;
endfunction
// —————————————————————————————————————————————————————
// ————————— create_object(string): uvm_object
// —————————————————————————————————————————————————————
virtual function uvm_object create_object				(
	string					name
)														;
	return					null						;
endfunction
// —————————————————————————————————————————————————————
// ————————— create_component(string, uvm_component): uvm_component
// —————————————————————————————————————————————————————
virtual function uvm_component create_component			(
	string					name						,
	uvm_component			parent
)														;
	return					create(name, parent)		;
endfunction
// —————————————————————————————————————————————————————
// ————————— get_type_name(): string
// —————————————————————————————————————————————————————
virtual function string	get_type_name					(
)														;
	return					NAME						;
endfunction
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif