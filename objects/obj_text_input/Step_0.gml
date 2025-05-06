/// obj_text_input Step Event
if (input_active) {
    // Only accept input when active
    keyboard_string = string_copy(keyboard_string, 1, 100); // Limit input length
    input_text = keyboard_string;

    if (keyboard_check_pressed(vk_enter)) {
        input_active = false;
        visible = false;
        
        var temp_callback = callback;
        var temp_input = input_text;
        
        // Reset for next use
        input_text = "";
        keyboard_string = "";
        callback = noone;
        
        // Execute callback with input
        if (is_method(temp_callback)) {
            temp_callback(temp_input);
        }
    } else if (keyboard_check_pressed(vk_escape)) {
        input_active = false;
        visible = false;
        input_text = "";
        keyboard_string = "";
        callback = noone;
    }
}