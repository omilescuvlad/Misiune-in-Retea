if(obj_battle_manager.enemy_turn) exit;
var _p = instance_find(obj_battle_player, 0);

if (_p == noone || !_p.data.unlocked_poison) exit;

action();
