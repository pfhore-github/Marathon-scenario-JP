--[[ this is for early Kronos levels, and supports powerups, spear, Excalibur and
      crossbow. --]]


function common_got_item(item, player)   
   got_item_sound(item, player, sword, 62);
   got_item_sound(item, player, powerups, 228);
   got_item_sound(item, player, energies, 227);
end

