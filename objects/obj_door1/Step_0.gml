var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist < 25 && keyboard_check_pressed(ord("E")) && global.puzzle1_solved == true) {
        room_goto(rm_dev_team_office);
    }

