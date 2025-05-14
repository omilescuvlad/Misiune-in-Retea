if (status_effect == "stun") {
    x = xstart;
    alarm[0] = -1;
    alarm[1] = -1;
    exit;
}

x -= 2;

if (x < xstart - 20) {
    alarm[1] = 1;
} else {
    alarm[0] = 1;
}





