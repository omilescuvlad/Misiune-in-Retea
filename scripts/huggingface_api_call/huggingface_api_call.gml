/// Modified huggingface_api_call with timeout and error handling
function huggingface_api_call(prompt, callback) {
	
	// Verifică dacă în modul offline
    if (!variable_global_exists("offline_mode")) {
        global.offline_mode = false;
    }
	
    // Check if in offline mode
    if (global.offline_mode) {
        // Extract NPC ID from conversation history
        var npc_id = "";
        for (var key = ds_map_find_first(global.npc_prompts); key != undefined; key = ds_map_find_next(global.npc_prompts, key)) {
            if (string_pos(global.npc_prompts[? key], prompt) > 0) {
                npc_id = key;
                break;
            }
        }
        
        // Determine if this is initial message or follow-up
        var is_initial = string_pos("Player: Hi, can you help me?", prompt) > 0;
        
        // Get fallback response
        var fallback_response = handle_api_failure(npc_id, is_initial);
        
        // Use setTimeout to simulate API delay
        var timer = time_source_create(time_source_global, 1, time_source_units_seconds, function() {
            callback(fallback_response);
        }, [], 1);
        time_source_start(timer);
        
        return -1; // No real request ID in offline mode
    }

    var api_url = "https://api-inference.huggingface.co/models/mistralai/Mistral-7B-Instruct-v0.2";
    var api_key = "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"; // Replace with your actual API key
    
    // Create data structure for request body
    var request_data = {
        inputs: prompt,
        parameters: {
            max_new_tokens: 256,
            return_full_text: false,
            do_sample: true,
            temperature: 0.7
        }
    };
    
    // Create map for headers
    var headers = ds_map_create();
    ds_map_add(headers, "Content-Type", "application/json");
    ds_map_add(headers, "Authorization", "Bearer " + api_key);
    
    // Make HTTP request
    var request_id = http_request(api_url, "POST", headers, json_stringify(request_data));
    
    // Clean up headers map
    ds_map_destroy(headers);
    
    // Store callback for response handling
    ds_map_add(global.api_callbacks, string(request_id), callback);
	
	// Crează o variabilă locală pentru request_id pe care să o folosim în closure
    var local_request_id = request_id;
    
    // Set up timeout to handle failed requests
    var timeout_timer = time_source_create(time_source_global, 10, time_source_units_seconds, function() {
        if (ds_map_exists(global.api_callbacks, string(local_request_id))) {
            // Extract NPC ID from conversation history
            var npc_id = "";
            for (var key = ds_map_find_first(global.npc_prompts); key != undefined; key = ds_map_find_next(global.npc_prompts, key)) {
                if (string_pos(global.npc_prompts[? key], prompt) > 0) {
                    npc_id = key;
                    break;
                }
            }
            
            // Determine if this is initial message or follow-up
            var is_initial = string_pos("Player: Hi, can you help me?", prompt) > 0;
            
            // Get fallback response
            var fallback_response = handle_api_failure(npc_id, is_initial);
            
            // Execute callback with fallback response
            callback(fallback_response);
            
            // Clean up
            ds_map_delete(global.api_callbacks, string(local_request_id));
            global.offline_mode = true; // Switch to offline mode after timeout
            
            // Show warning message about offline mode
            show_debug_message("API request timed out, switching to offline mode");
            var notification = instance_create_layer(room_width/2, 100, "UI", obj_notification);
            notification.text = "Connection issue detected. Using offline mode.";
        }
    }, [], 1);
    time_source_start(timeout_timer);
    
    return request_id;
}