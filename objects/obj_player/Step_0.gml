if (room == rm_mainMenu || room == rm_helpMenu || room == rm_settingsMenu || room == rm_battle)
{
    visible = false;
    global.can_move = false;
}
else
{
    visible = true;
    global.can_move = true;
}


if(window_get_height() != winh || window_get_width() != winw){
    display_set_gui_maximize();
}

if (instance_exists(obj_dialogue)) exit;
    
if(instance_exists(obj_final_boss) && !instance_exists(obj_dialogue)){
    if (instance_exists(obj_battle_switcher)) exit;
        
    global.final_level = true;
        
    global.enemy_data = {
        sprite_index: spr_developer,
        hp_total: 25,
        damage: 2, 
        hp: 25,
    };
    
    var _switcher = instance_create_depth(0 ,0 ,0 ,obj_battle_switcher);

    _switcher.player_data = self;
    _switcher.enemy_data = global.enemy_data;
    _switcher.original_room = room;

    room_goto(rm_battle);

    global.interact = true;

    change_music(snd_lofi, snd_final_battle);
}
    

if (global.can_move) {
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
}

if(hp <= 0) {
    game_restart();
}