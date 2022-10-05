Triggers = {}



function Triggers.idle()
   if Platforms[68].active then
      Music.play("music/gomorrah.mp3")
   end
   for p in Players() do
      if p.polygon.type == "glue" then
         Music.fade(5)
      end
   end
end