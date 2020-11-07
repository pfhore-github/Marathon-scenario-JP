timers = { QuakeTimer(240) }
function level_init (rs)
	Players[0]:play_sound(223, 1);
end

sound_poly = { 9, 118, 163, 120, 176, 15, 245 };
for _, sp in ipairs(sound_poly)  do
	enter_to[sp] = function() activate_quake_timer(timers[1]) end
end


function level_idle ()
	player_poly = Players[0].polygon.index;
	if (player_poly == 324) and Players[0].z <= 0 then
		Players[0]:position(.375, -9.125, 4.9, Polygons[35]);
	end
	
	if find_platform(194).active or find_platform(195).active or 
		find_platform(196).active or find_platform(197).active then
		activate_quake_timer(timers[1])
	end
end
