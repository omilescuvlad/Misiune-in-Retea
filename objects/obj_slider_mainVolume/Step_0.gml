//verify if mouse on buttton
if(mouse_check_button_pressed(mb_left)){
    var button_x = x + sprite_width * value;
    var button_y = y;
    var button_radius = sprite_get_width(spr_slider_button) / 2;
    if(point_in_circle(mouse_x, mouse_y, button_x, button_y, button_radius)){
        selected = true;
    }
    
}

if (!mouse_check_button(mb_left)){
    selected = false;
}

if selected {
    value = clamp((mouse_x - x) / sprite_width, 0, 1);
    
    var mainVolume = [ snd_battle, snd_beep, snd_final_battle, snd_gate_unlock, snd_guard, snd_heal, snd_heavy_hit, snd_light_hit, snd_lofi, snd_poison, snd_stun];
        for(i = 0; i < array_length(mainVolume) ; i++){
            audio_sound_gain(mainVolume[i], value, 0);
        }
    
}