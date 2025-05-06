/// Function to get a hint for a specific puzzle
function get_puzzle_hint(npc_id) {
    switch (npc_id) {
        case "security_guard":
            return "fixing the parity bit in the corrupted key. The byte '?7' needs even parity.";
            
        case "developer":
            return "determining which password ('bluefish' or 'moonlight') matches the hash when combined with the salt.";
            
        case "network_engineer":
            return "checking which certificate is legitimate by examining the issuer field.";
            
        case "devops_bot":
            return "rewriting the SQL query to use parameterized inputs (use ? instead of concatenating variables).";
            
        case "ceo_hologram":
            return "verifying which message was actually signed with my private key.";
            
        default:
            return "understanding the cybersecurity concepts in this room.";
    }
}