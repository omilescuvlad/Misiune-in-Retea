if (guard_step_phase == 2) {
    if (x < origin_x) {
        x += 2; 
        alarm[1] = 1; 
    } else {
        x = origin_x; 
        guard_step_phase = 0; 
    }
}