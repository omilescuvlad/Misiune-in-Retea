// obj_door_server_room Step Event
if (!locked && distance_to_object(obj_player) < 50) {
    if (keyboard_check_pressed(ord("E"))) {
        room_goto(target_room);
    }
}