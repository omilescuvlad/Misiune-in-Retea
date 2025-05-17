/// @function string_load(filename)
/// @desc Încarcă un string dintr-un fișier text

function string_load(filename) {
    if (!file_exists(filename)) return "";
    var file = file_text_open_read(filename);
    var content = file_text_read_string(file);
    file_text_close(file);
    return content;
}
