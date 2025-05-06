/// obj_npc_ai Create Event
npc_id = ""; // Set this when placing the NPC (e.g., "security_guard")
lesson_delivered = false;
conversation_history = "";
message_queue = ds_queue_create();
typing = false;
current_message = "";
display_text = "";
text_progress = 0;
text_speed = 0.5;
interaction_cooldown = 0;

// Initialize speech bubble dimensions
bubble_width = 300;
bubble_height = 150;
bubble_padding = 10;
bubble_x = x - bubble_width/2;
bubble_y = y - sprite_height - bubble_height - 20;

// Initialize NPC system if not already done
if (!variable_global_exists("api_callbacks")) {
    initialize_npc_system();
}


