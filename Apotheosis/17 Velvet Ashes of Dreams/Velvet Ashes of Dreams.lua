Triggers = {}



function Triggers.idle()
   if Platforms[1].active then
      Music.play("music/servo.mp3")
   end
   for p in Players() do
      if p.polygon.type == "zone border" then
         Music.fade(5)
      end
   end
end