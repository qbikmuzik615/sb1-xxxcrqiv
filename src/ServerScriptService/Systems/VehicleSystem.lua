local VehicleSystem = {}

local VEHICLE_TEMPLATES = {
    basic_car = {
        name = "Basic Car",
        price = 1000,
        modelId = "rbxassetid://BASIC_CAR_ID", -- Replace with actual asset ID
        speed = 50
    },
    police_car = {
        name = "Police Car",
        price = 2000,
        modelId = "rbxassetid://POLICE_CAR_ID", -- Replace with actual asset ID
        speed = 60
    }
}

function VehicleSystem.init()
    print("VehicleSystem initialized")
end

function VehicleSystem.purchaseVehicle(player, vehicleType)
    local data = player:GetAttribute("GameData")
    local vehicle = VEHICLE_TEMPLATES[vehicleType]
    
    if not vehicle then return false, "Invalid vehicle type" end
    if not data then return false, "Player data not found" end
    if data.money < vehicle.price then return false, "Insufficient funds" end
    
    -- Process purchase
    data.money = data.money - vehicle.price
    table.insert(data.ownedVehicles, vehicleType)
    player:SetAttribute("GameData", data)
    
    return true, "Vehicle purchased successfully"
end

function VehicleSystem.spawnVehicle(player, vehicleType)
    local vehicle = VEHICLE_TEMPLATES[vehicleType]
    -- Implement vehicle spawning logic here
end

return VehicleSystem