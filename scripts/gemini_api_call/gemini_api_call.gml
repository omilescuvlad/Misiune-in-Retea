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
    //var api_key = "AIzaSyCHuiXqEluhTIRi5eFhDJQNBPDWGjTq2Eg";
    //var api_url = "https://omilescu-vlad.free.nf/gemini_proxy.php;"
	//var api_url = "https://c0bbccaa-9a76-4101-8112-2e218ff5e8d7-00-3fudm34j61vwr.riker.replit.dev/";
	var api_url = "http://192.168.8.112/gemini_proxy.php";

	
    
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
    //show_debug_message("GEMINI API REQUEST: " + json_data);

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

    // Create a fallback response for timeout or error
    var fallback_response = "Timed out";

    // Define timeout handler function
    function timeout_handler(_request_id, _callback, _fallback) {
        if (ds_map_exists(global.api_callbacks, string(_request_id))) {
            show_debug_message("API REQUEST TIMED OUT: " + string(_request_id));
            show_debug_message("Using fallback response instead");
            _callback(_fallback);
            ds_map_delete(global.api_callbacks, string(_request_id));
        }
    }

    // Set up timeout to handle failed requests - increased to 20 seconds
    var timeout_timer = time_source_create(
        time_source_global,
        20,
        time_source_units_seconds,
        timeout_handler,
        [request_id, callback, fallback_response],
        1
    );

    time_source_start(timeout_timer);
    return request_id;
}