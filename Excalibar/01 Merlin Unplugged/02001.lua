door_locked = true;
bob_safe = false;
bob_timer = 0;

camelot_holodeck = 453;
camelot_program = 721;
camelot_exit = 826;
camelot_holodeck_return = 451;
holodeck_arrows1 = 452;
holodeck_arrows2 =  449;

jurassic_holodeck = 850;
jurassic_program = 180;
jurassic_exit = 256;
jurassic_holodeck_return = 310;

holodeck_raptor1 = 640;
holodeck_raptor2 = 642;
holodeck_spear = 851;

bob_rest = 80;
bob_start = 164;
bob_trigger = 124;
bob_safety = 905;
quake_poly = 240;

timers = { QuakeTimer( 256, 240, 226, 
function() 
    rock_poly = find_platform(242);
    rock_poly.active = true;
end ) 
}

function level_init (rs)
	bob_door = find_platform(163);
	

	camelot_light = Lights[45];
	jurassic_light = Lights[46];
	maintdoor_light = Lights[47];
	Players[0]:play_sound(99, 1);
    bob = find_monster(_maint_bob);
    
        
	if bob then
		bob_poly = bob.polygon.index;
		bob_safe = (poly == bob_safety);
	else
		bob_poly = nil;
		bob_safe = true;
	end
	door_locked = not bob_door.player_controllable;
    if rs then
        if camelot_light.active then
            enter_to[camelot_holodeck] = nil
        end
        if jurassic_light.active then
            enter_to[jurassic_visit] = nil
        end
	end

end

enter_to[bob_trigger] =	function() 
	if (bob_poly == bob_rest) and bob then
		bob:position(-13.5, -12, 0, bob_start);
		Players[0]:play_sound(114, 1);
		Players[0]:play_sound(261, 1);
		bob_poly = bob_start;
	end
end

enter_to[quake_poly] = function()
	activate_quake_timer(timers[1])
    enter_to[quake_poly] = nil
end

enter_to[camelot_holodeck] = function()
    enter_to[camelot_holodeck] = nil
    camelot_light.active = true;
    Players.print('ホロデックプログラム起動：キャメロット');
    Players[0].yaw = 45;
    Players[0].pitch = 360;
    Players[0]:teleport(camelot_program);
end

enter_to[camelot_exit] = function()
    Players.print('ホロデックプログラム解除：キャメロット')
    new_item_at(_item_crossbow_bolts, holodeck_arrows1)
    new_item_at(_item_crossbow_bolts, holodeck_arrows2)
    Players[0].yaw = 270
    Players[0].pitch = 360
    Players[0]:teleport(camelot_holodeck_return)
end

enter_to[jurassic_holodeck] = function()
    enter_to[jurassic_holodeck] = nil 
    jurassic_light.active = true;
    Players.print('ホロデックプログラム起動：ジュラ紀');
    Players[0].yaw = 0;
    Players[0].pitch = 360;
    Players[0]:teleport(jurassic_program);
end

enter_to[jurassic_exit] = function()
    Players.print('ホロデックプログラム解除：ジュラ紀');
    new_item_at(_item_spear, holodeck_spear);
    new_monster_at(_minor_raptor, holodeck_raptor1, 90);
    new_monster_at(_minor_raptor, holodeck_raptor2, 90);
    Players[0].yaw = 270;
    Players[0].pitch = 360;
end

function level_idle ()
	if door_locked and (bob_door.active or bob_safe) then
		bob_door.player_controllable = true;
		door_locked = false;
		if not bob_safe then
			maintdoor_light.active = true;
			Players.print('ドアのロックは解除された');
		end
	end
	if (not door_locked) and bob and bob.valid then
		if bob_timer > -1 then
			bob_timer = bob_timer + 1;
		end
		dist = (bob.x - Players[0].x)^2 + (bob.y - Players[0].y)^2;
		wu_dist = math.sqrt(dist);
		if (wu_dist <= 2) and (bob_timer > 90) then
			bob:damage(201, "suffocation");
			bob_safe = true;
			bob_timer = -1;
		end
	end
	if camelot_light.active and door_locked then
		bob_door.active = true;
		door_locked = false;
	end	
end
