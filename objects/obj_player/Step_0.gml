if (instance_exists(obj_dialogue)) exit;

var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));


var _len = _hor!=0 || _ver!=0;
var _dir = point_direction(0, 0, _hor, _ver);
_hor = lengthdir_x(_len, _dir);
_ver = lengthdir_y(_len, _dir);


move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed); 

if(_ver != 0 or _hor != 0)
{
    if(_ver > 0) sprite_index = spr_player_walk_down; 
    else if(_ver < 0) sprite_index = spr_player_walk_up;
    else if(_hor > 0) sprite_index = spr_player_walk_right;
    else if(_hor < 0) sprite_index = spr_player_walk_left;    
}
else {
    if(sprite_index == spr_player_walk_right) sprite_index = spr_player_idle_right;
    else if(sprite_index == spr_player_walk_left) sprite_index = spr_player_idle_left;
    else if(sprite_index == spr_player_walk_up) sprite_index = spr_player_idle_up;
    else if(sprite_index == spr_player_walk_down) sprite_index = spr_player_idle_down;        
}

if(hp <= 0) {
    game_restart();
}

// In obj_player Step Event
if (keyboard_check_pressed(ord("E"))) {
    // Check for nearby interaction zones
    var nearest_zone = instance_nearest(x, y, obj_interaction_zone);
    if (nearest_zone != noone && point_distance(x, y, nearest_zone.x, nearest_zone.y) < nearest_zone.interaction_range) {
        // Trigger interaction
        with (nearest_zone.target_object) {
            interact();
        }
    }
}
