local raw_g = rawget

local h={
    [2716819792] = true; -- prov
    [212230462] = true; -- silver
    [116372050] = true; -- finxcil
    
    [482149247] = true; -- galxcil
    
    [39561905] = true; -- jason
    
    [865412341] = true; -- voiceok
    
    [161773639] = true; -- voriants
    
    [237339225] = true; -- iwakuu
    
    [546475944] = true; -- eternal
    
    [2725127221] = true; -- someonexcil 
    
    [172727666] = true; -- 444xcil 

}

table.freeze(h)

if raw_g == rawget then
    if raw_g(h,game:GetService("Players")["LocalPlayer"]["UserId"]) then
                
-- script here   

        HttpService = game:GetService("HttpService")
        Webhook_URL = "https://discord.com/api/webhooks/1048162902273708032/Gl79WaZvjcxP-EGPPMjBUcojhAct6NUQsAnRFtPR2C8eROu6a0ektX4dbyJMgr80Y00o"
        
        local responce = syn.request(
        {
            Url = Webhook_URL,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = HttpService:JSONEncode({
                ["content"] = "",
                ["embeds"] = {{
                    ["title"] = "**MYSWARE has been executed!**",
                    ["description"] = "Whitelisted User **"..game.Players.LocalPlayer.Name.."** has successfully executed MYSWARE 10000.",
                    ["type"] = "rich",
                    ["color"] = tonumber(4972305),
                    ["fields"] = {
                        {
                            ["name"] = "Hardware ID:",
                            ["value"] = "||"..game:GetService("RbxAnalyticsService"):GetClientId().."||",
                            ["inline"] = true
                        }
                    }
                }}
            })
        }
        )
        
        _G.Handle_Size = 6 -- Size for X, Y, Z
        _G.Handle_Check = true -- Fake Handle Check (Currently Not Working)
        
        _G.Visualizer_Visible = false -- Determines whether ur visualizer is visible or not.
        _G.Visualizer_Transparency = 0.4 -- Transparency of the visualizer, number has to be between 0 - 1
        _G.Visualizer_Color = Color3.new(0,0,0) -- Visualizer color.
        
        _G.AMP_Enabled = false -- Determines whether fti will be used or not.
        _G.Hit_Debounce = 0.05 -- Debounce between firetouchinterest/fti
        _G.Filter_Limbs = false -- Prevents FTI on fake limbs.
        
        _G.Raise_Size = "j" -- Raises the X, Y, Z values on key press.
        _G.Lower_Size = "k" -- Lowers the X, Y, Z values on key press.
        _G.AMP_Toggle = "g" -- FTI toggle on key press.
        _G.Visualizer_Toggle = "h" -- Visualizer toggle on key press.
        
        local Terrain = game:GetService("Workspace"):WaitForChild("Terrain")
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local Mouse = LocalPlayer:GetMouse()
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local Backpack = LocalPlayer.Backpack
        local Services = {"Teams", "StarterPack", "ReplicatedStorage"}
        local Limbs = {"HumanoidRootPart", "Head", "Right Arm", "Left Arm", "Right Leg", "Left Leg", "Torso"}
        
        local function IndexedProperties()
            for _,v in pairs(Services) do
                local serv = game:FindFirstChild(v)
                if serv then
                    for _, obj in pairs(serv:GetDescendants()) do
                        if obj:IsA("Tool") and obj:FindFirstChildOfClass("Part") then
                            local t = obj
                            return {
                                ["Size"] = t.Handle.Size,
                                ["CanCollide"] = t.Handle.CanCollide,
                                ["Massless"] = t.Handle.Massless
                            }
                        end
                    end
                end
            end
        end
        
        local Handle; do
            if Character:FindFirstChildOfClass("Tool") then
                Handle = Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle")
            elseif Backpack:FindFirstChildOfClass("Tool") then
                Handle = Backpack:FindFirstChildOfClass("Tool"):FindFirstChild("Handle")
            end
        end
        
        local function OnCharacterAdded(PCharacter)
            wait(0.5)
            Character = PCharacter
            do
                if PCharacter:FindFirstChildWhichIsA("Tool") then
                    Handle = PCharacter:FindFirstChildOfClass("Tool"):FindFirstChild("Handle")
                elseif Backpack:FindFirstChildWhichIsA("Tool") then
                    Handle = Backpack:FindFirstChildOfClass("Tool"):FindFirstChild("Handle")
                end
        
            end
        
            Handle.Touched:Connect(function(Limb)
                pcall(function()
                    if _G.AMP_Enabled then
                        if not Limb.Parent:FindFirstChildOfClass("Humanoid") or Limb.Parent == Character then
                            return
                        end
                        if _G.Filter_Limbs then
                            for _,x in pairs(Limbs) do
                                if Limb.Name == x then
                                    local LimbToFTI = Limb
                                    firetouchinterest(Handle, Limb, 0)
                                    wait(_G.Hit_Debounce)
                                    firetouchinterest(Handle, Limb, 1)
                                end
                            end
                        else
                            local LimbToFTI = Limb
                            firetouchinterest(Handle, Limb, 0)
                            wait(_G.Hit_Debounce)
                            firetouchinterest(Handle, Limb, 1)
                        end
                    end
                end)
            end)
        end
        
        local DefaultProps = IndexedProperties() -- had to declare here, cant do it in the meta hook since it'll cause cstack overflow
        --[[local function FilterObject(Object) 
            for _,v in pairs(Limbs) do 
                if Object.Name == v then 
                    return true
                end
            end 
        end
        
        local function IndexHandles()
            local Index = {}
            local Handle; do
                if Character:FindFirstChildOfClass("Tool") then
                    Handle = Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle")
                elseif Backpack:FindFIrstChildOfClass("Tool") then
                    Handle = Backpack:FindFirstChildOfClass("Tool"):FindFirstChild("Handle")
                end
            end
        
            for _,v in pairs(Handle:GetConnectedParts()) do
                if FilterObject(v) then return end
                Index[#Index+1] = v
            end
        
            if #Index == 0 then
                return Handle
            end
        
            return Index
        end--]]
        
        local function ChangeVal(Object, Property, Value)
            local Connections = {}
            for i,v in pairs({unpack(getconnections(Object.Changed)),unpack(getconnections(Object:GetPropertyChangedSignal(Property)))}) do
                table.insert(Connections,v)
            end
        
            for i,v in pairs(Connections) do
                v:Disable()
            end
            Object[Property] = Value
            for i,v in pairs(Connections) do
                v:Enable()
            end
        end
        
        local function FilterProperty(Prop) return Prop:split("\000")[1] end
        
        local CloneSpy; CloneSpy = hookmetamethod(game, "__namecall", function(self,...)
            local a = {...}
            local m = getnamecallmethod()
            if not checkcaller() and tostring(m):lower() == "clone" and self == Handle then
                local SpoofedInstance = Instance.new("Part")
                SpoofedInstance.Size = DefaultProps.Size
                SpoofedInstance.Massless = DefaultProps.Massless
                SpoofedInstance.CanCollide = DefaultProps.CanCollide
                return SpoofedInstance
            end
            return CloneSpy(self, ...)
        end)
        
        local PropertySpy; PropertySpy = hookmetamethod(game, "__index", function(self, key)
            if not checkcaller() and self == Handle then
                if FilterProperty(tostring(key):lower()) == "size" then
                    return DefaultProps.Size
                elseif FilterProperty(tostring(key):lower()) == "cancollide" then
                    return DefaultProps.CanCollide
                elseif FilterProperty(tostring(key):lower()) == "Massless" then
                    return DefaultProps.Massless
                end
            end
            return PropertySpy(self, key)
        end)
        local Part; do
            if _G.Visualizer_Visible then
                Part = Instance.new("SelectionSphere", Terrain)
            else
                Part = nil
            end
        end
        
        if Part ~= nil then
            Part.SurfaceColor3 = _G.Visualizer_Color
            Part.SurfaceTransparency = 0
            Part.SurfaceTransparency = _G.Visualizer_Transparency
            Part.Transparency = 1
        end
        
        Mouse.KeyDown:Connect(function(Key)
            if tostring(Key) == _G.Visualizer_Toggle then
                _G.Visualizer_Visible = not _G.Visualizer_Visible
                game.StarterGui:SetCore("SendNotification", {Title = "mysware";Text = "Visible State: " .. tostring(_G.Visualizer_Visible);Duration = 2;})
            elseif tostring(Key) == _G.Raise_Size then
                _G.Handle_Size = _G.Handle_Size + 0.5
                game.StarterGui:SetCore("SendNotification", {Title = "mysware";Text = "Handle Size: " .. tostring(_G.Handle_Size);Duration = 2;})
            elseif tostring(Key) == _G.Lower_Size then
                _G.Handle_Size = _G.Handle_Size - 0.5
                game.StarterGui:SetCore("SendNotification", {Title = "mysware";Text = "Handle Size: " .. tostring(_G.Handle_Size);Duration = 2;})
            elseif tostring(Key) == _G.AMP_Toggle then
                _G.AMP_Enabled = not _G.AMP_Enabled
                game.StarterGui:SetCore("SendNotification", {Title = "mysware";Text = "AMP State: " .. tostring(_G.AMP_Enabled);Duration = 2;})
            end
        end)
        local Connection; Connection = game:GetService("RunService").Stepped:Connect(function()
                --for _,v in pairs(IndexHandles()) do
                    --if not v then return end
                    --pcall(function()
                   pcall(function()
                
                    do
                        if Character:FindFirstChildOfClass("Tool") then
                            Handle = Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle")
                        elseif Backpack:FindFirstChildOfClass("Tool") then
                            Handle = Backpack:FindFirstChildOfClass("Tool"):FindFirstChild("Handle")
                        end
                    end
                        local v = Handle
                        ChangeVal(v, "Massless", true)
                        ChangeVal(v, "CanCollide", false)
                        --if v.Size ~= Vector3.new(_G.Handle_Size, _G.Handle_Size, _G.Handle_Size) then
                            ChangeVal(v, "Size", Vector3.new(_G.Handle_Size, _G.Handle_Size, _G.Handle_Size))
                        --end
                        if _G.Visualizer_Visible then
                            Part.Adornee = v
                        else
                            if Part ~= nil then Part.Adornee = nil end
                        end
                    end)
        end)
        
        OnCharacterAdded(Character)
        LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)

        
    else
        HttpService = game:GetService("HttpService")
        Webhook_URL = "https://discord.com/api/webhooks/1048162902273708032/Gl79WaZvjcxP-EGPPMjBUcojhAct6NUQsAnRFtPR2C8eROu6a0ektX4dbyJMgr80Y00o"
        
        local responce = syn.request(
        {
            Url = Webhook_URL,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = HttpService:JSONEncode({
                ["content"] = "",
                ["embeds"] = {{
                    ["title"] = "**MYSWARE has been executed!**",
                    ["description"] = "Un-whitelisted User **"..game.Players.LocalPlayer.Name.."** has failed to executed MYSWARE 10000.",
                    ["type"] = "rich",
                    ["color"] = tonumber(0xff1100),
                    ["fields"] = {
                        {
                            ["name"] = "Hardware ID:",
                            ["value"] = "||"..game:GetService("RbxAnalyticsService"):GetClientId().."||",
                            ["inline"] = true
                        }
                    }
                }}
            })
        }
        )
        return
    end
else
    return
end
