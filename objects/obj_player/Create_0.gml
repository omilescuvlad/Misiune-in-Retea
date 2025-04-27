move_speed = 1.5;

tilemap = layer_tilemap_get_id("Tiles_Col");

hp = 10;
hp_total = hp;
damage = 1;
charge = 0;

level = 1;
xp = 0;
xp_require = 100;

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
        
        create_dialogue([
        {
            name: "Congrats",
            msg: $"You are now LVL {level}.\nYour new stats are:\nHP {hp_total}\nDMG {damage}"
        }
        ])
    }
}