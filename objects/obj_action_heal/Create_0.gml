action = function () {
    audio_play_sound(snd_heal, 1, false);
    var _p = obj_battle_player;
    _p.data.is_healing = true;
    _p.data.hp += _p.data.hp_total * 0.25;
    if (_p.data.hp > _p.data.hp_total) {
        _p.data.hp = _p.data.hp_total;
    }
    obj_battle_manager.player_attack(0); 
}