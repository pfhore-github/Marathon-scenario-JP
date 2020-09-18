regen_ticker = 0

Triggers = {}

function Triggers.cleanup()
   for p in Players() do
      p.items["alien weapon ammo"] = 0
   end
   for p in Players() do
      if p.items["pistol ammo"] < 8 and p.items["pistol"] > 0 then
         p.items["pistol ammo"] = 8
      end
      if p.items["fusion pistol ammo"] < 3 and p.items["fusion pistol"] > 0 then
         p.items["fusion pistol ammo"] = 3
      end
      if p.items["smg ammo"] < 2 and p.items["smg"] > 0 then
         p.items["smg ammo"] = 2
      end
      if p.items["assault rifle ammo"] < 3 and p.items["assault rifle"] > 0 then
         p.items["assault rifle ammo"] = 3
      end
      if p.items["assault rifle grenades"] < 2 and p.items["assault rifle"] > 0 then
         p.items["assault rifle grenades"] = 2
      end
   end
end

function Triggers.idle()
   for p in Players() do
      if p.z < -0.01 and not p.dead then
         p:damage(1,"suffocation")
      end
      if p.z < -2.00 and not p.dead then
         p:damage(3,"suffocation")
      end
   end
   for m in Monsters() do
      if m.z < -0.01 and not m.dead and not m.player then
         m:damage(4,"suffocation")
      end
      if m.z < -2.00 and not m.dead and not m.player then
         m:damage(8,"suffocation")
      end
      if m.z < -2.00 and not m.player then
         m.external_velocity = 0
      end
   end
   for p in Players() do
      if p.extravision_duration > 0 then
         if regen_ticker == 0 and p.life < 150 and not p.dead then
            p.life = p.life + 1
         end
         if regen_ticker == 1 and p.life < 150 and not p.dead then
            p.life = p.life + 1
         end
         if regen_ticker == 2 and p.life < 300 and not p.dead then
            p.life = p.life + 1
         end
         if regen_ticker == 3 and p.life < 450 and not p.dead then
            p.life = p.life + 1
         end
      end
      if p.invincibility_duration == 4998 then
         p.invincibility_duration = 0
      end
      if p.action_flags.right_trigger and not p.dead then
         if p.weapons.current.type == "alien weapon" and p.weapons["alien weapon"].secondary.rounds > 0 then
            p.invincibility_duration = 5000
         end
      end
   end
   regen_ticker = regen_ticker + 1
   if regen_ticker > 3 then
      regen_ticker = 0
   end
end

function Triggers.got_item(item,player)
   if item.mnemonic == "alien weapon ammo" then
      for p in Players() do
         p.items["extravision"] = p.items["extravision"] + 1
      end
   end
   if item == "infravision" then
      player.infravision_duration = 0
      player.items["infravision"] = 0
      player.extravision_duration = 1350
   end
end