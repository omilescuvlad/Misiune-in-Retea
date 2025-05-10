if (instance_exists(obj_player) && distance_to_object(obj_player) < 25){
        if (keyboard_check_pressed(ord("E"))) {
            var input_key = get_string("Cheia valida: ", "");
            if (input_key == valid_key) {
            show_message("Ai dat lovitura! S-a deschis usa pentru a ajunge in biroul developerilor!");
            global.puzzle1_solved = true; 
            }
            else{
                show_message("Incearca din nou!");
            }
    }
}


