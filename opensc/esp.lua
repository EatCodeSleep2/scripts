_G.EspEnabled = true
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local function createBillboard(player)
    if not player.Character or player.Character:FindFirstChild("Head")then return end
        local char = player.Character or player.CharacterAdded:Wait()
            local bill = Instance.new("BillboardGui")
            bill.Name = "EspName"
            bill.Parent = char.Head
            bill.AlwaysOnTop = true
            bill.LightInfluence = 0
            bill.Size = UDim2.new(0, 100, 0, 20)
            bill.StudsOffset = Vector3.new(0, 1.7, 0)
            
            local namel = Instance.new("TextLabel")
            namel.Name = "esptext"
            namel.Parent = bill
            namel.Size = UDim2.new(1, 0, 1, 0)
            namel.Font = Enum.Font.SourceSansSemibold
            namel.TextScaled = true
            namel.Text = tostring(player.Name)
            namel.BackgroundTransparency = 1
            namel.TextColor3 = player.TeamColor.Color

            local chams = Instance.new("Highlight")
            chams.Name = "chamelem"
            chams.Parent = char
            chams.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            chams.Enabled = true
            chams.FillColor = Color3.fromRGB(255,0,0)
            chams.FillTransparency = 0.1
            chams.OutlineTransparency = 1
end

-- Create billboards for all existing players
for i, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createBillboard(player)
    end
end

-- Connect to PlayerAdded event to create billboards for new players
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createBillboard(player)
        player.CharacterAdded:Connect(function(char)
            createBillboard(player)
        end)
    end
end)
