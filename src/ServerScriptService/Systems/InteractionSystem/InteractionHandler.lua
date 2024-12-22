local InteractionHandler = {}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Systems
local HousingSystem = require(script.Parent.Parent.HousingSystem)
local VehicleSystem = require(script.Parent.Parent.VehicleSystem)

function InteractionHandler.init()
    local events = ReplicatedStorage:WaitForChild("InteractionEvents")
    
    -- Handle house interactions
    events.HouseInteraction.OnServerEvent:Connect(function(player, action, houseId)
        if action == "enter" then
            HousingSystem.enterHouse(player, houseId)
        elseif action == "exit" then
            HousingSystem.exitHouse(player, houseId)
        end
    end)
    
    -- Handle vehicle interactions
    events.VehicleInteraction.OnServerEvent:Connect(function(player, action, vehicleId)
        if action == "enter" then
            VehicleSystem.enterVehicle(player, vehicleId)
        elseif action == "exit" then
            VehicleSystem.exitVehicle(player, vehicleId)
        end
    end)
end

function InteractionHandler.setupPlayer(player)
    -- Set up player-specific interaction handling
    local character = player.Character or player.CharacterAdded:Wait()
    -- Add any player-specific interaction setup here
end

return InteractionHandler