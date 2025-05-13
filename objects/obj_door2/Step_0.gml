// Dacă puzzle-ul e rezolvat și poarta nu e deja deblocată
if (!unlocked && obj_terminal_sha256.match_found) {
    unlocked = true;
    solid = false;
    sprite_index = spr_gate_open;
    audio_play_sound(snd_gate_unlock, 1, false);
}

// Permite trecerea și schimbă camera dacă jucătorul apasă E
if (unlocked && instance_exists(obj_player)) {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist < 80 && keyboard_check_pressed(ord("E"))) {
        room_goto(rm_network_hub);
    }
}
