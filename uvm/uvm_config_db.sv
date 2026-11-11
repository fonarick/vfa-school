`ifndef					UVM_CONFIG_DB_SV
`define					UVM_CONFIG_DB_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— uvm - uvm_config_db
// —————————————————————————————————————————————————————————————————————————————————
class					uvm_config_db				   #(
	type					T			  =	int
)														;
// —————————————————————————————————————————————————————
static T					m_db				[string];
// —————————————————————————————————————————————————————
// ————————— set(uvm_component, string, string, T): void
// —————————————————————————————————————————————————————
static function void	set								(
	uvm_component			comp						,
	string					inst_name					,
	string					field_name					,
	T						value
)														;
	string					key			  =	(inst_name == "") ? field_name : {inst_name, ".", field_name};
	m_db[key]							  =	value		;
endfunction
// —————————————————————————————————————————————————————
// ————————— get(uvm_component, string, string, output T): void
// —————————————————————————————————————————————————————
static function bit		get								(
	uvm_component			comp						,
	string					inst_name					,
	string					field_name					,
	output T				value
)														;
	string					key							;
	key									  =	(inst_name == "") ? {comp.get_full_name(), ".", field_name} : {comp.get_full_name(), ".", inst_name, ".", field_name};
	if (m_db.exists(key)) begin
		value							  =	m_db[key]	;
		return				1							;
	end
	key									  =	{"*.", field_name};
	if (m_db.exists(key)) begin
		value							  =	m_db[key]	;
		return				1							;
	end
	if (m_db.exists(field_name)) begin
		value							  =	m_db[field_name];
		return				1							;
	end
	return					0							;
endfunction
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif