Triggers = {}

function Triggers.init(restoring)
    entrytime = Game.ticks
end

function Triggers.idle()
    if Game.ticks - entrytime == 150 then
        Players.print("Use Swim key to space walk")
    end
end