timers = { QuakeTimer(1050, 240) }

function level_init (rs)
	Players[0]:play_sound(249, 1);
end

function level_idle ()
	if Tags[11].active then
		activate_quake_timer(timers[1])
	end
end
