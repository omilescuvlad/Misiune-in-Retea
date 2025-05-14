if (!instance_exists(enemy)) {
    instance_destroy();
    exit;
}

x = enemy.x - 5;
y = enemy.bbox_top - 10; 

float_timer += 0.1; // animation


if (enemy.status_effect != "poison") {
    instance_destroy();
}