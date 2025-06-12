if (instance_exists(obj_player)) {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist < 55 && keyboard_check_pressed(ord("E")) && !note_open) {
        note_open = true;
        global.can_move = false;
        global.interact = true;
        keyboard_clear(true);
    }

    if (note_open && keyboard_check_pressed(vk_escape)) {
        note_open = false;
        global.can_move = true;
        global.interact = false;
        keyboard_clear(true);
    }

    if (note_open) {
        fade = clamp(fade + 0.05, 0, 1);
    } else {
        fade = clamp(fade - 0.1, 0, 1); 
    }
}
