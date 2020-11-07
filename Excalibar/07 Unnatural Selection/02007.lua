bad_grog_dead = false;
lair_pod_poly = 218;
first = false
function level_init (rs)
	lair_pod_line = Lines[831];
	Players[0]:play_sound(249, 1);
	if lair_pod_line.counterclockwise_polygon ~= nil and lair_pod_line.counterclockwise_polygon.index == lair_pod_poly then 
		s = lair_pod_line.counterclockwise_side 
	elseif lair_pod_line.clockwise_polygon.index == lair_pod_poly then 
		s = lair_pod_line.clockwise_side 
	end
	if rs then
		return;
	end
	first = true
	remove_items(_item_hightech,  _item_crossbow, _item_snyper, _item_snyper_ammo, 
	_item_dachron, _item_dachron_ammo, _item_spear, _item_rocks);
end
timers = { QuakeTimer(240)}
function level_monster_killed(victim, victor, projectile)
	if (victim.type  == _black_knight) then
		bad_grog_dead = true;
		Players[0]:print("ゾ・ツンバは殺された！");
		s.control_panel.permutation = 3;
	end
end
sound_poly = { 285, 188 }
for _, sp in ipairs(sound_poly)  do
	enter_to[sp] = function() activate_quake_timer(timers[1]) end
end

function level_idle ()
	if first then
		items_to_add = {
			[_item_snyper] = 2,
			[_item_snyper_ammo] = 12,
			[_item_dachron] = 1,
			[_item_dachron_ammo] = 12,
			[_item_spear] = 1,
			[_item_rocks] = 5
		}
		for p in Players()  do
			for k, v in pairs( items_to_add ) do
				p.items[ k ] = v
			end
		end
		first = false
	end	
end
