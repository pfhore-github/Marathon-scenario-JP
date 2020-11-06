--[[ this is for early Kronos levels, and supports powerups, spear, Excalibur and
      crossbow. --]]


sword = { _item_sword };
powerups = { _item_invisible, _item_invincible, _item_nightvision };
energies = { _item_2x_powerup, _item_3x_powerup };
function common_got_item(item, player)   
   got_item_sound(item, player, sword, 62);
   got_item_sound(item, player, powerup, 228);
   got_item_sound(item, player, energies, 227);
end

