// 🛡️ Guard: pas în spate și revenire
if (guard_step_phase == 1) {
    if (x > origin_x - 20) {
        x -= 2;
    } else {
        x = origin_x - 20;
        guard_step_phase = 2;
        alarm[1] = 20;
    }
}

// 🗡️ Atac: pas în față și revenire
if (guard_step_phase == 0) { // se execută doar dacă guard nu e în desfășurare
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

