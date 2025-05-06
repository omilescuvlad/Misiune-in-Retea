/// obj_text_input Create Event
visible = false;
input_text = "";
keyboard_string = "";
input_active = false;
callback = noone;

/// Function to activate text input
function activate(callback_function) {
    visible = true;
    input_active = true;
    keyboard_string = input_text;
    callback = callback_function;
}