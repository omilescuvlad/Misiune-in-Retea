if (!input_active && !match_found && instance_exists(obj_player)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 70 && keyboard_check_pressed(ord("E"))) {
        input_active = true;
        player_input = "";
        feedback_text = "";
        keyboard_string = "";
        global.can_move = false;
        global.interact = true;
    }
}

if (input_active && !match_found) {
    if (keyboard_string != player_input) {
        audio_play_sound(snd_beep, 0, false);
    }

    player_input = keyboard_string;

    if (keyboard_check_pressed(vk_enter)) {
        if (player_input == valid_key) {
            feedback_text = "Cheie corecta!";
            match_found = true;
            global.puzzle1_solved = true;
        } else {
            feedback_text = "Gresit! Incearca alta cheie.";
        }

        keyboard_string = "";
        player_input = "";
    }
}

    if (input_active && keyboard_check_pressed(vk_escape)) {
    input_active = false;
    player_input = "";
    feedback_text = "";
    keyboard_string = "";
    global.can_move = true;
    global.interact = false;
}