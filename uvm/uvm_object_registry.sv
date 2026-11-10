`ifndef					UVM_OBJECT_REGISTRY_SV
`define					UVM_OBJECT_REGISTRY_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— uvm - uvm_object_registry
// —————————————————————————————————————————————————————————————————————————————————
class					uvm_object_registry			   #(
	type					T			  =	uvm_object	,
	string					NAME		  =	""
) extends uvm_object_wrapper							;
// —————————————————————————————————————————————————————
typedef uvm_object_registry #(T, NAME) this_type		;
// —————————————————————————————————————————————————————
// ————————— ()
// —————————————————————————————————————————————————————
function				new								(
)														;
	uvm_factory::get().register(this)					;
endfunction
// —————————————————————————————————————————————————————
// ————————— get(): uvm_object_registry #(T, NAME)
// —————————————————————————————————————————————————————
static function this_type get							(
)														;
	static this_type		m_inst		  =	new()		;
	return					m_inst						;
endfunction
// —————————————————————————————————————————————————————
// ————————— create(string): T
// —————————————————————————————————————————————————————
static function T		create							(
	string					name
)														;
	T						obj			  =	new(name)	;
	return					obj							;
endfunction
// —————————————————————————————————————————————————————
// ————————— create_object(string): uvm_object
// —————————————————————————————————————————————————————
virtual function uvm_object create_object				(
	string					name
)														;
	return					create(name)				;
endfunction
// —————————————————————————————————————————————————————
// ————————— create_component(string, uvm_component): uvm_component
// —————————————————————————————————————————————————————
virtual function uvm_component create_component			(
	string					name						,
	uvm_component			parent
)														;
	return					null						;
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