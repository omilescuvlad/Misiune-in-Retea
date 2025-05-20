if (status_effect == "stun") {
    image_speed = 0; // oprește animatia
    exit;
} else {
    image_speed = 1; // asigura ca revine la normal cand nu mai e stunned
}