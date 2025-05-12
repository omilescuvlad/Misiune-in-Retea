/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5C313D82
/// @DnDArgument : "code" "// Activează terminalul cand esti aproape si apeși E$(13_10)if (!input_active && !match_found && instance_exists(obj_player)) {$(13_10)    var dist = point_distance(x, y, obj_player.x, obj_player.y);$(13_10)    if (dist < 25 && keyboard_check_pressed(ord("E"))) {$(13_10)        input_active = true;$(13_10)        player_input = "";$(13_10)        feedback_text = "";$(13_10)        keyboard_string = "";$(13_10)    }$(13_10)}$(13_10)$(13_10)// Verificare parola$(13_10)if (input_active && !match_found) {$(13_10)    if (keyboard_string != player_input) {$(13_10)        audio_play_sound(snd_beep, 0, false);$(13_10)    }$(13_10)$(13_10)    player_input = keyboard_string;$(13_10)$(13_10)    if (keyboard_check_pressed(vk_enter)) {$(13_10)        var hash_test = string_sha256(salt + player_input);$(13_10)$(13_10)        if (hash_test == target_hash) {$(13_10)            feedback_text = "Parola corecta!";$(13_10)            match_found = true;$(13_10)        } else {$(13_10)            feedback_text = "Gresit! Incearca alta parola";$(13_10)        }$(13_10)$(13_10)        keyboard_string = "";$(13_10)        player_input = "";$(13_10)    }$(13_10)}$(13_10)$(13_10)// ESC => iesire din terminal$(13_10)if (input_active && keyboard_check_pressed(vk_escape)) {$(13_10)    input_active = false;$(13_10)    player_input = "";$(13_10)    feedback_text = "";$(13_10)    keyboard_string = "";$(13_10)}$(13_10)"
// Activează terminalul cand esti aproape si apeși E
if (!input_active && !match_found && instance_exists(obj_player)) {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist < 25 && keyboard_check_pressed(ord("E"))) {
        input_active = true;
        player_input = "";
        feedback_text = "";
        keyboard_string = "";
    }
}

// Verificare parola
if (input_active && !match_found) {
    if (keyboard_string != player_input) {
        audio_play_sound(snd_beep, 0, false);
    }

    player_input = keyboard_string;

    if (keyboard_check_pressed(vk_enter)) {
        var hash_test = string_sha256(salt + player_input);

        if (hash_test == target_hash) {
            feedback_text = "Parola corecta!";
            match_found = true;
        } else {
            feedback_text = "Gresit! Incearca alta parola";
        }

        keyboard_string = "";
        player_input = "";
    }
}

// ESC => iesire din terminal
if (input_active && keyboard_check_pressed(vk_escape)) {
    input_active = false;
    player_input = "";
    feedback_text = "";
    keyboard_string = "";
}