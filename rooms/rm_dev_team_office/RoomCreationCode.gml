/// Room creation code for rm_dev_team_office
// Make sure the API controller exists
if (!instance_exists(obj_api_controller)) {
    instance_create_layer(0, 0, "Controllers", obj_api_controller);
}

// Create the Developer NPC
create_interactive_npc(480, 320, "Instances", "developer", spr_developer);