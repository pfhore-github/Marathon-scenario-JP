timers = { QuakeTimer(240) }
function level_init (rs)
	Players[0]:play_sound(249, 1);
end

function Triggers.platform_activate(poly)
  if poly.index == 317 then
	 find_platform(316).player_controllable = false;
  end
end


sound_poly = { 61, 154, 166, 29, 207, 186 };
for _, sp in ipairs(sound_poly)  do
	enter_to[sp] = function() activate_quake_timer(timers[1]) end
end

