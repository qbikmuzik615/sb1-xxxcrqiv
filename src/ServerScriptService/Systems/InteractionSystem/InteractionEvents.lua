local InteractionEvents = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create RemoteEvents for client-server communication
function InteractionEvents.init()
    local events = Instance.new("Folder")
    events.Name = "InteractionEvents"
    
    -- House interactions
    local houseEvents = Instance.new("RemoteEvent")
    houseEvents.Name = "HouseInteraction"
    houseEvents.Parent = events
    
    -- Vehicle interactions
    local vehicleEvents = Instance.new("RemoteEvent")
    vehicleEvents.Name = "VehicleInteraction"
    vehicleEvents.Parent = events
    
    events.Parent = ReplicatedStorage
end

return InteractionEvents