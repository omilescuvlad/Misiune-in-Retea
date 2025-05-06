/// @function interact()
/// @description Gestionează interacțiunea cu NPC-ul când jucătorul apasă E
function interact() {
	show_debug_message(">> scr_interact start, npc_id=" + string(npc_id));

    if (interaction_cooldown > 0) return;
    
    if (!lesson_delivered) {
        // Prima interacțiune - oferă lecția
        lesson_delivered = true;
        
        // Obține promptul corespunzător
        var prompt = global.npc_prompts[? npc_id];
        if (prompt != undefined) {
            conversation_history = "System: " + prompt + "\n\nPlayer: Hi, can you help me?\n\n";
            
            // Arată mesajul de încărcare
            ds_queue_enqueue(message_queue, "Loading...");
            if (!typing) {
                current_message = ds_queue_dequeue(message_queue);
                typing = true;
                text_progress = 0;
            }
            
            // Apelează API-ul
            huggingface_api_call(conversation_history, function(response) {
                // Șterge mesajul de încărcare
                if (current_message == "Loading...") {
                    current_message = "";
                    typing = false;
                }
                
                ds_queue_enqueue(message_queue, response);
                if (!typing) {
                    current_message = ds_queue_dequeue(message_queue);
                    typing = true;
                    text_progress = 0;
                }
                
                conversation_history += "Assistant: " + response + "\n\n";
            });
        }
    } else {
        // Dacă se afișează deja un mesaj, șterge-l și arată input-ul
        if (current_message != "" && !typing) {
            current_message = "";
            
            // Arată input-ul de text pentru întrebări suplimentare
            if (!instance_exists(obj_text_input)) {
                instance_create_layer(0, 0, "UI", obj_text_input);
            }
            
            with (obj_text_input) {
                activate(method(other, function(input_text) {
                    if (input_text == "") return;
                    
                    conversation_history += "Player: " + input_text + "\n\n";
                    
                    // Arată mesajul de încărcare
                    ds_queue_enqueue(message_queue, "Loading...");
                    if (!typing) {
                        current_message = ds_queue_dequeue(message_queue);
                        typing = true;
                        text_progress = 0;
                    }
                    
                    // Verifică dacă este o încercare de rezolvare a puzzle-ului
                    var is_solution_attempt = false;
                    
                    // Caută cuvinte cheie în input care sugerează că este o încercare de soluție
                    var solution_keywords = ["solution", "answer", "solve", "try", "fixed", "correct", "the key is", "password is"];
                    for (var i = 0; i < array_length(solution_keywords); i++) {
                        if (string_pos(solution_keywords[i], string_lower(input_text)) > 0) {
                            is_solution_attempt = true;
                            break;
                        }
                    }
                    
                    // Verifică dacă este o soluție directă (doar răspunsul fără explicații)
                    if (string_length(input_text) <= 10 && !is_solution_attempt) {
                        is_solution_attempt = true;
                    }
                    
                    if (is_solution_attempt) {
                        // Încearcă să extragă posibila soluție din input
                        var potential_solution = input_text;
                        
                        // Verifică dacă soluția este corectă
                        if (check_puzzle_solution(npc_id, potential_solution)) {
                            // Marchează puzzle-ul ca rezolvat
                            ds_map_replace(global.puzzle_solved, npc_id, true);
                            
                            // Mesaj de succes
                            var success_msg = "That's correct! You've solved the puzzle.";
                            ds_queue_clear(message_queue);
                            ds_queue_enqueue(message_queue, success_msg);
                            current_message = "";
                            typing = false;
                            
                            // Declanșează evenimentul de completare a puzzle-ului
                            event_user(0);
                        }
                    }
                    
                    // Apelează API-ul cu istoricul conversației actualizat
                    huggingface_api_call(conversation_history, function(response) {
                        // Șterge mesajul de încărcare dacă se afișează
                        if (current_message == "Loading...") {
                            current_message = "";
                            typing = false;
                        }
                        
                        ds_queue_enqueue(message_queue, response);
                        if (!typing) {
                            current_message = ds_queue_dequeue(message_queue);
                            typing = true;
                            text_progress = 0;
                        }
                        
                        conversation_history += "Assistant: " + response + "\n\n";
                    });
                    
                    // Setează cooldown-ul de interacțiune pentru a preveni spam-ul
                    interaction_cooldown = 5;
                }));
            }
        }
    }
}