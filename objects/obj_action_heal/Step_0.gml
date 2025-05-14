var _p = instance_find(obj_battle_player, 0);
if (_p == noone) exit;

if (_p.data.unlocked_heal) {
    image_alpha = 1;
    visible = true;
} else {
    visible = false;
}
