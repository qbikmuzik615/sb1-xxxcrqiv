local EconomySystem = {}

local ECONOMY_CONFIG = {
    startingMoney = 1000,
    dailyLoginBonus = 100,
    jobPayouts = {
        police = 50,
        chef = 45,
        driver = 40
    }
}

function EconomySystem.init()
    print("EconomySystem initialized")
end

function EconomySystem.addMoney(player, amount)
    local data = player:GetAttribute("GameData")
    if not data then return false, "Player data not found" end
    
    data.money = data.money + amount
    player:SetAttribute("GameData", data)
    return true, "Money added successfully"
end

function EconomySystem.removeMoney(player, amount)
    local data = player:GetAttribute("GameData")
    if not data then return false, "Player data not found" end
    if data.money < amount then return false, "Insufficient funds" end
    
    data.money = data.money - amount
    player:SetAttribute("GameData", data)
    return true, "Money removed successfully"
end

return EconomySystem