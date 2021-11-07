-- Fog script by Aaron Freed (mostly)
function levelfog()
	-- decrement time remaining until next explosion
	fogtimer = fogtimer - 1

	-- fog brightness and depth is going to vary a bit
	if darken then
		if red > .1 then
			-- reduce fog brightness
			red = red - 0.0005
			green = green - 0.00025
			depth = depth - 0.05
		else
			-- we've gotten as dark as we're getting; time to start incrementing again
			darken = false
		end
	elseif red < .2 then
		-- increase fog brightness
		red = red + 0.0005
		green = green + 0.00025
		depth = depth + 0.05
	else
		-- we've gotten as bright as we're getting outside an explosion; time to start decrementing again
		darken = true
	end

	if fogtimer == 42 then
		-- time for explosion! (brought to you by Michael Bay)
		pitch = (200 + Game.random(200)) / 300
		for p in Players() do
			p:play_sound("juggernaut exploding", pitch)
		end
	end

	if fogtimer > 42 then
		-- outside of explosion interval - use normal fog behaviour
		Level.fog.color.r = red
		Level.fog.color.g = green
		Level.fog.color.b = blue
		Level.fog.depth = depth
	else
		-- an explosion just happened - employ flicker effect
		mult = 1 + (fogtimer * (300 + Game.random(300)) / 6300)
		Level.fog.color.r = red * mult
		Level.fog.color.g = green * mult
		Level.fog.color.b = blue * mult
		Level.fog.depth = depth
	end

	if fogtimer == 0 then
		-- set a new random interval before the next explosion
		fogtimer = 420 + Game.random(666)
	end
end

Triggers = {}

function Triggers.got_item(type, player)

	if type == "pistol" then
		if player.items["pistol"] > 2 then
			player.items["pistol"] = 2
			player.items["pistol ammo"] = player.items["pistol ammo"] + 1
		end

	elseif type == "fusion pistol" then
		if player.items["fusion pistol"] > 1 then
			player.items["fusion pistol"] = 1
			player.items["pistol ammo"] = player.items["pistol ammo"] + 1
		end

	elseif type == "assault rifle" then
		if player.items["assault rifle"] > 1 then
			player.items["assault rifle"] = 1
			player.items["assault rifle ammo"] = player.items["assault rifle ammo"] + 1
		end

	elseif type == "missile launcher" then
		if player.items["missile launcher"] > 1 then
			player.items["missile launcher"] = 1
			player.items["missile launcher ammo"] = player.items["missile launcher ammo"] + 1
			player.items["assault rifle grenades"] = player.items["assault rifle grenades"] + 1
		end

	elseif type == "alien weapon" then
		if player.items["alien weapon"] > 1 then
			player.items["alien weapon"] = 1
			player.items["shotgun ammo"] = player.items["shotgun ammo"] + 1
		end

	elseif type == "flamethrower" then
		if player.items["flamethrower"] > 1 then
			player.items["flamethrower"] = 1
			player.items["flamethrower ammo"] = player.items["flamethrower ammo"] + 1
		end

	elseif type == "shotgun" then
		if player.items["shotgun"] > 2 then
			player.items["shotgun"] = 2
			player.items["smg ammo"] = player.items["smg ammo"] + 1
		end

	elseif type == "smg" then
		if player.items["smg"] > 1 then
			player.items["smg"] = 1
			player.items["smg ammo"] = player.items["smg ammo"] + 1
		end

	elseif type == "assault rifle ammo" then
		if player.items["assault rifle"] < 1 then
			player.items["assault rifle ammo"] = player.items["assault rifle ammo"] - 1
			player.items["assault rifle"] = 1
		end

	elseif type == "assault rifle grenades" then
		if player.items["missile launcher"] < 1 then
			player.items["assault rifle grenades"] = player.items["assault rifle grenades"] - 1
			player.items["missile launcher"] = 1
		end

	elseif type == "missile launcher ammo" then
		if player.items["missile launcher"] < 1 then
			player.items["missile launcher ammo"] = player.items["missile launcher ammo"] - 1
			player.items["missile launcher"] = 1
		else
			player.items["assault rifle grenades"] = player.items["assault rifle grenades"] + 1
		end

	elseif type == "shotgun ammo" then
		if player.items["alien weapon"] < 1 then
			player.items["shotgun ammo"] = player.items["shotgun ammo"] - 1
			player.items["alien weapon"] = 1
		end

	elseif type == "flamethrower ammo" then
		if player.items["flamethrower"] < 1 then
			player.items["flamethrower ammo"] = player.items["flamethrower ammo"] - 1
			player.items["flamethrower"] = 1
		end

	elseif type == "fusion pistol ammo" then
		player.items["fusion pistol ammo"] = 0
		player.items["pistol ammo"] = player.items["pistol ammo"] + 1
	
	elseif type == "alien weapon ammo" then
		player.items["alien weapon ammo"] = 0
		if player.items["flamethrower ammo"] > player.items["shotgun ammo"] then
			player.items["shotgun ammo"] = player.items["shotgun ammo"] + 1
		else
			player.items["flamethrower ammo"] = player.items["flamethrower ammo"] + 1
		end
	end
end

function Triggers.player_damaged(victim, aggressor_player, aggressor_monster, damage_type, damage_amount, projectile)
	if projectile and (victim.weapons.current.type == "smg" or victim.weapons.current.type == "shotgun") then
		if projectile.type == "shotgun bullet" or projectile.type == "smg bullet" then
			victim.life = victim.life + damage_amount
		end
	end
end

function Triggers.init(restoring)
	Game.proper_item_accounting = true
	fogtimer = 420
	pitch = .5
	red = .2
	green = .1
	depth = 42
	blue = 0
	darken = true
	Level.fog.active = true
	Level.fog.present = true
	Level.fog.color.r = red
	Level.fog.color.g = green
	Level.fog.color.b = blue
	Level.fog.depth = depth
	Level.fog.affects_landscapes = true
end

function Triggers.idle()
	levelfog()
	for p in Players() do
		if p.extravision_duration <= 1 then
			p.extravision_duration = 2 -- we want players to have extravision throughout the course of this level, because it's a dream
		end
	end
end