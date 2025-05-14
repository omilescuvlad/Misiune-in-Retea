if (guard_step_phase == 2) {
    if (x < origin_x) {
        x += 2; // revine treptat spre poziția de start
        alarm[1] = 1; // continuă revenirea
    } else {
        x = origin_x; // asigură că e exact pe poziție
        guard_step_phase = 0; // resetăm statusul de mișcare
    }
}
