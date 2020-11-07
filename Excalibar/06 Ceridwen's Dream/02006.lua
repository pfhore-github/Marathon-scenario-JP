glass_broken = false;
music_on = true;
ceridwen_theme = "Cavern/M06.mp3";

function level_init (rs)
   Players[0]:play_sound(252, 1);
end

enter_to[564] = function()
   if music_on then
      Music.fade(60/1000);
      music_on = false;
   end
end

enter_to[536] = function()
   if not music_on then
      Music.play(ceridwen_theme);
      music_on = true;
   end
end

function level_idle ()
   if (not Lights[31].active) and (not glass_broken) then
      Players[0]:play_sound(186, 1);
      glass_broken = true;
   end
end

