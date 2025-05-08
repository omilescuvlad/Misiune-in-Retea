/// obj_npc_ai Step Event
// Handle text typing effect
if (typing) {
    text_progress += text_speed;
    
    if (text_progress >= string_length(current_message)) {
        display_text = current_message;
        typing = false;
        
        if (!ds_queue_empty(message_queue)) {
            current_message = ds_queue_dequeue(message_queue);
            text_progress = 0;
            typing = true;
        }
    } else {
        display_text = string_copy(current_message, 1, ceil(text_progress));
    }
}

// Handle interaction cooldown
if (interaction_cooldown > 0) {
    interaction_cooldown--;
}

// Check for player proximity and keyboard input
var player = instance_nearest(x, y, obj_player);
if (player != noone && point_distance(x, y, player.x, player.y) < 50) {
    // Show interaction prompt
    // This is drawn in the Draw Event
    
    // Check for interaction key
    if (keyboard_check_pressed(ord("E"))) {
        interact();
    }
}