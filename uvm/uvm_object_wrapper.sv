`ifndef					UVM_OBJECT_WRAPPER_SV
`define					UVM_OBJECT_WRAPPER_SV
// —————————————————————————|———————————————————————————|———————————————————————————
// ————————————————————————————————————————————————————————— uvm - uvm_object_wrapper
// —————————————————————————————————————————————————————————————————————————————————
virtual class			uvm_object_wrapper				;
// —————————————————————————————————————————————————————
// —————————————————————————————————————————————————————
// ————————— create_object(string): uvm_object
// —————————————————————————————————————————————————————
pure virtual function uvm_object create_object			(
	string					name
)														;
// —————————————————————————————————————————————————————
// ————————— create_component(string, uvm_component): uvm_component
// —————————————————————————————————————————————————————
pure virtual function uvm_component create_component	(
	string					name						,
	uvm_component			parent
)														;
// —————————————————————————————————————————————————————
// ————————— get_type_name(): string
// —————————————————————————————————————————————————————
pure virtual function string get_type_name				(
)														;
// —————————————————————————————————————————————————————
endclass
// —————————————————————————|———————————————————————————|———————————————————————————
`endif