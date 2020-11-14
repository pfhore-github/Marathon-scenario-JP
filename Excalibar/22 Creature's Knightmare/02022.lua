mines = {};
mine_length_min = 2 * 30;
mine_radius = 3;
mine_max_damage = 100;
mine_damage_type = _damage_explosion;
last_poly = nil;
exit_poly = 704;
_shot_mine = _shot_special;
_mine = _clone;
function level_init (rs)
    Players[0]:play_sound(252, 1);
    if rs then
        for g in Monsters() do
            if (g.type == _mine) then
                table.insert(mines, {spell=g, timer=mine_length_min, ignited=false});
            end
        end
        return;
    end
    remove_items(_item_wand, _item_epotion);
end
enter_to[exit_poly] = function()
    Players[0]:teleport_to_level(23);
end
function level_idle ()
    for _, k in ipairs(mines) do
        k.timer = k.timer - 1;
        if (k.timer <= 0) and (not k.ignited) then
	        if k.spell and k.spell.valid then
	            k.spell:damage( 500, mine_damage_type);
	        end
        end
    end
end

function ignite_mine(mine_index)
    local g, is_mine, mine_damage;
    player = Players[0].monster;
    mine_poly = mines[mine_index].spell.polygon;
    mine_x = mines[mine_index].spell.x
    mine_y = mines[mine_index].spell.y
    mine_z =  mines[mine_index].spell.z
    for g in Monsters() do
        is_mine = g.type == _mine;
        if (g ~= mines[mine_index].spell) then
            mp = g.polygon
            mfloor = mp.floor.height;
            dist = (g.x - mine_x)^2 + (g.y - mine_y)^2
            wu_dist = math.sqrt(dist) / 1024
            floor_delta = math.abs(mfloor - mine_poly.floor.height);
            hover = g.z - mfloor;
            if (wu_dist <= mine_radius) and (hover <= .5) and (floor_delta < 1.0) then
                if is_mine then
                    mine_damage = 500;
                else
                    mine_damage = mine_max_damage - 
                    (mine_max_damage*wu_dist/mine_radius);
                end
                g:damage_monster(mine_damage, mine_damage_type);
	        end
        end
    end
end

function level_monster_killed(victim, killer, projectile)
    for i, k in ipairs(mines) do
        if (k.spell == victim) and (not k.ignited) then
            Players[0]:print(string.format("Mine # %dは爆発した", i));
	        k.ignited = true;
	        ignite_mine(i);
        end
    end
end

function Triggers.projectile_detonated(type, owner, polygon, x, y, z)
    if (type == _mine) then
        spell = Monsters.new(x, y, 0, polygon, _mine);
        spell.active = true;
        Players[0]:play_sound(34, 1);
        numticks = mine_length_min + Game.global_random (90);
        table.insert(mines, {spell=spell, timer=numticks, ignited=false});
    end
end

