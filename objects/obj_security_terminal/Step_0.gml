if (instance_exists(obj_player) && distance_to_object(obj_player) < 25){
        if (keyboard_check_pressed(ord("E"))) {
            var input_key = get_string("INTRODU CHEIA: ", "");
            if (input_key == valid_key) {
            show_message("T3RM1N4L UNL0CKKKD");
            global.puzzle1_solved = true; 
            }
            else{
                show_message("1NV4L1D K3Y");
            }
    }
}


