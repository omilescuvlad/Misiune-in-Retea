if (status_effect == "stun") {
    image_speed = 0; // oprește animatia
    exit;
} else {
    image_speed = 1; // asigură că revine la normal când nu mai e stunned
}