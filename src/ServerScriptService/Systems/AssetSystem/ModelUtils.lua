local ModelUtils = {}

function ModelUtils.setupCollision(model)
    for _, part in ipairs(model:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CollisionGroup = model.Name
        end
    end
end

function ModelUtils.setupAnchoring(model, anchored)
    for _, part in ipairs(model:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Anchored = anchored
        end
    end
end

function ModelUtils.cloneModel(model)
    local clone = model:Clone()
    ModelUtils.setupCollision(clone)
    return clone
end

return ModelUtils