if (!instance_exists(enemy)) {
    instance_destroy();
    exit;
}

x = enemy.x;
y = enemy.bbox_top - 8;

if (enemy.status_effect != "stun") {
    instance_destroy();
}
