draw_self();
if (data.is_healing) {
    var scale = 0.8 + sin(heal_pulse_timer) * 0.1;
    var offset_y = -sprite_height / 2 - 4;

    draw_sprite_ext(spr_effect_heal, 0, x, y + offset_y, scale, scale, 0, c_lime, 1);
}
if (data.is_guarding) {
    var offset_x = 3;
    var offset_y = -sprite_height / 2;

    var scale = 0.7 + sin(shield_pulse_timer) * 0.05;

    draw_sprite_ext(spr_shield, 0, x + offset_x, y + offset_y, scale, scale, 0, c_white, 1);
}
var _x = xstart - 20;
var _y = ystart + 20;
var _w = 40;
var _h = 8;
draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * (data.hp / data.hp_total), _h, c_green, 1);
_y += _h;
_h = 4;
draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * data.charge, _h, c_aqua, 1);