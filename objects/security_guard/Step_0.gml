/// obj_npc_ai Step Event
// Handle text typing effect

// În Step Event al NPC-ului
var dist = distance_to_object(obj_player);
if (dist < 50 && keyboard_check_pressed(vk_space)) {
    show_debug_message("Dialog activat");
    // Apelează funcția de interacțiune
    interact();
}

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
