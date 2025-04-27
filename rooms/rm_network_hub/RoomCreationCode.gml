/// Room creation code for rm_network_hub
// Make sure the API controller exists
if (!instance_exists(obj_api_controller)) {
    instance_create_layer(0, 0, "Controllers", obj_api_controller);
}

// Create the Network Engineer NPC
create_interactive_npc(540, 400, "Instances", "network_engineer", spr_network_engineer);