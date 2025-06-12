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
else {
    if (!variable_global_exists("boss_initial_x")) {
        global.boss_initial_x = x;
    }
    if (status_effect == "stun") {
        status_duration -= 1;
        if (status_duration <= 0) {
            status_effect = "none";
        }
        enemy_turn = 0;
        exit;
    }
    
    if (charging_ult) {
        if (ult_charge_turns == 0) {
            if (!obj_battle_player.data.is_guarding) {
                obj_battle_player.data.hp = 0; // Instant kill
                game_restart();
            } 
            charging_ult = false;
            x = global.boss_initial_x; 
        }
        else {
            ult_charge_turns -= 1;
            x = global.boss_initial_x - 20;
        }
    } else {
        var roll = irandom(100);
        if (roll < 30) {
            charging_ult = true;
            ult_charge_turns = 2;
            x = global.boss_initial_x - 20;
            instance_create_layer(x, y - sprite_height, "Instances", obj_ult_warning);
        } else {
            x = global.boss_initial_x - 20;
            
            var enemy_damage = data.damage * random_range(0.7, 1.2);
            if (obj_battle_player.data.is_guarding) {
                enemy_damage *= 0.1;
                obj_battle_player.data.is_guarding = false;
            }
            obj_battle_player.data.hp -= enemy_damage;
            alarm[3] = 30; 
        }
    }
    
    enemy_turn = 0;
    if (obj_battle_manager.check_for_end()) {
        alarm[2] = 60;
    }
}

