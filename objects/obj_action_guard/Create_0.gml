action = function () {
    var _p = obj_battle_player;
    _p.data.is_guarding = true;
    _p.guard_step_phase = 1; 
    audio_play_sound(snd_guard, 1, false);
    var label = instance_create_layer(_p.x, _p.y - 12, "Instances", obj_guard_label);
    label.player = _p;

    obj_battle_manager.player_attack(0); 
}