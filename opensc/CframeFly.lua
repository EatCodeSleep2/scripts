-- Credits to the creators of Infinite Yield

--I made it runnable through your guis

--Cframe Fly

--Variables
local plr = game.Players.LocalPlayer

CFspeed = 50 -- speed default (you could make this global if you want to easily change it through your ui lib but make sure to change all of the script if u do

--enable it
plr.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
local Head = plr.Character:WaitForChild("Head")
Head.Anchored = true
if CFloop then CFloop:Disconnect() end
  CFloop = RunService.Heartbeat:Connect(function(deltaTime)
    local moveDirection = plr.Character:FindFirstChildOfClass('Humanoid').MoveDirection * (CFspeed * deltaTime)
    local headCFrame = Head.CFrame
    local cameraCFrame = workspace.CurrentCamera.CFrame
    local cameraOffset = headCFrame:ToObjectSpace(cameraCFrame).Position
    cameraCFrame = cameraCFrame * CFrame.new(-cameraOffset.X, -cameraOffset.Y, -cameraOffset.Z + 1)
    local cameraPosition = cameraCFrame.Position
    local headPosition = headCFrame.Position

    local objectSpaceVelocity = CFrame.new(cameraPosition, Vector3.new(headPosition.X, cameraPosition.Y, headPosition.Z)):VectorToObjectSpace(moveDirection)
    Head.CFrame = CFrame.new(headPosition) * (cameraCFrame - cameraPosition) * CFrame.new(objectSpaceVelocity)
end)
--end cframe fly
if CFloop then
    CFloop:Disconnect()
    plr.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
    local Head = plr.Character:WaitForChild("Head")
    Head.Anchored = false
end
