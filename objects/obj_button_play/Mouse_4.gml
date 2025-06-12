event_inherited();

if(global.current_room == undefined)
    room_goto(rm_security_lobby);
else
    room_goto(global.current_room);