if (input_active) {
    // Fundal complet negru
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

    // Dimensiuni generale terminal
    var margin = 16; // mai mic decât 32
    var tx = margin;
    var ty = margin;
    var tw = display_get_gui_width() - 2 * margin;
    var th = display_get_gui_height() - 2 * margin;

    // Bordura albă subțire
    draw_set_color(c_white);
    draw_rectangle(tx, ty, tx + tw, ty + th, true); // doar contur

    // Setare font și culoare terminal
    draw_set_font(fnt_terminal);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_lime);

    // Text principal (scroll sau ajutor, etc.)
    var wrap_width = tw - 40;
    var text_y = ty + 20;

    draw_text_ext(tx + 20, text_y, feedback_text, -1, wrap_width);
    text_y += string_height(feedback_text) + 20;

    // Prompt + input
    var prompt = ">>> " + player_input;
    draw_text(tx + 20, text_y, prompt);

    if (current_time mod 1000 < 500) {
        draw_text(tx + 20 + string_width(prompt), text_y, "_");
    }
}

draw_set_color(c_white);
