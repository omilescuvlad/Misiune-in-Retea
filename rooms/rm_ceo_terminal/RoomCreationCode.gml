/// Room creation code for rm_ceo_terminal
// Make sure the API controller exists
if (!instance_exists(obj_api_controller)) {
    instance_create_layer(0, 0, "Controllers", obj_api_controller);
}

// Create the CEO Hologram NPC
create_interactive_npc(640, 360, "Instances", "ceo_hologram", spr_ceo_hologram);