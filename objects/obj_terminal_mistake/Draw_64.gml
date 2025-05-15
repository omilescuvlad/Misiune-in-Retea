draw_set_font(fnt_terminal_mistake);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var w = 700;
var h = 350;
// Pozitionare terminal mereu pe ecran
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);

var tx = display_get_gui_width()/2 - w/2;
var ty = display_get_gui_height()/2 - h/2;

if (input_active) {
    // Fundal întunecat semi-transparent pe tot ecranul
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    draw_set_color(c_black);
    draw_rectangle(tx, ty, tx + w, ty + h, false);
    draw_set_color(c_white);
    draw_rectangle(tx, ty, tx + w, ty + h, true);

    draw_set_color(c_lime);
    draw_text(tx + 20, ty + 10, "Salt: " + salt);
    draw_text(tx + 20, ty + 35, "Hash compromis: " + string_copy(target_hash, 1, 24) + "...");

    var modes = [
        "0 - SHA256(parola)",
        "1 - SHA256(parola + salt)",
        "2 - SHA256(salt + parola)"
    ];

    for (var i = 0; i < array_length(modes); i++) {
    var prefix = (i == selected_mode) ? "-> " : "   ";

    // Colorare: verde daca e modul corect
    if (i == mode_correct) {
        draw_set_color(c_green);
    } else {
        draw_set_color(c_lime);
    }

    draw_text(tx + 20, ty + 60 + i * 20, prefix + modes[i]);
    }

    draw_set_color(c_lime); // revenim la culoarea lime implicita a terminalului
    
    draw_text(tx + 20, ty + 130, "Parola: " + player_input);
    if (current_time mod 1000 < 500) {
        var cx = tx + 20 + string_width("Parola: " + player_input);
        draw_text(cx, ty + 130, "_");
    }

    draw_text(tx + 20, ty + 200, feedback_text);
    draw_text(tx + 20, ty + 250, "[Arrow Keys] mode  [Enter] test  [Esc] iesire");
    
    draw_set_alpha(1);
}