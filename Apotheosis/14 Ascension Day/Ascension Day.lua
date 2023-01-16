Triggers = {}

function Triggers.init(restoring)
	Game.proper_item_accounting = true
	if restoring then
		if not Game.restore_saved() then
			restored = false -- something went wrong and we didn't get the saved game data
		else
			restored = true
		end
		if Platforms[39].has_been_activated and (Level._latch == true or restored == false) then
			--[[ we'll play the music if:
				(1) platform 39 has been turned on, AND
				(2) one of:
					(a) we failed to restore saved game data, OR:
					(b) we both:
						(i) restored saved game data and
						(ii) haven't ever walked over a glue polygon
			... that was a mouthful --]]
			Music.play("music/nexus.mp3")
		end
	else
		Level._latch = true
	end
end

function Triggers.idle()
	if Platforms[39].active then
		Music.play("music/nexus.mp3")
	end
	for p in Players() do
		if p.polygon.type == "glue" and Level._latch then
			Music.fade(10)
			Level._latch = false
		end
	end
end