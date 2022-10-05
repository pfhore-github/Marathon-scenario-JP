Triggers = {}

function Triggers.platform_activated(plat)
    if plat.media then -- media are used to link platforms & tag switches
        Tags[plat.media.index].active = true
    end

   if (Tags[2].active or Tags[3].active or Tags[4].active)
   and (Tags[5].active or Tags[6].active or Tags[7].active)
   and (Tags[8].active or Tags[9].active or Tags[10].active) then
      Tags[17].active = true
   end
if (Tags[5].active or Tags[6].active or Tags[7].active) then
Tags[20].active = true
end
if (Tags[2].active or Tags[3].active or Tags[4].active) then
Tags[18].active = true
end
if (Tags[8].active and Tags[9].active) or (Tags[9].active and Tags[10].active) or (Tags[8].active and Tags[10].active) then
Tags[19].active = true
end
if (Tags[2].active and Tags[3].active and Tags[4].active) then
Tags[21].active = true
end
if (Tags[5].active and Tags[6].active and Tags[7].active) then
Tags[22].active = true
end
if (Tags[8].active and Tags[9].active and Tags[10].active) then
Tags[23].active = true
end
end