if (attack_step_phase == 2) {
    if (x > origin_x) {
        x -= 2;
        alarm[2] = 1;
    } else {
        x = origin_x;
        attack_step_phase = 0;
    }
}
