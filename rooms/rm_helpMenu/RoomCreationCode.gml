if(instance_exists(obj_controls)){
    instance_destroy(obj_controls);
} else{
    instance_create_layer(room_width, room_height, "Instances", obj_controls);
}