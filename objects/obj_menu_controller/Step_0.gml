if(instance_exists(obj_player) && !global.interact && keyboard_check_pressed(vk_escape))
{
    room_goto(rm_mainMenu);
}