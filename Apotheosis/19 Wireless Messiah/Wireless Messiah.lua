Triggers = {}

function Triggers.init(restoring)
   Game.proper_item_accounting = true
   if restoring then
      if Game.restore_saved() then
         if Level._latch then
            local fade = math.floor(Game.ticks - Level._fadetime) / 30
            if fade < 60 then
               Music.play("music/demesne.mp3")
               Music.fade(60 - fade)
            end
         end
      end
   else
      Level._latch = true
   end
end

function Triggers.idle()
   if Platforms[6].active and Level._latch then
      Music.play("music/demesne.mp3")
   end
   for p in Players() do
      if p.polygon.type == "glue" and Level._latch then
         Music.fade(60)
         Level._latch = false
         Level._fadetime = Game.ticks
      end
   end
end