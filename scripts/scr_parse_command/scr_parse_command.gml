/// @desc Parsează comanda terminalului și execută real
/// @param command string

function scr_parse_command(command_raw) {
    var cmd = string_trim(command_raw);
    if (!scr_check_syntax(cmd)) {
        return "Sintaxa invalida.";
    }

    var func_name = string_copy(cmd, 1, string_pos("(", cmd) - 1);
    var arg_str = string_copy(cmd, string_pos("(", cmd) + 1, string_length(cmd) - string_pos("(", cmd) - 1);
    var args = string_split(arg_str, ",");

    // Scoatem ghilimelele
    for (var i = 0; i < array_length(args); i++) {
        args[i] = string_replace_all(string_replace_all(string_trim(args[i]), "\"", ""), "'", "");
    }
    
    if (string_copy(cmd, 1, 6) == "clear(") {
    cmd = "clear"; // normalizeaza comanda
    }


    switch (func_name) {
        case "rsa_generate_keypair":
            if (array_length(args) != 2) return "Trebuie 2 argumente: pub, priv.";
            rsa_generate_keypair(args[0], args[1]);
            return "Cheile RSA au fost generate in fisiere.";

        case "rsa_sign":
            if (array_length(args) != 1) return "rsa_sign() primește 1 mesaj.";
            var sig = rsa_sign(args[0], "player_priv.pem");
            string_save("answer_signature.txt", sig);
            last_signature = sig; // o reținem în memorie
            string_save("answer_signature.txt", sig);
            return "Semnatura salvată.\nSemnatura: " + sig;


        case "rsa_verify":
            if (array_length(args) != 3) return "rsa_verify(msg, sig, pub)";
            var msg = args[0];
            var sig = (args[1] == "[semnatura copiata]") ? last_signature : args[1];
            var key = args[2];
            var result = rsa_verify(msg, sig, key);
            return result == 1 ? "Semnatura valida!" : "Semnatura INVALIDA!";
        
        case "help": 
        return "=== COMENZI DISPONIBILE ===\n" +
           "1. rsa_generate_keypair(pub, priv)\n" +
           "   - Genereaza chei RSA si le salveaza in fisiere\n" +
           "   - Ex: rsa_generate_keypair(\"player_pub.pem\", \"player_priv.pem\")\n\n" +
           "2. rsa_sign(mesaj)\n" +
           "   - Semneaza mesajul si salveaza in answer_signature.txt\n" +
           "   - Ex: rsa_sign(\"secure sockets layer\")\n\n" +
           "3. rsa_verify(mesaj, semnatura, cheia_pub)\n" +
           "   - Verifica semnatura pentru un mesaj dat\n" +
           "   - Ex: rsa_verify(\"secure sockets layer\", \"[semnatura copiata]\", \"player_pub.pem\")\n\n" +
           " ! In loc de semnatura lunga, poti folosi exact: \"[semnatura copiata]\"\n" +
           "   si sistemul va folosi ultima semnatura generata automat. !\n\n" +
           "4. clear()\n" +
           "   - Curata terminalul";
        
        case "clear":
        feedback_text = "";
        last_signature = "";
        return "";


        default:
            return "Functie necunoscuta.";
    }
}
