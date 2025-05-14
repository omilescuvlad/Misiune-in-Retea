action = function () {
    var _p = obj_battle_player;

    // activează efectul vizual
    _p.data.is_healing = true;

    // heal efectiv
    _p.data.hp += _p.data.hp_total * 0.25;
    if (_p.data.hp > _p.data.hp_total) {
        _p.data.hp = _p.data.hp_total;
    }

    // închide tura
    show_debug_message("[HEAL] Player healed 25%");
    obj_battle_manager.player_attack(0); // damage = 0, dar închide tura
}
