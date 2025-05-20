winw = window_get_width();
winh = window_get_height();

move_speed = 1.5;

global.final_level = false;
global.can_move = true; // terminal related
global.interact = false;


tilemap = layer_tilemap_get_id("Tiles_Col");

hp = 1000;
hp_total = hp;
damage = 1;
charge = 0;

level = 1;
xp = 0;
xp_require = 100;

unlocked_poison = false;
unlocked_stun = false;
unlocked_heal = false;

function add_xp(_xp_to_add)
{
    xp += _xp_to_add;
    if(xp >= xp_require)
    {
        level++;
        xp -= xp_require;
        xp_require *= 1.3;
        
        hp_total += 4;
        hp = hp_total;
        damage += 0.7;
        
        if (level == 2) {
            unlocked_poison = true;
            create_dialogue([
            {
            name: "Felicitari!",
            msg: $"Ai avansat la nivelul {level} si ai invatat abilitatea Poison Strike!\nAtributele tale sunt acum:\nHP {hp_total}\nDMG {damage}"
            }
            ])
        }
        
        if (level == 3) {
            unlocked_stun = true;
            create_dialogue([
            {
            name: "Felicitari!",
            msg: $"Ai avansat la nivelul {level} si ai invatat abilitatea Stun!\nAtributele tale sunt acum:\nHP {hp_total}\nDMG {damage}"
            }
            ])
        
        }
        if (level == 4) {
            unlocked_heal = true;
            create_dialogue([
            {
            name: "Felicitari!",
            msg: $"Ai avansat la nivelul {level} si ai invatat abilitatea Heal!\nAtributele tale sunt acum:\nHP {hp_total}\nDMG {damage}"
            }
            ])
        
        }
    }
}