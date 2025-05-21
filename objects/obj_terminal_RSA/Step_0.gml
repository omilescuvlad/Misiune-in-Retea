if (!input_active && !rsa_solved && instance_exists(obj_player)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 70 && keyboard_check_pressed(ord("E"))) {
        input_active = true;
        feedback_text = "";
        player_input = "";
        keyboard_string = "";
        global.can_move = false;
        global.interact = true;
    }
}

if (input_active && !rsa_solved) {
    player_input = keyboard_string;

if (keyboard_check_pressed(vk_enter)) {
    feedback_text = scr_parse_command(player_input);

    keyboard_string = "";
    player_input = "";
}


    // ESC – iesire (permite iesirea si dupa match_found)
    if (input_active && keyboard_check_pressed(vk_escape)) {
    input_active = false;
    player_input = "";
    feedback_text = "";
    keyboard_string = "";
    global.can_move = true;
    global.interact = false;
}
}
