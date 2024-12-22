local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Load core systems
local PlayerSystem = require(script.Parent.Systems.PlayerSystem)
local HousingSystem = require(script.Parent.Systems.HousingSystem)
local VehicleSystem = require(script.Parent.Systems.VehicleSystem)

-- Initialize core systems when server starts
PlayerSystem.init()
HousingSystem.init()
VehicleSystem.init()

-- Handle player joining
Players.PlayerAdded:Connect(function(player)
    PlayerSystem.handleJoin(player)
end)

-- Handle player leaving
Players.PlayerRemoving:Connect(function(player)
    PlayerSystem.handleLeave(player)
end)