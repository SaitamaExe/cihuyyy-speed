-- AUTO CLICKER DELTA + UI
-- By: cihuyyy
-- Executor: DELTA

local Players = game:GetService("Players")
local VIM = game:GetService("VirtualInputManager")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local aktif = false
local delay = 0 -- 0 = super cepat

-- ================= UI =================
local gui = Instance.new("ScreenGui")
gui.Name = "CihuyyyAutoClickUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 140)
frame.Position = UDim2.new(0.5, -110, 0.5, -70)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "⚡ CIHUYYY AUTO CLICK"
title.TextColor3 = Color3.fromRGB(255, 85, 85)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.Parent = frame

local status = Instance.new("TextLabel")
status.Position = UDim2.new(0, 0, 0, 40)
status.Size = UDim2.new(1, 0, 0, 25)
status.BackgroundTransparency = 1
status.Text = "Status: OFF ❌"
status.TextColor3 = Color3.fromRGB(200, 200, 200)
status.Font = Enum.Font.Gotham
status.TextSize = 12
status.Parent = frame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Position = UDim2.new(0.1, 0, 0, 75)
toggleBtn.Size = UDim2.new(0.8, 0, 0, 35)
toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggleBtn.Text = "AKTIFKAN"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 14
toggleBtn.Parent = frame

local btnCorner = Instance.new("UICorner", toggleBtn)
btnCorner.CornerRadius = UDim.new(0, 8)

-- ================= LOGIC =================
toggleBtn.MouseButton1Click:Connect(function()
	aktif = not aktif
	if aktif then
		status.Text = "Status: ON 🔥"
		toggleBtn.Text = "MATIKAN"
		toggleBtn.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
	else
		status.Text = "Status: OFF ❌"
		toggleBtn.Text = "AKTIFKAN"
		toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	end
end)

-- Toggle pakai keyboard (F)
UIS.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.F then
		toggleBtn:Activate()
	end
end)

-- ================= AUTO CLICK LOOP =================
task.spawn(function()
	while true do
		if aktif then
			VIM:SendMouseButtonEvent(0, 0, 0, true, game, 0)
			VIM:SendMouseButtonEvent(0, 0, 0, false, game, 0)
		end
		task.wait(delay)
	end
end)
