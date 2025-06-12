function string_save(filename, content) {
    var file = file_text_open_write(filename);
    file_text_write_string(file, content);
    file_text_close(file);
}
