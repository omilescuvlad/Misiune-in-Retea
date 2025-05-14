if (obj_battle_enemy.status_effect == "poison") {
    if (obj_battle_enemy.status_duration > 0) {
        obj_battle_enemy.data.hp -= 3; // doar 3 damage per tic
        obj_battle_enemy.status_duration -= 1;
        // text visual "-3 Posion"
        var fx = instance_create_layer(obj_battle_enemy.x, obj_battle_enemy.bbox_top - 16, "Instances", obj_poison_text);

        show_debug_message("[POISON] Enemy takes 3 poison damage. Turns left: " + string(obj_battle_enemy.status_duration));
    }

    if (obj_battle_enemy.status_duration <= 0) {
        obj_battle_enemy.status_effect = "none";
        show_debug_message("[POISON END] Status effect removed.");
    }
}


alarm[1] = 30;