function create_dialogue(_messages){
    if(instance_exists(obj_dialogue)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialogue);
    _inst.messages = _messages;
    _inst.current_message = 0;
}

char_colors = {
    "Congrats": c_yellow,
    "You": c_fuchsia,
    "Developer": c_yellow
}

security_room_introduction = [
{
    name: "Developer",
    msg: "AI-ul ne-a blocat rapoartele de incident! Utilizam criptarea AES-128, dar cheia este corupta. Nu as vrea sa te ingrijorez dar o parte din bug-uri au prins viata."
},
{
    name: "Developer",
    msg: "Am facut tot ce avem in putinta sa le tinem in frau, dar avem nevoie de tine pentru a le dobori!"
},
]