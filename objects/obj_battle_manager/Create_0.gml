enemy_turn = 0; 
damage_to_enemy = 0;

apply_poison = function(_turns) {
    obj_battle_enemy.status_effect = "poison";
    obj_battle_enemy.status_duration = _turns;
    var icon = instance_create_layer(obj_battle_enemy.x, obj_battle_enemy.y - 40, "Instances", obj_poison_icon);
    icon.enemy = obj_battle_enemy;
}


player_attack = function (_damage) {
    var is_crit = (random(100) < obj_battle_player.data.crit_chance);
    if (is_crit) {
        _damage *= 2;
        instance_create_layer(obj_battle_enemy.x, obj_battle_enemy.y - 30, "Effects", obj_crit_text);
    }

    damage_to_enemy = _damage;
    enemy_turn = 1;
    alarm[0] = 40;

    if (obj_battle_player.guard_step_phase == 0) {
        obj_battle_player.attack_step_phase = 1;
    } 
}


check_for_end = function () {
    return (obj_battle_enemy.data.hp <= 0 || obj_battle_player <= 0);
}