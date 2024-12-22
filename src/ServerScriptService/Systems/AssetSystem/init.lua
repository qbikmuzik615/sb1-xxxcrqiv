local AssetSystem = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Load sub-modules
local ModelLoader = require(script.ModelLoader)
local AssetConfig = require(script.AssetConfig)

function AssetSystem.init()
    -- Create assets container
    local assets = Instance.new("Folder")
    assets.Name = "GameAssets"
    assets.Parent = ReplicatedStorage
    
    -- Load all game models
    ModelLoader.loadHouses(assets)
    ModelLoader.loadVehicles(assets)
    ModelLoader.loadFurniture(assets)
end

return AssetSystem