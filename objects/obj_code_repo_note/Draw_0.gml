draw_self();

if (instance_exists(obj_player)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 55) {
        var a = 0.5 + 0.5 * sin(current_time * 0.0025);
        
        draw_sprite_ext(spr_interact_E, 0, x + 16, y - 2, 0.3, 0.3, 0, c_white, a);
    }
}