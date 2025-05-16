function create_dialogue(_messages){
    if(instance_exists(obj_dialogue)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialogue);
    _inst.messages = _messages;
    _inst.current_message = 0;
}

char_colors = {
    "Felicitari!": c_yellow,
    "Security Analyst": c_yellow,
    "Developer" : c_green,
}

security_room_introduction = [
{
    name: "Security Analyst",
    msg: "AI-ul ne-a blocat rapoartele de incident! Din cate stiu folosim criptarea AES-128, dar cheia este corupta. Nu as vrea sa te ingrijorez dar o parte din bug-uri au prins viata."
},
{
    name: "Security Analyst",
    msg: "Developerii nostri au reusit sa extraga doar cheia corupta, din pacate, nu te pot ajuta cu asta. Sunt sigur ca unul dintre developerii nostri au reusit sa o depisteze!"
},
]

security_room_tip = [
{
    name: "Developer",
    msg: "Criptarea simetrica foloseste o singura cheie pentru a cripta si decripta datele. Sistemele moderne precum AES se bazeaza pe programe complexe de chei pentru a asigura securitatea. Daca cheia este compromisa, la fel sunt si datele",
},
{
    name: "Developer",
    msg: "Din cate vad in terminal, cheia corupta de AI este acum 0A 3F ?7 E2 (Paritatea celui de al treilea octet este invalida)",
},
]

dev_office_introduction = [
{
    name: "Developer",
    msg: "Nu stiu ce o sa ma fac. Am pierdut complet ordinea in stocarea parolelor si una dintre ele clar e gresita. Sunt sigur ca AI-ul va folosi asta ca un avantaj! :C",
},

{
    name: "Developer",
    msg: "Sunt sigur ca am lasat o notita pe aici care te poate ajuta. Te rog ajuta-ma sa depistez care parola e criptata gresit!",
},
]

dev_office_minilesson = [
{
    name: "Developer",
    msg: "Stocarea parolelor in text simplu este periculos. Sistemele folosesc 'salts' (date aleatoare) combinate cu algoritmi de hashing (ex: SHA-256) pentru a proteja parolele. Salt-urile previn atacurile precalculate de tip 'rainbow table'.",
},
{
    name : "Developer",
    msg  : "Nu orice cod care foloseste SHA256 e corect. Daca inversezi salt-ul, ai un rezultat complet diferit. Ordinea face diferenta Intre securitate si vulnerabilitate.",
},
]
dev_office_passwords = [
{
    name: "Developer",
    msg: "Avem un document vechi cu parole pe undeva... Nu mai stiu care e valida, dar toate au fost testate.",
}
]





