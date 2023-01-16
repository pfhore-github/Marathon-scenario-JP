Triggers = {}

function Triggers.init(restoring)
	if restoring and Platforms[14].has_been_activated then
		Music.play("music/isaac.mp3")
	end
end

function Triggers.idle()
   if Platforms[14].active then
      Music.play("music/isaac.mp3")
   end
end