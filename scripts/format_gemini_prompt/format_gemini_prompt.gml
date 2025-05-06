/// Format prompt for Gemini AI interaction
function format_gemini_prompt(system_prompt, user_message, conversation_history = "") {
    var formatted_prompt = system_prompt;
    
    // Add conversation history if provided
    if (conversation_history != "") {
        formatted_prompt += "\n\n" + conversation_history;
    }
    
    // Add the current user message
    formatted_prompt += "\n\nPlayer: " + user_message + "\n\n";
    
    return formatted_prompt;
}