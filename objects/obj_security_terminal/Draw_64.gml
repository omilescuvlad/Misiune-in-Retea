// draw gui
draw_set_font(fnt_terminal);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (input_active) {
    // FUNDAL NEGRU complet
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

    // ZONA DE TERMINAL (border alb subtire)
    var margin = 16;
    var tx = margin;
    var ty = margin;
    var tw = display_get_gui_width() - 2 * margin;
    var th = display_get_gui_height() - 2 * margin;

    draw_set_color(c_white);
    draw_rectangle(tx, ty, tx + tw, ty + th, true); // contur alb

    // TEXT TERMINAL
    draw_set_color(c_lime);
    var wrap_width = tw - 40;
    var text_y = ty + 20;

    draw_text(tx + 20, text_y, "Cheie corupta: " + corrupted_key);
    text_y += 30;

    draw_text(tx + 20, text_y, "Introdu cheia: " + player_input);
    if (current_time mod 1000 < 500) {
        var cx = tx + 20 + string_width("Introdu cheia: " + player_input);
        draw_text(cx, text_y, "_");
    }

    text_y += 30;
    draw_text_ext(tx + 20, text_y, feedback_text, -1, wrap_width);
    text_y += 60;

    draw_text(tx + 20, text_y, "[Enter] test  [ESC] iesire");
}

// În afara terminalului, ca fallback
draw_set_color(c_white);
