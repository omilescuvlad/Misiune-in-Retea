if (instance_exists(obj_player) && distance_to_object(obj_player) < 25){
        if (keyboard_check_pressed(ord("E"))) {
            var input_key = get_string("Cheia fixa: ", "");
            if (input_key == valid_key) {
            room_goto_next();  // Proceed to Room 2
            } else {
                show_message("Cheia e invalida, incearca sa fii mai atent la bitii de paritate!");
            }
    }
}


