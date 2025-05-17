action = function () {
    obj_battle_manager.player_attack(obj_battle_player.data.damage); 
    audio_play_sound(snd_light_hit, 1, false);
}