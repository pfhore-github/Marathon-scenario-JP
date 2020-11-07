timers = { QuakeTimer(500, 240)}
main_quake = false;

function level_init(rs)
	Players[0]:play_sound(249, 1);
end
enter_to[198] = function() 
	if timers[1].value == 0 and not main_quake then
		main_quake = true;
		activate_quake_timer(timers[1])
	end
end

function level_idle()
	if timers[1].value == 250 then
		Players[0]:play_sound( 226, 1)
	end	
end

function Triggers.terminal_exit(terminal, player)
   if (terminal.index == 0) then
      Music.fade(60/1000);
      Music.play("Cavern/Lament.mp3");
   end
end