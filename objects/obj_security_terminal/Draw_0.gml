draw_self(); 

draw_set_font(fnt_terminal);

// Dimensiuni terminal
var w = 240;
var h = 70;

var offset_x = -w / 2;
var offset_y = -h - 8;

var tx = x + offset_x;
var ty = y + offset_y;

if (input_active) {
    // Fundal negru + contur alb
    draw_set_color(c_black);
    draw_rectangle(tx, ty, tx + w, ty + h, false);
    draw_set_color(c_white);
    draw_rectangle(tx, ty, tx + w, ty + h, true);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_lime);

    // Text input
    draw_text(tx + 10, ty + 10, "Introdu cheia: " + player_input);

    // Cursor clipitor
    if (current_time mod 1000 < 500) {
        var cx = tx + 10 + string_width("Introdu cheia: " + player_input);
        draw_text(cx, ty + 10, "_");
    }

    draw_text(tx + 10, ty + 40, feedback_text);
}

if (!input_active && !match_found && instance_exists(obj_player)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 35) {
        draw_set_color(c_yellow);
        draw_text(x - 110, y - 20, "Apasa E pentru a accesa terminalul.");
    }
}



