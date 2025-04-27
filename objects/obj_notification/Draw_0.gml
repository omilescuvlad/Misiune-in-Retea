/// obj_notification Draw Event
draw_set_alpha(alpha);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var padding = 10;
var text_width = string_width(text) + padding * 2;
var text_height = string_height(text) + padding * 2;
draw_roundrect(x - text_width/2, y - text_height/2, x + text_width/2, y + text_height/2, false);
draw_set_color(c_white);
draw_text(x, y, text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);