/// @function huggingface_api_response(async_load)
/// @param {ds_map} async_load The async_load map from the http event
/// @description Handles responses from HuggingFace API
function huggingface_api_response(async_load) {
    var request_id = async_load[? "id"];
    var status = async_load[? "status"];
    var response = "";
    
    if (status == 200) {
        var response_text = async_load[? "result"];
        var response_data = json_parse(response_text);
        
        // Extract generated text from response
        // Format varies by model, adjust as needed
        if (is_array(response_data)) {
            response = response_data[0][? "generated_text"];
        } else if (ds_exists(response_data, ds_type_map)) {
            response = response_data[? "generated_text"];
        } else {
            response = string(response_data);
        }
    } else {
        response = "Error: " + string(status) + " - Unable to communicate with assistant.";
    }
    
    // Call the callback with the response
    var callback = global.api_callbacks[? string(request_id)];
    if (script_exists(callback)) {
        script_execute(callback, response);
    } else if (is_method(callback)) {
        callback(response);
    }
	
    
    // Clean up
    ds_map_delete(global.api_callbacks, string(request_id));
}