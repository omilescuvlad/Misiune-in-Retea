/// @function check_puzzle_solution(npc_id, solution)
/// @param {string} npc_id ID of the NPC/puzzle
/// @param {string} solution Player's solution
/// @description Checks if a solution is correct for a given puzzle
function check_puzzle_solution(npc_id, solution) {
    switch (npc_id) {
        case "security_guard":
            // For AES key, check if parity bit is correct (77 has even parity)
            return string_lower(solution) == "77";
            
        case "developer":
            // Password hash check
            return string_lower(solution) == "moonlight";
            
        case "network_engineer":
            // Certificate check - should reject certificate 2
            return string_lower(solution) == "certificate 2" || string_lower(solution) == "2";
            
        case "devops_bot":
            // SQL injection fix - check if solution contains parameterized query concepts
            return (string_pos("?", solution) > 0) || (string_pos("parameterized", string_lower(solution)) > 0);
            
        case "ceo_hologram":
            // Digital signature verification
            return string_lower(solution) == "authorize level 5 firewall protocols" || string_lower(solution) == "2";
            
        default:
            return false;
    }
}