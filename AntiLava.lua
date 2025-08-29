pcall(function()
    local player = game.Players.LocalPlayer  

    local function AntiLava(character)
        if not character then return end  
        character:WaitForChild("Humanoid")  

        task.delay(2, function()
            pcall(function()
                sethiddenproperty(player, "DFlintTouchSenderMaxBandWidthBps", -1)
                sethiddenproperty(player, "DFlintPhysicsSenderMaxBandWidthBps", -1)
            end)

            for _, v in pairs(character:GetDescendants()) do  
                if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then  
                    v.CanCollide = false  
                    v.CanTouch = false  
                end  
            end  

            for _, module in pairs(game:GetDescendants()) do
                if module:IsA("ModuleScript") and string.find(module.Name:lower(), "hitbox") then
                    module:Destroy()
                end
            end

            game.StarterGui:SetCore("SendNotification", {  
                Title = "🌋 Anti lava!";  
                Text = "Kích hoạt thành công!";  
                Duration = 5;  
            })
        end)
    end

    if player.Character then
        AntiLava(player.Character)
    end  

    player.CharacterAdded:Connect(AntiLava)
end)
player.CharacterAdded:Connect(AntiLava)
