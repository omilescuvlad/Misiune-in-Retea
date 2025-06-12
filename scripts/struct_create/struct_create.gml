function struct_create(argument0) {
	var s = instance_create_depth(0,0,0,argument0);
	instance_deactivate_object(s);
	return s;
}
