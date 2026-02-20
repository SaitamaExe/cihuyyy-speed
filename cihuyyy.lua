-- AUTO CLICKER DELTA
-- Toggle: F
-- Speed: SUPER CEPAT

local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")

local aktif = false
local delay = 0 -- 0 = secepat frame (maksimal)

-- Notif Delta
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "CIHUYYY AUTO CLICK",
        Text = "Tekan F untuk ON / OFF",
        Duration = 3
    })
end)

-- Toggle
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F then
        aktif = not aktif
        pcall(function()
            game.StarterGui:SetCore("SendNotification", {
                Title = "AUTO CLICK",
                Text = aktif and "AKTIF 🔥" or "MATI ❌",
                Duration = 2
            })
        end)
    end
end)

-- Loop klik super cepat
task.spawn(function()
    while true do
        if aktif then
            VIM:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            VIM:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        end
        task.wait(delay)
    end
end)
