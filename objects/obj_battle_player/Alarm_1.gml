if (guard_step_phase == 2) {
    if (x < origin_x) {
        x += 2; // revine treptat spre pozitia de start
        alarm[1] = 1; // continua revenirea
    } else {
        x = origin_x; // asigura ca e exact pe pozitie
        guard_step_phase = 0; // resetam statusul de miscare
    }
}
