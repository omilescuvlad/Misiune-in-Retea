var pub = "test_pub.pem";
var priv = "test_priv.pem";
var msg = "Licenta Vlad";

// 1. Generează cheile
var gen = rsa_generate_keypair(pub, priv);
show_debug_message("Generează: " + string(gen));

// 2. Semnează mesajul
var sig = rsa_sign(msg, priv);
show_debug_message("Semnătură: " + string(sig));

// 3. Verifică semnătura
var ver = rsa_verify(msg, sig, pub);
show_debug_message("Verificare: " + string(ver));
