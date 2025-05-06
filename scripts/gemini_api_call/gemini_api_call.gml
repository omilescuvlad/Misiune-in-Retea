/// gemini_api_call - For Google's Gemini 2.0 Flash model
function gemini_api_call(prompt, callback) {
    // Check if in offline mode
    if (!variable_global_exists("offline_mode")) {
        global.offline_mode = false;
    }
    
    // Create API callbacks map if it doesn't exist
    if (!variable_global_exists("api_callbacks")) {
        global.api_callbacks = ds_map_create();
    }

    // Check if in offline mode
    if (global.offline_mode) {
        // Your existing offline mode handling code
        // ...
        return -1;
    }

    // Gemini API endpoint
    // Note: Replace API_KEY with your actual Gemini API key
    var api_key = "AIzaSyCD4HWKVQpXrQyZZ21C0B57AyeFLcu-BeE";
    var api_url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=" + api_key;
    
    // Create the request structure for Gemini API
    var request_data = {
        "contents": [
            {
                "role": "user",
                "parts": [
                    {
                        "text": prompt
                    }
                ]
            }
        ],
        "generationConfig": {
            "temperature": 0.7,
            "maxOutputTokens": 256,
            "topP": 0.95,
            "topK": 40
        }
    };

    // Convert to JSON string
    var json_data = json_stringify(request_data);
    
    // Log the request for debugging
    show_debug_message("GEMINI API REQUEST: " + json_data);

    // Create map for headers
    var headers = ds_map_create();
    ds_map_add(headers, "Content-Type", "application/json");

    // Make HTTP request
    var request_id = http_request(api_url, "POST", headers, json_data);
    
    // Log the request ID for debugging
    show_debug_message("HTTP REQUEST ID: " + string(request_id));

    // Clean up headers map
    ds_map_destroy(headers);

    // Store callback for response handling
    ds_map_add(global.api_callbacks, string(request_id), callback);

    // Set up timeout to handle failed requests
    var timeout_timer = time_source_create(time_source_global, 15, time_source_units_seconds, 
        function(_request_id, _callback) {
            if (ds_map_exists(global.api_callbacks, string(_request_id))) {
                // Execute callback with error message
                _callback("Error: Request timed out. Please try again.");
                
                // Clean up
                ds_map_delete(global.api_callbacks, string(_request_id));
                
                // Log timeout for debugging
                show_debug_message("API REQUEST TIMED OUT: " + string(_request_id));
            }
        }, 
        [[request_id, callback]], 1);

    time_source_start(timeout_timer);
    return request_id;
}