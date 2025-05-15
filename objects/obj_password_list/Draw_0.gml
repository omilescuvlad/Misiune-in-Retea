draw_self();
if (point_distance(x, y, obj_player.x, obj_player.y) < 35) {
        draw_set_color(c_green);
        draw_set_font(fnt_E);
        draw_text(x + 13, y - 14, "E");
}
