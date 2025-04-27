/// obj_notification Step Event
lifetime--;
if (lifetime <= 0) {
    alpha -= fade_speed;
    if (alpha <= 0) {
        instance_destroy();
    }
}