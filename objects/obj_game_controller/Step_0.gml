if (room == rm_security_lobby && global.puzzle_solved[? "security_guard"]) {
    // Check if player is near the door to the next room
    var door = instance_nearest(obj_player.x, obj_player.y, obj_door_server_room);
    if (door != noone && point_distance(obj_player.x, obj_player.y, door.x, door.y) < 32) {
        if (keyboard_check_pressed(ord("E"))) {
            room_goto(rm_dev_team_office);
        }
    }
}