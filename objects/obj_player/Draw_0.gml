draw_shadow(1);

draw_self();

// Camera offset
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

// Pozitia barelor pe ecran
var _dx = _cam_x + 5;
var _dy = _cam_y + 5;
var _barw = 48;
var _barh = 10;

// Setari font si aliniere
draw_set_font(fnt_stats);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Healthbar
var _health_barw = _barw * (hp / hp_total);

draw_sprite_stretched(spr_box, 0, _dx, _dy, _barw, _barh);
draw_sprite_stretched_ext(spr_box, 1, _dx, _dy, _health_barw, _barh, c_red, 0.6);
draw_text(_dx + _barw / 2, _dy + _barh / 2, "HP");

// XP Bar
var _xp_barw = _barw * (xp / xp_require);
_dy += _barh + 8;

draw_sprite_stretched(spr_box, 0, _dx, _dy - 5, _barw, _barh);
draw_sprite_stretched_ext(spr_box, 1, _dx, _dy - 5, _xp_barw, _barh, c_blue, 0.6);
draw_text(_dx + _barw / 2, _dy - 5  + _barh / 2, "LEVEL " + string(level));

// Reset aliniere
draw_set_halign(fa_left);
draw_set_valign(fa_top);
