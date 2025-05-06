/// obj_text_input Draw Event
if (visible) {
    // Darken screen background
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);

    // Draw input box
    var box_width = 600;
    var box_height = 100;
    var box_x = (room_width - box_width) / 2;
    var box_y = (room_height - box_height) / 2;

    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
    
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, true);

    // Draw input prompt
    draw_set_color(c_black);
    draw_set_font(fnt_dialogue);
    draw_text(box_x + 10, box_y + 10, "What would you like to ask?");

    // Draw input text with cursor
    var cursor = (current_time % 1000 < 500) ? "|" : "";
    draw_text(box_x + 10, box_y + 40, input_text + cursor);

    // Draw instructions
    draw_set_color(c_gray);
    draw_text(box_x + 10, box_y + box_height + 10, "Press Enter to send, Esc to cancel");
}
