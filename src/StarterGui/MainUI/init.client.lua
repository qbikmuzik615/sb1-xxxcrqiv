local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create main UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlueHavenUI"

-- Create main menu button
local menuButton = Instance.new("TextButton")
menuButton.Size = UDim2.new(0, 100, 0, 50)
menuButton.Position = UDim2.new(0, 10, 0, 10)
menuButton.Text = "Menu"
menuButton.Parent = screenGui

-- Add menu functionality
local menuOpen = false
menuButton.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    -- Toggle menu visibility
end)

screenGui.Parent = playerGui