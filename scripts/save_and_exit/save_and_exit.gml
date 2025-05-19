function save_and_exit() {
    var save_data = {
        "main_volume": global.main_volume,
        "music_volume": global.music_volume,
        "sfx_volume": global.sfx_volume
    };
    var json = json_stringify(save_data);
    file_text_write("save_data.json", json);
    game_end();
}
