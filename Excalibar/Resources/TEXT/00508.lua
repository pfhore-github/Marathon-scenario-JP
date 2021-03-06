--[[ This is primarily for Jurassic, and supports apples, powerups, spear, and
      crossbow. --]]

last_weapon = -1;
_item_apples = _item_water_vial;
function common_init(rs) 
    full_health = 150;
    triple_health = 450;
    if (Game.difficulty.index == 0) then
        apple_power = 100;
    elseif (Game.difficulty.index == 1) then
        apple_power = 75;
    elseif (Game.difficulty.index == 2) then
        apple_power = 50;
    else
        apple_power = 25;
    end
end


function common_got_item(item, player)
    got_item_sound(item, player, powerups, 19);
    got_item_sound(item, player, energies, 19);
    if (item == _item_apples) then
        player:play_sound(229,1);
        life = player.life;
        if (life >= full_health) then
	        new_life = life + 10 + Game.global_random(5)
        else
	        new_life = life + apple_power + Game.global_random(25)
        end
        if (new_life > full_health) and (life < full_health) then
	        new_life = full_health;
        end
        if new_life > triple_health then
            new_life = triple_health;
        end
        player.life = new_life;
        player.items[item] = 0;
    end
end

