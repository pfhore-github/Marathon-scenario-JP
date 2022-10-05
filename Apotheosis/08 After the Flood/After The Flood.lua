

Triggers = {}

function Triggers.idle()
   for p in Players() do
      if p.z < -1.00 and not p.dead then
         p:damage(150,"suffocation")
      end
   end
end
