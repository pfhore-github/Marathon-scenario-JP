Triggers = {}

function Triggers.init(restoring)
	if restoring and Platforms[68].has_been_activated then
		Music.play("music/gomorrah.mp3")
	end
end

function Triggers.idle()
	if Platforms[68].active then
		Music.play("music/gomorrah.mp3")
	end
end