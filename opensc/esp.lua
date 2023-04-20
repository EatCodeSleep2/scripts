--This is Made by Catimyth (CatOnLua)

--If you are going to use, please give credits to me, CatOnLua.

--chams us the highlight instance on roblox

--Alpha Release v1.0.1

-- Global Variables - Can Be used in your own scripts
_G.EspEnabled = true
_G.UpdateTime = 0.1
_G.AllowSameTeam = true
_G.ChamsEnabled = true
_G.ChamsColor = Color3.fromRGB(255,0,0) -- make sure to use fromRGB when you set the Color DEFAULT RED

--Local Variables
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

--creates the esp for the player when ran
function createBillboard(player)
    if not player.Character then return end
    if player.Character:FindFirstChild("Head") then
    if _G.EspEnabled == true then
            local char = player.Character or player.CharacterAdded:Wait()
            local bill = Instance.new("BillboardGui")
            bill.Name = "EspName"
            bill.Parent = char:WaitForChild("Head")
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

            if _G.ChamsEnabled then
                local chams = Instance.new("Highlight")
                chams.Name = "chamelem"
                chams.Parent = char
                chams.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                chams.Enabled = true
                chams.FillColor = _G.ChamsColor
                chams.FillTransparency = 0.1
                chams.OutlineTransparency = 1
            end
    end
end
end

spawn(function()
    while task.wait(_G.UpdateTime) do -- Update
        if _G.EspEnabled == false then
            for i,v in ipairs(game:GetService("Players"):GetChildren()) do
                if v.Character then
                    if v.Character:FindFirstChild("Head"):FindFirstChild("EspName") then
                        v.Character:FindFirstChild("Head"):FindFirstChild("EspName"):Destroy()
                    end
                    if v.Character:FindFirstChild("Head"):FindFirstChild("chamelem") then
                         v.Character:FindFirstChild("Head"):FindFirstChild("chamelem"):Destroy()
                    end
                end
            end
        elseif _G.EspEnabled == true then  -- updates current esp
            for i,v in ipairs(game:GetService("Players"):GetChildren()) do
                if v.Character then
                    if v.Character:FindFirstChild("Head"):FindFirstChild("EspName") then
                    end
                    if v.Character:FindFirstChild("Head"):FindFirstChild("chamelem") then
                    end
                end
            end
        end
    end
end)

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
