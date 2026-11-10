`ifndef					UVM_FACTORY_SV
`define					UVM_FACTORY_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— uvm - uvm_factory
// —————————————————————————————————————————————————————————————————————————————————
class					uvm_factory						;
// —————————————————————————————————————————————————————
static uvm_factory			m_inst						;
uvm_object_wrapper			m_registry			[string];
uvm_object_wrapper			m_overrides			[string];
// —————————————————————————————————————————————————————
// ————————— get(): uvm_factory
// —————————————————————————————————————————————————————
static function uvm_factory get							(
)														;
	if (m_inst == null)
		m_inst							  =	new()		;
	return					m_inst						;
endfunction
// —————————————————————————————————————————————————————
// ————————— register(uvm_object_wrapper): void
// —————————————————————————————————————————————————————
function void			register						(
	uvm_object_wrapper		w
)														;
	m_registry[w.get_type_name()]		  =	w			;
endfunction
// —————————————————————————————————————————————————————
// ————————— set_type_override(string, uvm_object_wrapper): void
// —————————————————————————————————————————————————————
function void			set_type_override				(
	string					from_type					,
	uvm_object_wrapper		to_type
)														;
	m_overrides[from_type]				  =	to_type		;
endfunction
// —————————————————————————————————————————————————————
// ————————— create_object_by_name(string, string): uvm_object
// —————————————————————————————————————————————————————
function uvm_object		create_object_by_name			(
	string					type_name					,
	string					name
)														;
	uvm_object_wrapper		w							;
	if (m_overrides.exists(type_name))
		w								  =	m_overrides[type_name];
	else if (m_registry.exists(type_name))
		w								  =	m_registry[type_name];
	else
		return				null						;
	return					w.create_object(name)		;
endfunction
// —————————————————————————————————————————————————————
// ————————— create_component_by_name(string, string, uvm_component): uvm_component
// —————————————————————————————————————————————————————
function uvm_component	create_component_by_name		(
	string					type_name					,
	string					name						,
	uvm_component			parent
)														;
	uvm_object_wrapper		w							;
	if (m_overrides.exists(type_name))
		w								  =	m_overrides[type_name];
	else if (m_registry.exists(type_name))
		w								  =	m_registry[type_name];
	else
		return				null						;
	return					w.create_component(name, parent);
endfunction
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif