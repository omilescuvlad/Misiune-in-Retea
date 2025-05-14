var _p = instance_find(obj_battle_player, 0);

if (_p != noone && _p.data.unlocked_poison) {
    image_alpha = 1;
    visible = true;
} else {
    image_alpha = 0.2;
    visible = false;
}
