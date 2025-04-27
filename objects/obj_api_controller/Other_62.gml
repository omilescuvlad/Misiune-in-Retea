/// obj_api_controller Async HTTP Event
// Check if the async event is an HTTP response
if (ds_map_exists(async_load, "id") && ds_map_exists(async_load, "status")) {
    var async_load_id = string(async_load[? "id"]);
    if (ds_map_exists(global.api_callbacks, async_load_id)) {
        huggingface_api_response(async_load);
    }
}