`ifndef					UVM_MACROS_SV
`define					UVM_MACROS_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— uvm - uvm_macros
// —————————————————————————————————————————————————————————————————————————————————
// —————————————————————————————————————————————————————
// ————————— report
// —————————————————————————————————————————————————————
// global verbosity
`define						UVM_VERBOSITY	UVM_MEDIUM

`define						uvm_info(ID, MSG, SEV)									\
	if (SEV <= `UVM_VERBOSITY)														\
		$display("[%0t] [INFO] [%s] [%s] %s", $time, get_full_name(), ID, MSG);

`define						uvm_error(ID, MSG)										\
	$display("[%0t] [ERROR] [%s] [%s] %s", $time, get_full_name(), ID, MSG);

`define						uvm_fatal(ID, MSG)										\
begin																				\
	$display("[%0t] [FATAL] [%s] [%s] %s", $time, get_full_name(), ID, MSG);		\
	$fatal()											;							\
end
// —————————————————————————————————————————————————————
// ————————— registry
// —————————————————————————————————————————————————————
`define						uvm_object_utils(T)										\
	typedef uvm_object_registry #(T, `"T`") type_id		;							\
	static function string	type_name();	return `"T`"; endfunction				\
	virtual function string	get_type_name();return `"T`"; endfunction

`define						uvm_component_utils(T)									\
	typedef uvm_component_registry #(T, `"T`") type_id	;							\
	static function string	type_name();	return `"T`"; endfunction				\
	virtual function string	get_type_name();return `"T`"; endfunction
// —————————————————————————|———————————————————————————|———————————————————————————
`endif