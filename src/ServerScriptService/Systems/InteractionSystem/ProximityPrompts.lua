local ProximityPrompts = {}

function ProximityPrompts.init()
    -- Initialize proximity prompt templates
end

function ProximityPrompts.createHousePrompt(house)
    local prompt = Instance.new("ProximityPrompt")
    prompt.ObjectText = "House"
    prompt.ActionText = "Enter"
    prompt.HoldDuration = 0.5
    prompt.RequiresLineOfSight = true
    
    prompt.Triggered:Connect(function(player)
        local events = game:GetService("ReplicatedStorage"):WaitForChild("InteractionEvents")
        events.HouseInteraction:FireServer("enter", house.id)
    end)
    
    prompt.Parent = house.PrimaryPart
    return prompt
end

function ProximityPrompts.createVehiclePrompt(vehicle)
    local prompt = Instance.new("ProximityPrompt")
    prompt.ObjectText = "Vehicle"
    prompt.ActionText = "Enter"
    prompt.HoldDuration = 0.5
    prompt.RequiresLineOfSight = true
    
    prompt.Triggered:Connect(function(player)
        local events = game:GetService("ReplicatedStorage"):WaitForChild("InteractionEvents")
        events.VehicleInteraction:FireServer("enter", vehicle.id)
    end)
    
    prompt.Parent = vehicle.PrimaryPart
    return prompt
end

return ProximityPrompts