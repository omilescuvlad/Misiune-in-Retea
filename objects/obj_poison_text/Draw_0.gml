draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(image_alpha);
draw_set_color(make_color_rgb(80, 255, 80)); 

draw_text(x, y, text);

// Reset
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
