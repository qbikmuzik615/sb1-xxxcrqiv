local HousingSystem = {}

local HOUSE_TEMPLATES = {
    basic = {
        name = "Basic House",
        price = 2500,
        modelId = "rbxassetid://BASIC_HOUSE_ID" -- Replace with actual asset ID
    },
    premium = {
        name = "Premium House",
        price = 5000,
        modelId = "rbxassetid://PREMIUM_HOUSE_ID" -- Replace with actual asset ID
    }
}

function HousingSystem.init()
    print("HousingSystem initialized")
end

function HousingSystem.purchaseHouse(player, houseType)
    local data = player:GetAttribute("GameData")
    local house = HOUSE_TEMPLATES[houseType]
    
    if not house then return false, "Invalid house type" end
    if not data then return false, "Player data not found" end
    if data.money < house.price then return false, "Insufficient funds" end
    
    -- Process purchase
    data.money = data.money - house.price
    table.insert(data.ownedHouses, houseType)
    player:SetAttribute("GameData", data)
    
    -- Spawn house
    HousingSystem.spawnHouse(player, houseType)
    
    return true, "House purchased successfully"
end

function HousingSystem.spawnHouse(player, houseType)
    local house = HOUSE_TEMPLATES[houseType]
    -- Implement house spawning logic here
end

return HousingSystem