if (ui_active) {
    draw_set_color(c_white);
    draw_text(100, 50, "Alege parola corecta pentru utilizatorul 'jsmith':");

    if (scr_draw_button(100, 100, 200, 40, "bluefish")) {
        if (verify_correct_password("D9%2f", "bluefish", hash_corect)) {
            show_message("Corect! Parola este bluefish.");
        } else {
            show_message("Gresit!");
        }
        ui_active = false; // închide UI-ul după alegere
    }

    if (scr_draw_button(100, 160, 200, 40, "moonlight")) {
        if (verify_correct_password("D9%2f", "moonlight", hash_corect)) {
            show_message("Corect! Parola este moonlight.");
        } else {
            show_message("Gresit!");
        }
        ui_active = false;
    }
}
