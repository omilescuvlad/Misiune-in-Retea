data = obj_battle_switcher.player_data;
data.crit_chance = 15;
data.is_guarding = false;
origin_x = x;
guard_step_phase = 0;
attack_step_phase = 0;



if (data.unlocked_poison) {
    if (data.unlocked_poison) {
    var button = instance_create_layer(100, 500, "Instances", obj_action_poison);
    button.sprite_index = spr_box; // sprite vizibil de test (îl ai sigur deja)
    }
    show_debug_message("unlocked_poison: " + string(data.unlocked_poison));
}
