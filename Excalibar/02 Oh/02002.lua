
timers = { QuakeTimer(120)  }

function level_init (rs)
	Players[0]:play_sound(249, 1);
	if rs then
		return;
	end
	remove_items(_item_spear, _item_rocks, _item_crossbow, _item_crossbow_bolts);
end


sound_poly = { 40, 55, 56, 91, 83, 169, 167, 190, 163 };
for _, sp in ipairs(sound_poly)  do
	enter_to[sp] = function() activate_quake_timer( timers[1] ) end
end

