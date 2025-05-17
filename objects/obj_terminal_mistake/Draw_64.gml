draw_set_font(fnt_terminal_mistake);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (input_active) {
    // FUNDAL COMPLET NEGRU
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

    // DIMENSIUNI + BORDER
    var margin = 16;
    var tx = margin;
    var ty = margin;
    var tw = display_get_gui_width() - 2 * margin;
    var th = display_get_gui_height() - 2 * margin;

    draw_set_color(c_white);
    draw_rectangle(tx, ty, tx + tw, ty + th, true); // contur alb subțire

    // TEXT: verde stil terminal
    draw_set_color(c_lime);
    var text_y = ty + 20;

    draw_text(tx + 20, text_y, "Salt: " + salt);
    text_y += 25;
    draw_text(tx + 20, text_y, "Hash compromis: " + string_copy(target_hash, 1, 24) + "...");
    text_y += 35;

    var modes = [
        "0 - SHA256(parola)",
        "1 - SHA256(parola + salt)",
        "2 - SHA256(salt + parola)"
    ];

    for (var i = 0; i < array_length(modes); i++) {
        var prefix = (i == selected_mode) ? "-> " : "   ";
        if (i == mode_correct) {
            draw_set_color(c_green); // verde pentru modul corect
        } else {
            draw_set_color(c_lime);
        }
        draw_text(tx + 20, text_y, prefix + modes[i]);
        text_y += 20;
    }

    draw_set_color(c_lime); // resetam culoarea
    text_y += 20;
    draw_text(tx + 20, text_y, "Parola: " + player_input);

    if (current_time mod 1000 < 500) {
        var cx = tx + 20 + string_width("Parola: " + player_input);
        draw_text(cx, text_y, "_");
    }

    text_y += 40;
    draw_text(tx + 20, text_y, feedback_text);

    text_y += 50;
    draw_text(tx + 20, text_y, "[Arrow Keys] mode  [Enter] test  [Esc] iesire");
}

draw_set_color(c_white);
