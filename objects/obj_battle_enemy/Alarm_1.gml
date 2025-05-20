if(global.final_level == false){
    if (status_effect == "stun") {
        x = xstart;
        alarm[1] = -1;
        exit;
    }
    
    x += 2;
    
    if (x < xstart) {
        alarm[1] = 1;
    }
}
else{
    // Definește poziția inițială
if (!variable_global_exists("boss_initial_x")) {
    global.boss_initial_x = x;
}

// Dacă bossul este în stare de "stun", nu face nimic
if (status_effect == "stun") {
    status_duration -= 1;
    show_debug_message("[STUNNED] Final Boss skips turn.");
    if (status_duration <= 0) {
        status_effect = "none";
    }
    enemy_turn = 0;
    exit;
}

// Dacă bossul încarcă atacul special
if (charging_ult) {
    if (ult_charge_turns == 0) {
        // Execută atacul final
        if (obj_battle_player.data.is_guarding) {
            show_debug_message("[ULT BLOCKED] Player a blocat atacul devastator!");
        } else {
            show_debug_message("[ULT HIT] Player a fost lovit de atacul devastator!");
            obj_battle_player.data.hp = 0; // Instant kill
        }
        charging_ult = false;
        // Revine la poziția inițială
        x = global.boss_initial_x;
    } else {
        show_debug_message("[ULT WARNING] Bossul încarcă un atac devastator... " + string(ult_charge_turns) + " runde rămase!");
        ult_charge_turns -= 1;
    }
} else {
    // Decide dacă folosește atac normal sau începe să încarce ultimata
    var roll = irandom(100);
    if (roll < 100) {
        charging_ult = true;
        ult_charge_turns = 2;
        show_debug_message("[CHARGE START] Bossul începe să încarce atacul final!");
        // Face un pas înainte
        x += 20;
        // Creează indicatorul vizual
        instance_create_layer(x, y - sprite_height, "Instances", obj_ult_warning);
    } else {
        // Atac normal
        x += 20; // Pas înainte
        var _enemy_damage = data.damage * random_range(0.7, 1.2);
        if (obj_battle_player.data.is_guarding) {
            _enemy_damage *= 0.1;
            obj_battle_player.data.is_guarding = false;
            show_debug_message("[GUARD] Playerul a redus damage-ul la: " + string(_enemy_damage));
        }
        obj_battle_player.data.hp -= _enemy_damage;
        show_debug_message("[ATTACK] Bossul a dat damage: " + string(_enemy_damage));
        x = global.boss_initial_x; // Revine la poziția inițială
    }
}

enemy_turn = 0;

if (obj_battle_manager.check_for_end()) {
    alarm[2] = 60;
}
}

