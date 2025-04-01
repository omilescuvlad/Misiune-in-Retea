if (keyboard_check_pressed(vk_enter)) {
var input_key = get_string("Enter fixed key (e.g., 0A3F77E2):", "");
if (input_key == valid_key) {
    room_goto_next();  // Proceed to Room 2
} else {
    show_message("Invalid key! Check parity bits.");
}
}
