tilemap = layer_tilemap_get_id("Tiles_Col");

switch (room)
{
    case rm_ceo_terminal:
        x = 240;
        y = 192;
        break;
    
    case rm_code_repository:
        x = 187;
        y = 250;
        break;

    case rm_dev_team_office:
        x = 45;
        y = 250;
        break;

}

with(obj_carry_data)
{
    other.level = level;
    other.xp = xp;
    other.xp_require = xp_require;
    other.damage = damage;
    other.hp_total = hp_total;
    other.hp = hp;
    other.unlocked_poison = unlocked_poison;
    other.unlocked_stun = unlocked_stun;
    other.unlocked_heal = unlocked_heal;

    instance_destroy();
}