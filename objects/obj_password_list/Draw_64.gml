// 📌 Draw GUI Event:
draw_set_font(fnt_terminal_mistake);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var w = 400;
var h = 220;
var tx = display_get_gui_width()/2 - w/2;
var ty = display_get_gui_height()/2 - h/2;

if (input_active) {
    // Overlay inchis pe fundal
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    // Fundal terminal
    draw_set_color(c_black);
    draw_rectangle(tx, ty, tx + w, ty + h, false);
    draw_set_color(c_white);
    draw_rectangle(tx, ty, tx + w, ty + h, true);

    // Text principal
    draw_set_color(c_lime);
    draw_text(tx + 20, ty + 10, "passwords.txt:");

    for (var i = 0; i < array_length(password_list); i++) {
        draw_text(tx + 20, ty + 35 + i * 20, "- " + password_list[i]);
    }

    draw_text(tx + 20, ty + h - 30, "[ESC] pentru a iesi");
} 