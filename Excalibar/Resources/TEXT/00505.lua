--[[ This is for later Camelot levels, and supports potions, Flamer, Excalibur and
      crossbow.  --]]

full_health = 150;

function common_idle()
    life = Players[0].life;
    potions = Players[0].items[_item_epotion];
    if (life < 50) and (potions > 0) then
        Players[0]:play_sound(19,1);
        Players[0].life = life + 2*full_health;
        Players[0].items[_item_epotion] = potions - 1
    end
end
function common_got_item(item, player)
    got_item_sound(item, player, sword, 62);
    got_item_sound(item, player, powerups, 19);
    got_item_sound(item, player, energies, 19);
    if (item == _item_epotion) then
        life = player.life;
        if (life < 50) then
        player:play_sound(19,1);
        player.life = life + 2*full_health;
        player.items[item] = 0;
        end
    end
end

