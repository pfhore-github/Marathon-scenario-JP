wall_busted = false;
timers = { Timer{
    nearly = { 15, function(v)
        theta = Game.global_random (360);
        vel = (Game.global_random(130+v*0.5))/10000;
        Players[0]:accelerate(theta, vel, 0);
    end }, done = { 90, function() end } } }
function level_init (rs)
	weak_brick = find_platform(355);
    Players[0]:play_sound(251, 1);   
end
function level_idle ()
    if weak_brick.active and (not wall_busted) then
        timers[1]:start()
        wall_busted = true;
        Players[0]:play_sound(226, 1);
    end
end

