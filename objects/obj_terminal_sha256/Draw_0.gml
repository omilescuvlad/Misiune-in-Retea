/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4AFC32CD
/// @DnDArgument : "code" "draw_self(); // sprite terminal$(13_10)$(13_10)draw_set_font(fnt_terminal);$(13_10)$(13_10)// Dimensiuni terminal$(13_10)var w = 240;$(13_10)var h = 70;$(13_10)$(13_10)var offset_x = -w / 2;$(13_10)var offset_y = -h - 8;$(13_10)$(13_10)var tx = x + offset_x;$(13_10)var ty = y + offset_y;$(13_10)$(13_10)if (input_active) {$(13_10)    // Fundal negru + contur alb$(13_10)    draw_set_color(c_black);$(13_10)    draw_rectangle(tx, ty, tx + w, ty + h, false);$(13_10)    draw_set_color(c_white);$(13_10)    draw_rectangle(tx, ty, tx + w, ty + h, true);$(13_10)$(13_10)    draw_set_halign(fa_left);$(13_10)    draw_set_valign(fa_top);$(13_10)    draw_set_color(c_lime);$(13_10)$(13_10)    // Text input$(13_10)    draw_text(tx + 10, ty + 10, "Introdu parola: " + player_input);$(13_10)$(13_10)    // Cursor clipitor$(13_10)    if (current_time mod 1000 < 500) {$(13_10)        var cx = tx + 10 + string_width("Introdu parola: " + player_input);$(13_10)        draw_text(cx, ty + 10, "_");$(13_10)    }$(13_10)$(13_10)    draw_text(tx + 10, ty + 40, feedback_text);$(13_10)}$(13_10)$(13_10)$(13_10)"
draw_self(); // sprite terminal

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
    draw_text(tx + 10, ty + 10, "Introdu parola: " + player_input);

    // Cursor clipitor
    if (current_time mod 1000 < 500) {
        var cx = tx + 10 + string_width("Introdu parola: " + player_input);
        draw_text(cx, ty + 10, "_");
    }

    draw_text(tx + 10, ty + 40, feedback_text);
}