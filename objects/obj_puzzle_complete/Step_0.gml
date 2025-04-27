/// obj_puzzle_complete Step Event
if (scale < 1) {
    scale += grow_speed;
} else {
    alpha -= fade_speed;
    if (alpha <= 0) {
        instance_destroy();
    }
}