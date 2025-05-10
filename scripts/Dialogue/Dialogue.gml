function create_dialogue(_messages){
    if(instance_exists(obj_dialogue)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialogue);
    _inst.messages = _messages;
    _inst.current_message = 0;
}

char_colors = {
    "Congrats": c_yellow,
    "You": c_fuchsia,
    "Gardian": c_yellow
}

security_room_introduction = [
{
    name: "Gardian",
    msg: "AI-ul ne-a blocat rapoartele de incident! Din cate stiu folosim criptarea AES-128, dar cheia este corupta. Nu as vrea sa te ingrijorez dar o parte din bug-uri au prins viata."
},
{
    name: "Gardian",
    msg: "Developerii nostri au reusit sa extraga doar cheia corupta, din pacate, prin toata panica indusa am reusit doar sa o scriu pe o foaie. Singurul lucru pe care mi-l amintesc e ca ar trebui sa fie undeva in una dintre camerele de securitate."
},
]