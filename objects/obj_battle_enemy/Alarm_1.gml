/*x += 2;

if(x < xstart) {
    alarm[1] = 1;
}*/

if (status_effect == "stun") {
    x = xstart;
    alarm[1] = -1;
    exit;
}

x += 2;

if (x < xstart) {
    alarm[1] = 1;
}

