Triggers = {}


function Triggers.init(restoring)
   Game.proper_item_accounting = true
   if restoring then
      Game.restore_saved()
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