//  Step Event:
if (instance_exists(obj_player)) {
    if (!input_active && point_distance(x, y, obj_player.x, obj_player.y) < 40) {
        if (keyboard_check_pressed(ord("E"))) {
            input_active = true;
            global.can_move = false;
            global.interact = true;
            keyboard_clear(true);
        }
    }

    if (input_active && keyboard_check_pressed(vk_escape)) {
        input_active = false;
        global.can_move = true;
        global.interact = false;
        keyboard_clear(true);
    }
}