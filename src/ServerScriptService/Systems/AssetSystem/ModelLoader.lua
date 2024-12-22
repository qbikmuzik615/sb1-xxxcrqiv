local ModelLoader = {}

local AssetConfig = require(script.Parent.AssetConfig)

function ModelLoader.loadModel(assetId, parent)
    local success, model = pcall(function()
        return game:GetService("InsertService"):LoadAsset(assetId)
    end)
    
    if success then
        model.Parent = parent
        return model
    else
        warn("Failed to load model:", assetId)
        return nil
    end
end

function ModelLoader.loadHouses(parent)
    local houses = Instance.new("Folder")
    houses.Name = "Houses"
    houses.Parent = parent
    
    for name, config in pairs(AssetConfig.houses) do
        ModelLoader.loadModel(config.id, houses)
    end
end

function ModelLoader.loadVehicles(parent)
    local vehicles = Instance.new("Folder")
    vehicles.Name = "Vehicles"
    vehicles.Parent = parent
    
    for name, config in pairs(AssetConfig.vehicles) do
        ModelLoader.loadModel(config.id, vehicles)
    end
end

function ModelLoader.loadFurniture(parent)
    local furniture = Instance.new("Folder")
    furniture.Name = "Furniture"
    furniture.Parent = parent
    
    for name, config in pairs(AssetConfig.furniture) do
        ModelLoader.loadModel(config.id, furniture)
    end
end

return ModelLoader