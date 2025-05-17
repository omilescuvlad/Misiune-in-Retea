// Initializare variabile
input_active = false;
player_input = "";
feedback_text = "";

rsa_stage = 0;
rsa_solved = false;

last_signature = ""; // tinem minte ultima semnatura generata

pub_file = "player_pub.pem";
priv_file = "player_priv.pem";
server_pub = "server_pub.pem";

question = "Ce inseamna SSL?";
correct_answer = "secure sockets layer";



global.can_move = true;
