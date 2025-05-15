draw_set_font(fnt_terminal);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var w = 500;
var h = 200;
var tx = display_get_gui_width()/2 - w/2;
var ty = display_get_gui_height()/2 - h/2;

if (input_active) {
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    draw_set_color(c_black);
    draw_rectangle(tx, ty, tx + w, ty + h, false);
    draw_set_color(c_white);
    draw_rectangle(tx, ty, tx + w, ty + h, true);

    draw_set_color(c_lime);
    draw_text(tx + 20, ty + 10, "Cheie corupta: " + corrupted_key);
    draw_text(tx + 20, ty + 40, "Introdu cheia: " + player_input);

    if (current_time mod 1000 < 500) {
        var cx = tx + 20 + string_width("Introdu cheia: " + player_input);
        draw_text(cx, ty + 40, "_");
    }

    draw_text(tx + 20, ty + 70, feedback_text);
    draw_text(tx + 20, ty + 110, "[Enter] test  [ESC] iesire");
} else if (!match_found && instance_exists(obj_player)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 50) {
        draw_set_color(c_green);
        draw_text(x + 13, y - 15, "E");
    }
}