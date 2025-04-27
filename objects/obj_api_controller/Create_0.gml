/// obj_api_controller Create Event
// Initialize NPC system if not already done
if (!variable_global_exists("api_callbacks")) {
    initialize_npc_system();
}