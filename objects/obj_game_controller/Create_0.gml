/// obj_game_controller Create Event (Add this to your main game controller)
// Game state variables
global.next_target_revealed = false;
global.network_secured = false;
global.login_secured = false;
global.system_reboot = false;

// Initialize NPC system
if (!variable_global_exists("api_callbacks")) {
    initialize_npc_system();
}

// Initialize puzzle tracking
if (!variable_global_exists("puzzle_solved")) {
    global.puzzle_solved = ds_map_create();
    
    // Set all puzzles to unsolved initially
    ds_map_add(global.puzzle_solved, "security_guard", false);
    ds_map_add(global.puzzle_solved, "developer", false);
    ds_map_add(global.puzzle_solved, "network_engineer", false);
    ds_map_add(global.puzzle_solved, "devops_bot", false);
    ds_map_add(global.puzzle_solved, "ceo_hologram", false);
}

// Setup API fallback system for offline play
global.offline_mode = false;
global.fallback_responses = ds_map_create();

// Add fallback responses for each NPC's initial dialogue
ds_map_add(global.fallback_responses, "security_guard_initial", 
    "Hey, glad you're here! We've got a crisis. Symmetric encryption uses one key to encrypt and decrypt data - like AES-128 that we use. The AI locked our incident reports! It's using AES-128 encryption, but the key is corrupted. We think one of the parity bits is wrong. Can you fix the key? Corrupted Key: 0A 3F ?7 E2 (Last byte's parity is invalid)."
);

ds_map_add(global.fallback_responses, "developer_initial", 
    "Oh no! The AI leaked our user database! Storing passwords in plaintext is dangerous, so we use 'salts' with hashing algorithms like SHA-256 to protect them. Salts prevent rainbow table attacks. Look at this entry: Username: jsmith, Salt: D9%2f, Hash: a5f4c... The password is either 'bluefish' or 'moonlight'. Which one matches the hash?"
);

// Add more fallback responses as needed