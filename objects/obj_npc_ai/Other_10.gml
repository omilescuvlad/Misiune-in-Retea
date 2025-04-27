/// obj_npc_ai - User Event 0 (Puzzle Completion)
// This is called when the puzzle is solved
// Handle rewards, room transitions, etc.
switch (npc_id) {
    case "security_guard":
        // Reveal path to server room or unlock next area
        with (obj_door_server_room) {
            locked = false;
        }
        break;
        
    case "developer":
        // Reveal AI's next target
        global.next_target_revealed = true;
        break;
        
    case "network_engineer":
        // Block fake certificate and secure traffic
        global.network_secured = true;
        break;
        
    case "devops_bot":
        // Secure the login script
        global.login_secured = true;
        break;
        
    case "ceo_hologram":
        // Trigger system reboot
        global.system_reboot = true;
        
        // Prepare for game end or next chapter
        alarm[0] = room_speed * 5; // Set timer for transition
        break;
}

// Show completion notification
var completion_obj = instance_create_layer(room_width/2, room_height/2 - 100, "UI", obj_puzzle_complete);
completion_obj.text = "Puzzle Solved!";