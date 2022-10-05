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
   if Platforms[1].active then
      Music.play("music/brut.mp3")
   end
end