--[[ This is for later Kronos levels, and supports powerups, Flamer, Excalibur and
      crossbow.  --]]

sword_play = true;
mixed_bag = false;

function common_got_item(item, player)
    if (item == _item_sword) and sword_play then
        player:play_sound(62,1);
    end
    if (item == _item_invisible) and mixed_bag then
        player:play_sound(19,1);
    else
        got_item_sound(item, player, powerups, 228);
    end
    if (item == _item_2x_powerup) and mixed_bag then
        player:play_sound(19,1);
    else
        got_item_sound(item, player, energies, 227);
    end
end

