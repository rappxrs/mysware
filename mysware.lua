local uiLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jasvnn/Roblox/main/VapeUI%20Edit"))()

-- local getgenv().Reach = 5

-- BYPASSES

-- STORA BYPASS

-- local _hook
-- _hook = hookfunc(getrenv().wait, newcclosure(function(...)
--     local self = {...}
--     if self[1] == 1 and getcallingscript().Parent == nil then
--         return coroutine.yield()
--     end
--     return _hook(...)
-- end))



-- TITLE
local win = uiLib:Window("mYs^","10.0",Color3.fromRGB(255, 0, 0), Enum.KeyCode.RightControl)


-- TAB 1 all the buttons and shit

-- local tab = win:Tab("Tab 1")

-- tab:Button("Button", function()
-- lib:Notification("Notification", "Hello!", "Hi!")
-- end)

-- tab:Toggle("Toggle",false, function(t)
-- print(t)
-- end)

-- tab:Slider("Slider",0,100,30, function(t)
-- print(t)
-- end)

-- tab:Dropdown("Dropdown",{"Option 1","Option 2","Option 3","Option 4","Option 5"}, function(t)
-- print(t)
-- end)

-- tab:Colorpicker("Colorpicker",Color3.fromRGB(255,0,0), function(t)
-- print(t)
-- end)

-- tab:Textbox("Textbox",true, function(t)
-- print(t)
-- end)

-- tab:Bind("Bind",Enum.KeyCode.RightShift, function()
-- print("Pressed!")
-- end)

-- tab:Label("Label")


-- TAB 2

-- local tab2 = win:Tab("Autoclicker")

-- tab2:Bind("Bind",Enum.KeyCode.RightShift, function()
-- print("Pressed!") -- code goes here
-- end)




-- TAB 3

-- local tab3 = win:Tab("Reach")

-- tab3:Dropdown("Dropdown",{"Option 1","Option 2","Option 3","Option 4","Option 5"}, function(t)
-- print(t)
-- if t == "Option 1" then
    
  
    
--     local function getLimbs(char)
--     for i,v in pairs(char:GetChildren()) do
--         if v:IsA("Part") or v.Name == "Head" or v.Name == "Left Leg" or v.Name == "Right Leg" or v.Name == "Left Arm" or v.Name == "Right Arm" or v.Name == "Torso" or v.Name == "HumanoidRootPart" then
--             tab = {}
--             table.insert(tab, v)
--         end
--     end
--     return tab
-- end

-- local function hit(handle, limb)
--     firetouchinterest(handle, limb, 0)
--     firetouchinterest(handle, limb, 1)
--     firetouchinterest(handle, limb, 0)
-- end

-- getgenv().Reach = nil

-- local Debounce = 0.2
-- local LastHit = os.clock()
-- game:GetService("RunService").Stepped:Connect(function()
--     local Player = game.Players.LocalPlayer
--     local Character = Player.Character
--     local Sword = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--     pcall(function()
--         for i,v in pairs(game.Players:GetPlayers()) do
--             if v ~= Player and v.Character.Humanoid.Health > 0 and Character.Humanoid.Health > 0 then
--                 Current = os.clock()
--                 if (v.Character.HumanoidRootPart.Position - Sword.Handle.Position).Magnitude <= _G.Reach then
--                     Limbs = getLimbs(v.Character)
--                     RLO = Limbs[math.random(0,#Limbs)]
--                     RLT = Limbs[math.random(0,#Limbs)]
--                     coroutine.wrap(hit)(Sword.Handle, RLO)
--                     coroutine.wrap(hit)(Sword.Handle, RLT)
--                     LastHit = Current
--                 end
--             end
--         end
--     end)
-- end)
-- end
-- end)

-- tab3:Slider("Studs",0,100,30, function(t)
-- print(t)
-- getgenv().Reach = t
-- end)

-- tab3:Toggle("Visualiser",false, function(t)
-- print(t)
-- if FloorB then return else
--             local drawingLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/ESPs/main/3D%20Drawing%20Api.lua"))()
--             FloorB = drawingLib:New3DSquare()
--             FloorB.Visible = true
--             FloorB.ZIndex = 1
--             FloorB.Filled = false
--             FloorB.Transparency = 0
--             FloorB.Thickness = 5
--             FloorB.Size = Vector3.new(getgenv().Reach,getgenv().Reach,getgenv().Reach)
--             wait()
--             coroutine.wrap(
--                 function()
--                     game:GetService("RunService").Stepped:Connect(function()
--                         if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
--                             FloorB.Size = Vector3.new(getgenv().ftiSize,getgenv().ftiSize,getgenv().ftiSize)
--                             FloorB.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 2.95, 0)
--                             FloorB.Rotation = game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation
--                             FloorB.Color = getgenv().VisualiserColour
--                             FloorB.Transparency = 1
--                         else
--                             FloorB.Transparency = 0
--                             FloorB.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 2.95, 0)
--                             FloorB.Rotation = game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation
--                         end
--                     end)
--                 end
--             )()
--         end
-- end)

local tabB = win:Tab("Sword Baseplate")

tabB:Button("Bypass Stora", function()
local _hook
_hook = hookfunc(getrenv().wait, newcclosure(function(...)
local self = {...}
if self[1] == 1 and getcallingscript().Parent == nil then
    return coroutine.yield()
end
return _hook(...)
end))

game.StarterGui:SetCore("SendNotification", {
            Title = "Stora Bypass - LOADED";
            Text = "FUCK DEEZ KIDS";
            Duration = 3;
        })

end)

tabB:Toggle("Toggle",false, function(t)
local _________T___ = {
    coroutine.running
}
local ___________ = 0
local ____________ = 1
local _____________ = game.Players.LocalPlayer.Character
local __________ = MaximumSimulationRadius and SetSimulationRadius
__________ = math.huge or Vector3.new(math.huge,math.huge,math.huge)
local Sword = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") or game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
local ________ = firetouchinterest or fireradius or firesignal
local ______ = 15
if ___ == ___ then
    game:GetService("RunService").Stepped:Connect(function()
        local _____ = game.Players.LocalPlayer
        local ____ = _____.Character
        local Sword = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") or game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
        pcall(function()
            for __,_ in pairs(game.Players:GetPlayers()) do
                if _ ~= _____ then
                    if (_.Character.HumanoidRootPart.Position - ____.HumanoidRootPart.Position).Magnitude <= ______ and _.Character.Humanoid.Health > 0 then
                        for _,______________ in pairs(_.Character:GetChildren()) do
                            if ______________:IsA("Part") then
                                _________T___[1](________(Sword.Handle, ______________, 0))
                                _________T___[1](________(Sword.Handle, ______________, 1))
                                _________T___[1](________(Sword.Handle, ______________, 0))
                            end
                        end
                    end 
                end
            end
        end)
    end)
end

game.StarterGui:SetCore("SendNotification", {
            Title = "Reach Enabled";
            Text = "fuk dem up";
            Duration = 3;
        })

end)

-- local changeclr = win:Tab("Change UI Color")

-- changeclr:Colorpicker("Change UI Color",Color3.fromRGB(255, 0, 0), function(t)
-- lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
-- end)
