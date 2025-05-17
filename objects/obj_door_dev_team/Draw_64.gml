if (instance_exists(obj_player)) {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist < 70) {
        draw_set_color(c_white);
        draw_text(32, 32, "Apasa E pentru a trece la urmatorul nivel!");
    }
}