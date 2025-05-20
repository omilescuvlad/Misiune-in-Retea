if (instance_exists(obj_dialogue)) exit; 

    
if (instance_exists(obj_player)){
    create_dialogue(dialogue);
}
else {
    can_talk = false;
}