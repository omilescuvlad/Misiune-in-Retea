/// Room creation code for rm_security_lobby
// Make sure the API controller exists
if (!instance_exists(obj_api_controller)) {
    instance_create_layer(0, 0, "Controllers", obj_api_controller);
}

// Create the Security Guard NPC
create_interactive_npc(320, 384, "Instances", "security_guard", spr_security_guard);