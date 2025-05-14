// Dacă enemy e STUNNED, oprește tura înainte de damage
if (obj_battle_enemy.status_effect == "stun") {
    obj_battle_enemy.status_duration -= 1;
    show_debug_message("[STUNNED] Enemy skips turn.");

    if (obj_battle_enemy.status_duration <= 0) {
        obj_battle_enemy.status_effect = "none";
    }

    enemy_turn = 0;
    exit;
}

// Dacă NU e stunned, aplică damage normal
var _enemy_damage = obj_battle_enemy.data.damage * random_range(0.7, 1.2);

// Aplică efectul de Guard dacă este activ
if (obj_battle_player.data.is_guarding) {
    _enemy_damage *= 0.1;
    obj_battle_player.data.is_guarding = false;
    show_debug_message("[GUARD ACTIVE] Damage reduced to: " + string(_enemy_damage));
}

obj_battle_player.data.hp -= _enemy_damage;

enemy_turn = 0;

if (check_for_end()) {
    alarm[2] = 60;
}
