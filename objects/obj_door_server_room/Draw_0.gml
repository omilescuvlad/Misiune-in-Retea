// obj_door_server_room Draw Event
draw_self();
if (!locked && distance_to_object(obj_player) < 50) {
    draw_set_color(c_yellow);
    draw_text(x, y - 20, "Apasa E pentru a trece la urmatoarea camera");
}