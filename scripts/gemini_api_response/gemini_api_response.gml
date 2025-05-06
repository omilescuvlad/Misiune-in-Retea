/// openai_api_response - Handles responses from OpenAI API
function gemini_api_response(async_load) {
    var request_id = async_load[? "id"];
    var status = async_load[? "status"];
    var http_status = async_load[? "http_status"];
    
    // Debug logging
    show_debug_message("API RESPONSE RECEIVED - ID: " + string(request_id) + 
                      ", Status: " + string(status) + 
                      ", HTTP Status: " + string(http_status));
    
    //if (async_load[? "response_body"] != undefined) {
        show_debug_message("Response body received (length): " + string(async_load[? "response_body"]));
    //}
    
    var response = "";

    // Check if the callback exists for this request
    if (!ds_map_exists(global.api_callbacks, string(request_id))) {
        show_debug_message("No callback found for request ID: " + string(request_id));
        return;
    }

    // Get the callback
    var callback = global.api_callbacks[? string(request_id)];

    if (status == 0) {
        // Status 0 means no response was received - network error
        response = "Error: Network connection failed. Please check your internet connection.";
        
        if (callback != undefined) {
            if (script_exists(callback)) {
                script_execute(callback, response);
            } else if (is_method(callback)) {
                callback(response);
            }
        }
        
        ds_map_delete(global.api_callbacks, string(request_id));
        return;
    }
    
    // Handle non-200 responses
    if (status != 200) {
        response = "Error " + string(status) + ": " + async_load[? "status_text"];
        
        // Try to get more detailed error message from response body if available
        try {
            var response_body = async_load[? "response_body"];
            if (response_body != undefined && response_body != "") {
                var error_data = json_parse(response_body);
                if (is_struct(error_data) && 
                    variable_struct_exists(error_data, "error") && 
                    is_struct(error_data.error) &&
                    variable_struct_exists(error_data.error, "message")) {
                    response = "Error: " + error_data.error.message;
                }
            }
        } catch (error) {
            // If we can't parse the error, just use the status code
        }
        
        if (callback != undefined) {
            if (script_exists(callback)) {
                script_execute(callback, response);
            } else if (is_method(callback)) {
                callback(response);
            }
        }
        
        ds_map_delete(global.api_callbacks, string(request_id));
        return;
    }
    
    // Handle successful response
    try {
        // Get response body
        var response_text = async_load[? "response_body"];
        show_debug_message("Response message !!!!!!!!!!! " + response_text);
        // If empty response
        if (response_text == "" || response_text == undefined) {
            response = "Error: Empty response from server.";
        } else {
            // Parse JSON
            var response_data = json_parse(response_text);
            
            // Extract the response text from Gemini's format
            if (is_struct(response_data) && 
                variable_struct_exists(response_data, "candidates") && 
                array_length(response_data.candidates) > 0 &&
                is_struct(response_data.candidates[0]) &&
                variable_struct_exists(response_data.candidates[0], "content") &&
                is_struct(response_data.candidates[0].content) &&
                variable_struct_exists(response_data.candidates[0].content, "parts") &&
                array_length(response_data.candidates[0].content.parts) > 0 &&
                is_struct(response_data.candidates[0].content.parts[0]) &&
                variable_struct_exists(response_data.candidates[0].content.parts[0], "text")) {
                
                response = response_data.candidates[0].content.parts[0].text;
            } else {
                response = "Error: Unexpected response format from Gemini API.";
                show_debug_message("Unexpected response format: " + response_text);
            }
        }
    } catch (error) {
        // JSON parsing error
        response = "Error: Failed to parse API response. Details: " + string(error);
        show_debug_message("JSON PARSE ERROR: " + string(error) + " for data: " + string(async_load[? "response_body"]));
    }

    // Call the callback with the response
    if (callback != undefined) {
        if (script_exists(callback)) {
            script_execute(callback, response);
        } else if (is_method(callback)) {
            callback(response);
        }
    }

    // Clean up
    ds_map_delete(global.api_callbacks, string(request_id));
}