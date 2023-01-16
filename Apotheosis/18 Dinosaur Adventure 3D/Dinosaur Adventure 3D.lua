Triggers = {}

function Triggers.init(restoring)
	Game.proper_item_accounting = true
	if restoring and Platforms[1].has_been_activated then
		Music.play("music/brut.mp3")
	end
end

function Triggers.idle()
	if Platforms[1].active then
		Music.play("music/brut.mp3")
	end
end