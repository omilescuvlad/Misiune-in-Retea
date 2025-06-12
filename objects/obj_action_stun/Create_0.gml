action = function () {
    audio_play_sound(snd_stun, 1, false);
    obj_battle_enemy.status_effect = "stun";
    obj_battle_enemy.status_duration = 1;

    var label = instance_create_layer(obj_battle_enemy.x, obj_battle_enemy.bbox_top - 12, "Instances", obj_stun_label);
    label.enemy = obj_battle_enemy;


    obj_battle_player.data.charge = 0; 
    obj_battle_manager.player_attack(1.2);
}