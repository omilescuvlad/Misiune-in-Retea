function scr_draw_button(_x, _y, _w, _h, _label) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var hover = (mx >= _x && mx <= _x + _w && my >= _y && my <= _y + _h);

    draw_set_color(c_gray);
    draw_rectangle(_x, _y, _x + _w, _y + _h, false);

    draw_set_color(c_white);
    draw_text(_x + 10, _y + 10, string(_label));

    return (hover && mouse_check_button_pressed(mb_left));
}
