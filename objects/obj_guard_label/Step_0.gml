if (!instance_exists(player)) {
    instance_destroy();
    exit;
}

x = player.x;
y = player.bbox_top - 12;

if (!player.data.is_guarding) {
    instance_destroy();
}
