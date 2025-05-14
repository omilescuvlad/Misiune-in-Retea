if (!instance_exists(enemy)) {
    instance_destroy();
    exit;
}

x = enemy.x - 3;
y = enemy.bbox_top - 20;

if (enemy.status_effect != "poison") {
    instance_destroy();
}