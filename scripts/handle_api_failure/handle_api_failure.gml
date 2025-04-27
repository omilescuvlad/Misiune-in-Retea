/// Function to handle API failures (continued)
function handle_api_failure(npc_id, is_initial) {
    // Use fallback responses if API fails
    var fallback_key = npc_id + (is_initial ? "_initial" : "_followup");
    
    if (ds_map_exists(global.fallback_responses, fallback_key)) {
        return global.fallback_responses[? fallback_key];
    } else {
        return "I'm having trouble connecting. Let me try to help with what I know. For this puzzle, focus on " + 
               get_puzzle_hint(npc_id);
    }
}