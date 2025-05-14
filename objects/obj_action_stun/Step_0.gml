var _p = instance_find(obj_battle_player, 0);
if (_p == noone) exit;

if (_p.data.unlocked_stun) {
    visible = true;

    if (_p.data.charge >= 1) {
        image_alpha = 1; // activ
    } else {
        image_alpha = 0.4; // semi-transparent (greyed out)
    }
} else {
    visible = false; // nu e deblocat deloc (sub lvl 3)
}
