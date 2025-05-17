if (note_open) {
    var w = 300;
    var h = 140;
    var tx = display_get_gui_width()/2 - w/2;
    var ty = display_get_gui_height()/2 - h/2;

    draw_set_alpha(fade);

    draw_set_color(c_white);
    draw_rectangle(tx, ty, tx + w, ty + h, false);
    draw_set_color(c_black);
    draw_rectangle(tx, ty, tx + w, ty + h, true);

    draw_set_font(fnt_note);
    draw_set_halign(fa_center);
    draw_set_color(c_red);
    draw_text(tx + w/2, ty + 10, "HELP");

    draw_set_halign(fa_left);

    var msg =
        "help()\n";

    draw_text(tx + 12, ty + 35, msg);
    draw_text(tx + 12, ty + h - 20, "[ESC] pentru a inchide");

    draw_set_alpha(1);
}

draw_set_color(c_white);
