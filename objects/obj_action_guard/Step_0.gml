var _p = instance_find(obj_battle_player, 0);
if (_p == noone) exit;

if (_p.data.is_guarding) {
    image_alpha = 0.4; // feedback: deja e activ
} else {
    image_alpha = 1;
}
