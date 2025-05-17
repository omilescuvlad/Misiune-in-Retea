/// @function scr_check_syntax(str)
/// @desc Verifica daca inputul are () si " " in perechi

function scr_check_syntax(str) {
    var open_parens = 0;
    var quotes = 0;
    
    for (var i = 1; i <= string_length(str); i++) {
        var c = string_char_at(str, i);
        if (c == "(") open_parens += 1;
        else if (c == ")") open_parens -= 1;
        else if (c == "\"") quotes += 1;
    }

    if (open_parens != 0 || quotes mod 2 != 0) return false;
    return true;
}
