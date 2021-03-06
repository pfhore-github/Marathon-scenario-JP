elemental_scrolls = false;
drawbridge_up = false;

function level_init (rs)
	drawbridge = find_platform(132);
	Players[0]:play_sound(104, 1);
	if rs then
		return;
	end
	remove_items(_item_wand, _item_magic_scroll);
	items_to_add = {
		[_item_snyper] = 2,
		[_item_snyper_ammo] = 1,
		[_item_dachron] = 1,
		[_item_dachron_ammo] = 1,
		[_item_spear] = 1,
		[_item_rocks] = 1
	}
	for k,v in pairs(items_to_add) do
		Players[0].items[k] = v
	end
end

function level_idle ()
	--[[ If piranha caught on drawbridge when it comes up, kill it --]]
	if not drawbridge_up then
		if (drawbridge.floor_height == 0) then
			drawbridge_up = true;
			for g in Monsters() do
				if (g.type == _piranha) then
					if drawbridge == g.polygons then
						g:damage(200);
					end
				end
			end
		end
	end
	n  = Players[0].items[_item_magic_scroll];
	if (n >= 4) and (not elemental_scrolls) then
		Players[0]:print('すべての４つの基本の巻き物を拾った！');
		Players[0]:play_sound(233, 1);
		elemental_scrolls = true;
		if (Players[0].life < 150) then
	 		Players[0].life = 150
		end
	end
end
