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