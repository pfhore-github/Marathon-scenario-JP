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
   if Platforms[6].active then
      Music.play("music/demesne.mp3")
   end
   for p in Players() do
      if p.polygon.type == "glue" and Level._latch then
         Music.fade(60)
         Level._latch = false
      end
   end
end