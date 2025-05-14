if (!instance_exists(enemy)) {
    instance_destroy();
    exit;
}

// poziționează deasupra capului inamicului
x = enemy.x;
y = enemy.bbox_top - 8;

// dacă nu mai e stunned, dispare
if (enemy.status_effect != "stun") {
    instance_destroy();
}
