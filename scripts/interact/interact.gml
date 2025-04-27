/// obj_npc_ai - Interact function
function interact() {
    if (interaction_cooldown > 0) return;
    
    if (!lesson_delivered) {
        // First interaction - deliver the lesson
        lesson_delivered = true;
        
        // Get the appropriate prompt
        var prompt = global.npc_prompts[? npc_id];
        if (prompt != undefined) {
            conversation_history = "System: " + prompt + "\n\nPlayer: Hi, can you help me?\n\n";
            
            // Show loading message
            ds_queue_enqueue(message_queue, "Loading...");
            if (!typing) {
                current_message = ds_queue_dequeue(message_queue);
                typing = true;
                text_progress = 0;
            }
            
            // Call the API
            huggingface_api_call(conversation_history, function(response) {
                // Clear loading message
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
        // If currently showing a message, clear it and show input
        if (current_message != "" && !typing) {
            current_message = "";
            
            // Show text input for follow-up questions
            if (!instance_exists(obj_text_input)) {
                instance_create_layer(0, 0, "UI", obj_text_input);
            }
            
            with (obj_text_input) {
                activate(method(other, function(input_text) {
                    if (input_text == "") return;
                    
                    conversation_history += "Player: " + input_text + "\n\n";
                    
                    // Show loading message
                    ds_queue_enqueue(message_queue, "Loading...");
                    if (!typing) {
                        current_message = ds_queue_dequeue(message_queue);
                        typing = true;
                        text_progress = 0;
                    }
                    
                    // Also check if this is an attempt to solve the puzzle
                    var is_solution_attempt = false;
                    
                    // Look for keywords in the input that suggest it's a solution attempt
                    var solution_keywords = ["solution", "answer", "solve", "try", "fixed", "correct", "the key is", "password is"];
                    for (var i = 0; i < array_length(solution_keywords); i++) {
                        if (string_pos(solution_keywords[i], string_lower(input_text)) > 0) {
                            is_solution_attempt = true;
                            break;
                        }
                    }
                    
                    // Check if it's a direct solution (just the answer without explanation)
                    if (string_length(input_text) <= 10 && !is_solution_attempt) {
                        is_solution_attempt = true;
                    }
                    
                    if (is_solution_attempt) {
                        // Try to extract potential solution from the input
                        var potential_solution = input_text;
                        
                        // Check if the solution is correct
                        if (check_puzzle_solution(npc_id, potential_solution)) {
                            // Mark puzzle as solved
                            ds_map_replace(global.puzzle_solved, npc_id, true);
                            
                            // Success message
                            var success_msg = "That's correct! You've solved the puzzle.";
                            ds_queue_clear(message_queue);
                            ds_queue_enqueue(message_queue, success_msg);
                            current_message = "";
                            typing = false;
                            
                            // Trigger puzzle completion event
                            event_user(0);
                        }
                    }
                    
                    // Call the API with the updated conversation history
                    huggingface_api_call(conversation_history, function(response) {
                        // Clear loading message if it's showing
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
                    
                    // Set interaction cooldown to prevent spam
                    interaction_cooldown = 5;
                }));
            }
        }
    }
}