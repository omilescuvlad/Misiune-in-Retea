/// obj_interaction_zone Step Event
var player = instance_nearest(x, y, obj_player);
if (player != noone && point_distance(x, y, player.x, player.y) < interaction_range) {
    // Player is in range
    if (keyboard_check_pressed(ord("E"))) {
        // Trigger interaction on target object
        if (target_object != noone && instance_exists(target_object)) {
            with (target_object) {
                interact();
            }
        }
    }
}