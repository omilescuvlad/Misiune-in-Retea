/// @function create_interactive_npc(x, y, layer, npc_id, sprite)
/// @param {real} x X position
/// @param {real} y Y position 
/// @param {string} layer Layer name to create on
/// @param {string} npc_id ID of the NPC to create
/// @param {sprite} sprite Sprite to use for the NPC
/// @description Creates an NPC with interaction zone
function create_interactive_npc(x_pos, y_pos, layer_name, npc_id, sprite) {
    var npc = instance_create_layer(x_pos, y_pos, layer_name, obj_npc_ai);
    npc.npc_id = npc_id;
    npc.sprite_index = sprite;
    
    // Add collision object for interaction
    var interact_zone = instance_create_layer(npc.x, npc.y, layer_name, obj_interaction_zone);
    interact_zone.target_object = npc;
    
    return npc;
}