/// obj_npc_ai Draw Event
// Draw NPC sprite
draw_self();

// Draw speech bubble if there's text to display
if (current_message != "") {
    // Draw speech bubble
    draw_set_color(c_white);
    draw_roundrect(bubble_x, bubble_y, bubble_x + bubble_width, bubble_y + bubble_height, false);
    draw_set_color(c_black);
    draw_roundrect(bubble_x, bubble_y, bubble_x + bubble_width, bubble_y + bubble_height, true);
    
    // Draw text
    draw_set_color(c_black);
    draw_set_font(fnt_dialogue); // Make sure this font exists in your project
    draw_text_ext(bubble_x + bubble_padding, bubble_y + bubble_padding, display_text, 20, bubble_width - 2*bubble_padding);
    
    // Draw continue indicator if not typing
    if (!typing && interaction_cooldown == 0) {
        draw_set_color(c_black);
        draw_text(bubble_x + bubble_width - 20, bubble_y + bubble_height - 20, "▼");
    }
}

// Draw interaction prompt when player is near
var player = instance_nearest(x, y, obj_player); // Make sure obj_player exists
if (player != noone && point_distance(x, y, player.x, player.y) < 100) {
    draw_set_color(c_yellow);
    draw_text(x, y - sprite_height - 10, "Press E to interact");
}