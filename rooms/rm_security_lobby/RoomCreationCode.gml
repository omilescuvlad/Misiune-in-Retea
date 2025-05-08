/// Room creation code for rm_security_lobby
// Make sure the API controller exists
if (!instance_exists(obj_api_controller)) {
    instance_create_layer(0, 0, "Controllers", obj_api_controller);
}


create_interactive_npc(256, 222, "Instances", "security_guard", spr_security_guard);