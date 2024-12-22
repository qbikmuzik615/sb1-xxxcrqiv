local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local PlayerData = DataStoreService:GetDataStore("BlueHaven_PlayerData")

local PlayerSystem = {}

local DEFAULT_DATA = {
    money = 1000,
    ownedHouses = {},
    ownedVehicles = {},
    settings = {
        walkSpeed = 16,
        jumpPower = 50
    }
}

function PlayerSystem.init()
    print("PlayerSystem initialized")
end

function PlayerSystem.handleJoin(player)
    -- Load or create player data
    local success, data = pcall(function()
        return PlayerData:GetAsync(player.UserId)
    end)
    
    if not success or not data then
        data = DEFAULT_DATA
    end
    
    -- Store data in session
    player:SetAttribute("GameData", data)
    
    -- Set up character
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.WalkSpeed = data.settings.walkSpeed
        humanoid.JumpPower = data.settings.jumpPower
    end)
end

function PlayerSystem.handleLeave(player)
    -- Save player data
    local data = player:GetAttribute("GameData")
    if data then
        pcall(function()
            PlayerData:SetAsync(player.UserId, data)
        end)
    end
end

return PlayerSystem