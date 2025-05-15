if (note_open) {
    var w = 300;
    var h = 140;
    var tx = display_get_gui_width()/2 - w/2;
    var ty = display_get_gui_height()/2 - h/2;

    draw_set_alpha(fade);

    draw_set_color(c_white);
    draw_rectangle(tx, ty, tx + w, ty + h, false);
    draw_set_color(c_black);
    draw_rectangle(tx, ty, tx + w, ty + h, true);

    draw_set_font(fnt_note);
    draw_set_halign(fa_center);
    draw_set_color(c_red);
    draw_text(tx + w/2, ty + 10, "NOTE");

    draw_set_color(c_black);
    draw_set_halign(fa_left);

    var msg =
        "La hashing nu conteaza doar.\n" +
        "functia. Conteaza si ORDINEA\n" +
        "in care o aplici. Ai grija daca\n" +
        "salt-ul e pus inainte sau dupa parola...\n\n" +
        "(Apropo, salt-ul standard incepe mereu cu '@')";

    draw_text(tx + 12, ty + 35, msg);
    draw_text(tx + 12, ty + h - 20, "[ESC] pentru a inchide");

    draw_set_alpha(1);
}
else if (instance_exists(obj_player)) {

    var view_x = camera_get_view_x(view_camera[0]);
    var view_y = camera_get_view_y(view_camera[0]);

    var ex = x - view_x;
    var ey = y - view_y - sprite_height / 2 - 10;

    if (point_distance(x, y, obj_player.x, obj_player.y) < 55) {
        draw_set_color(c_lime);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(fnt_note);
        draw_text(ex, ey, "E");
    }
}
