function create_dialogue(_messages){
    if(instance_exists(obj_dialogue)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialogue);
    _inst.messages = _messages;
    _inst.current_message = 0;
}

char_colors = {
    "Felicitari!": c_yellow,
    "Gardian": c_yellow,
    "Developer Speriat" : c_green,
    "b4t3" : c_red,
    "Developer": c_green,
    "Developer (debugging a database breach)": c_green,
}

security_room_introduction = [
{
    name: "Gardian",
    msg: "AI-ul ne-a blocat rapoartele de incident! Din cate stiu folosim criptarea AES-128, dar cheia este corupta. Nu as vrea sa te ingrijorez dar o parte din bug-uri au prins viata."
},
{
    name: "Gardian",
    msg: "Developerii nostri au reusit sa extraga doar cheia corupta, din pacate, nu te pot ajuta cu asta. Sunt sigur ca unul dintre developerii nostri au reusit sa o depisteze!"
},
]

security_room_tip = [
{
    name: "Developer Speriat",
    msg: "Criptarea simetrica foloseste o singura cheie pentru a cripta si decripta datele. Sistemele moderne precum AES se bazeaza pe programe complexe de chei pentru a asigura securitatea. Daca cheia este compromisa, la fel sunt si datele",
},
{
    name: "Developer Speriat",
    msg: "Din cate vad in terminal, cheia corupta de AI este acum 0A 3F ?7 E2 (Paritatea celui de al treilea octet este invalida)",
},
]

security_room_final_tip = [
{
    name: "b4t3",
    msg: "B1t1 d3 p4rrr1t4t3",
},
]

dev_office_minilesson = [
{
    name: "Developer",
    msg: "Stocarea parolelor in text simplu este periculos. Sistemele folosesc 'salts' (date aleatoare) combinate cu algoritmi de hashing (ex: SHA-256) pentru a proteja parolele. Salt-urile previn atacurile precalculate de tip 'rainbow table'.",
},
]

dev_office_tip = [
{
    name: "Developer",
    msg: "AI-ul ne-a spart baza de date cu utilizatori! Am analizat parolele, dar unele au fost inca sparte. Uita-te la aceasta intrare:",
},
{
    name: "Developer",
    msg: "USERNAME: jsmith\nSALT: 7F@x\nHASH: 9ed3cb8be1aec930e4fcdd5aac9892bd554c1504af999b2a25649e890cbe0443",
},
]
