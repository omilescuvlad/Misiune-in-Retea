if(instance_exists(obj_battle_switcher)) exit;

instance_create_depth(0, 0, 0, obj_carry_data,{
    level: level,
    xp: xp,
    xp_require: xp_require,
    damage: damage,
    hp_total: hp_total,
    hp: hp,
    unlocked_poison: unlocked_poison,
    unlocked_stun: unlocked_stun, 
    unlocked_heal: unlocked_heal,

})