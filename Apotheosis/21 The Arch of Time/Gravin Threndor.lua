Triggers = {}

function Triggers.init()
    Game.proper_item_accounting = true
    if not Tags[1].active then
        Level.fog.depth = 80
    end
    Level.fog.color.r = 0.9
    Level.fog.color.g = 0.05
    Level.fog.color.b = 0.1
    Level.fog.active = true
end

function Triggers.idle()
    if Tags[1].active and Level.fog.depth > 5 then
        Level.fog.depth = Level.fog.depth - 0.04
    end
end