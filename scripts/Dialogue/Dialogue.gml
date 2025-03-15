function create_dialogue(_messages){
    if(instance_exists(obj_dialogue)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialogue);
    _inst.messages = _messages;
    _inst.current_message = 0;
}

char_colors = {
    "Congrats": c_yellow,
    "Coita": c_yellow,
    "Dorel": c_fuchsia
}

welcome_dialogue = [
{
    name: "Coita",
    msg: "What did you just call me?"
},

{
    name: "Dorel",
    msg: "Faggot"
},
]