y -= 0.5; // Se ridică ușor
image_alpha -= 0.01; // Se estompează treptat
if (image_alpha <= 0) {
    instance_destroy();
}
