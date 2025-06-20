if (!input_active && !match_found && instance_exists(obj_player)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 35 && keyboard_check_pressed(ord("E"))) {
        input_active = true;
        keyboard_string = "";
        player_input = "";
        feedback_text = "";
        global.can_move = false;
        global.interact = true;
    }
}

if (input_active && !match_found) {
    if (keyboard_check_pressed(vk_up)) {
        selected_mode = (selected_mode + 2) mod 3;
        audio_play_sound(snd_beep, 0, false);
    }
    if (keyboard_check_pressed(vk_down)) {
        selected_mode = (selected_mode + 1) mod 3;
        audio_play_sound(snd_beep, 0, false);
    }
    if (keyboard_string != player_input) {
        audio_play_sound(snd_beep, 0, false);
    }
    player_input = keyboard_string;
    if (keyboard_check_pressed(vk_enter)) {
        var hash_test = "";
        switch (selected_mode) {
            case 0: hash_test = string_sha256(player_input); break;
            case 1: hash_test = string_sha256(player_input + salt); break;
            case 2: hash_test = string_sha256(salt + player_input); break;
        }
        if (hash_test == target_hash) {
            feedback_text = "Ai identificat implementarea corecta!";
            match_found = true;
            global.puzzle2_solved = true;
        } else {
            feedback_text = "Nu se potriveste. Incearca alta combinatie.";
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