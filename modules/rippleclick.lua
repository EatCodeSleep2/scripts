local MouseClickEffect = {}

local function Tween(OBJInstance,Goal,Duration)
 local ts = game:GetService("TweenService")
 local T = ts:Create(OBJInstance,TweenInfo.new(Duration),Goal)
 T:Play()
end

function MouseClickEffect.AddEffect(GUIInstance,Mouse,Duration)
 if GUIInstance.ClipsDescendants == false then
  GUIInstance.ClipsDescendants = true
 end
 if GUIInstance.AutoButtonColor == true then
  GUIInstance.AutoButtonColor = false
 end
 local MX,MY = Mouse.X,Mouse.Y
 local ASX,ASY = GUIInstance.AbsoluteSize.X,GUIInstance.AbsoluteSize.Y
 local XScale = (- ASX + MX) / ASX
 local YScale = ((- ASY + MY) / ASY)-3
 local effect = script.Effect:Clone()
 effect.Parent = GUIInstance
 effect.Position = UDim2.fromScale(XScale,YScale)
 local maxsize = math.max(ASX,ASY)*3
 effect:TweenSize(UDim2.fromOffset(maxsize,maxsize),"Out","Sine",Duration)
 Tween(effect,{BackgroundTransparency = 1},Duration)
 wait(Duration)
 effect:Destroy()
end

return MouseClickEffect
