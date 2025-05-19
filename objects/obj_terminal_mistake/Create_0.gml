// DEBUG
show_debug_message("Create: Puzzle Mistake Terminal");

randomize(); // pentru randomizarea la fiecare seed

// SALT RANDOM
var charset = "@#%$!abcdefghijklmnopqrstuvwxyz0123456789";
salt = "@";
for (var i = 0; i < 4; i++) {
    salt += string_char_at(charset, irandom(string_length(charset) - 1) + 1);
}
show_debug_message("Salt generat: " + salt);

// PAROLE POSIBILE
var pool = [ "moonlight", "coffee2024", "admin", "cyberwolf", "xadmin", "bypass", "tr33house" ];

// ALEGE PAROLA CORECTA
password_correct = pool[irandom(array_length(pool) - 1)];
show_debug_message("Parola corecta: " + password_correct);

mode_correct = irandom(2); 
switch (mode_correct) {
    case 0: target_hash = string_sha256(password_correct); break;
    case 1: target_hash = string_sha256(password_correct + salt); break;
    case 2: target_hash = string_sha256(salt + password_correct); break;
}

show_debug_message("Mod corect: " + string(mode_correct));


input_active = false;
match_found = false;
player_input = "";
feedback_text = "";
selected_mode = 0; 

global.can_move = true;

global.puzzle2_solved = false;
