if (obj_battle_enemy.status_effect == "poison") {
    if (obj_battle_enemy.status_duration > 0) {
        obj_battle_enemy.data.hp -= 3; // 3 damage per tic
        obj_battle_enemy.status_duration -= 1;
        var fx = instance_create_layer(obj_battle_enemy.x, obj_battle_enemy.bbox_top - 16, "Instances", obj_poison_text);
    }

    if (obj_battle_enemy.status_duration <= 0) {
        obj_battle_enemy.status_effect = "none";
    }
}
alarm[1] = 30;