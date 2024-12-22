local InteractionSystem = {}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Load sub-modules
local InteractionEvents = require(script.InteractionEvents)
local InteractionHandler = require(script.InteractionHandler)
local ProximityPrompts = require(script.ProximityPrompts)

function InteractionSystem.init()
    InteractionEvents.init()
    InteractionHandler.init()
    ProximityPrompts.init()
    
    -- Set up player interaction handling
    Players.PlayerAdded:Connect(function(player)
        InteractionHandler.setupPlayer(player)
    end)
end

return InteractionSystem