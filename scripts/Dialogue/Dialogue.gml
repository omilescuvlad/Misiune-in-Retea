function create_dialogue(_messages){
    if(instance_exists(obj_dialogue)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialogue);
    _inst.messages = _messages;
    _inst.current_message = 0;
}

char_colors = {
    "Congrats": c_yellow,
    "MC": c_yellow,
    "Dorel": c_fuchsia
}

welcome_dialogue = [
{
    name: "MC",
    msg: "Hello World."
},

{
    name: "Dorel",
    msg: "Test"
},
]