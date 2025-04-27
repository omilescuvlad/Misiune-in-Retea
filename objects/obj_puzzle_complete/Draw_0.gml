/// obj_puzzle_complete Draw Event
draw_set_alpha(alpha);
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(x, y, text, scale, scale, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);