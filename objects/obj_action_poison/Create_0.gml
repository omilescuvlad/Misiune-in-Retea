action = function () {
    obj_battle_manager.apply_poison(3);
    audio_play_sound(snd_poison, 1, false);
    obj_battle_manager.player_attack(1);
}