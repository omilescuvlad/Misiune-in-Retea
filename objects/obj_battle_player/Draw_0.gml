draw_self();

if (data.is_guarding) {
    draw_sprite(spr_shield, 0, x, y - sprite_height / 2 - 4);
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


