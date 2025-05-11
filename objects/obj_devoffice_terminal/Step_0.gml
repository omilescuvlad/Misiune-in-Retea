if (distance_to_object(obj_player) < interact_range) {
    if (keyboard_check_pressed(ord("E"))) {
        ui_active = true;
    }
}
