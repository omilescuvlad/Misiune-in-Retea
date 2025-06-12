if (guard_step_phase == 1) {
    if (x > origin_x - 20) {
        x -= 2;
    } else {
        x = origin_x - 20;
        guard_step_phase = 2;
        alarm[1] = 20;
    }
}
if (guard_step_phase == 0) {
    if (attack_step_phase == 1) {
        if (x < origin_x + 20) {
            x += 2;
        } else {
            x = origin_x + 20;
            attack_step_phase = 2;
            alarm[2] = 20;
        }
    }
}
if (data.is_guarding) {
    shield_pulse_timer += 0.1;
} else {
    shield_pulse_timer = 0;
}
if (data.is_healing) {
    heal_pulse_timer += 0.03;
} else {
    heal_pulse_timer = 0;
}