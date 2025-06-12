function change_music(current_music, new_music) {
    if (current_music != new_music) {
        audio_stop_sound(current_music);
        current_music = new_music;
        audio_play_sound(current_music, 1, true);
    }
}