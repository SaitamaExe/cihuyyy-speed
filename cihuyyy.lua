-- NN ANTI AFK (COREGUI FIX - DELTA)

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer

local enabled = false

-- ================= GUI ROOT =================
local gui = Instance.new("ScreenGui")
gui.Name = "NN_AntiAFK"

-- PARENT KE COREGUI (INI KUNCI)
pcall(function()
	gui.Parent = gethui and gethui() or CoreGui
end)

-- ================= FRAME =================
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 240, 0, 120)
frame.Position = UDim2.new(0, 30, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- TITLE
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.BackgroundColor3 = Color3.fromRGB(45,45,45)
title.Text = "NN • ANTI AFK"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(200,220,255)

-- STATUS
local status = Instance.new("TextLabel", frame)
status.Position = UDim2.new(0,0,0,40)
status.Size = UDim2.new(1,0,0,25)
status.BackgroundTransparency = 1
status.Text = "Status : OFF"
status.Font = Enum.Font.SourceSans
status.TextSize = 16
status.TextColor3 = Color3.new(1,1,1)

-- TOGGLE
local toggle = Instance.new("TextButton", frame)
toggle.Position = UDim2.new(0.2,0,0,75)
toggle.Size = UDim2.new(0.6,0,0,30)
toggle.Text = "ENABLE"
toggle.Font = Enum.Font.SourceSansBold
toggle.TextSize = 18
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BackgroundColor3 = Color3.fromRGB(70,70,70)

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		status.Text = "Status : ON"
		toggle.Text = "DISABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(80,140,90)
	else
		status.Text = "Status : OFF"
		toggle.Text = "ENABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(70,70,70)
	end
end)

-- ================= ANTI AFK =================
player.Idled:Connect(function()
	if enabled then
		VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		task.wait(1)
		VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	end
end)
