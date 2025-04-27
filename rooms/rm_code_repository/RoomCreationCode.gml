/// Room creation code for rm_code_repository
// Make sure the API controller exists
if (!instance_exists(obj_api_controller)) {
    instance_create_layer(0, 0, "Controllers", obj_api_controller);
}

// Create the DevOps Bot NPC
create_interactive_npc(400, 350, "Instances", "devops_bot", spr_devops_bot);