-- NN ANTI AFK | CLEAN UI | DELTA SAFE

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer

local enabled = false

-- ROOT GUI
local gui = Instance.new("ScreenGui")
gui.Name = "NN_AntiAFK"
pcall(function()
	gui.Parent = gethui and gethui() or CoreGui
end)

-- MAIN FRAME (STRUKTUR ASLI, JANGAN DIUBAH)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 260, 0, 140)
frame.Position = UDim2.new(0, 30, 0.5, -70)
frame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- HEADER
local header = Instance.new("TextLabel", frame)
header.Size = UDim2.new(1, 0, 0, 34)
header.BackgroundColor3 = Color3.fromRGB(36, 36, 44)
header.Text = "  NN • ANTI AFK"
header.Font = Enum.Font.SourceSansBold
header.TextSize = 18
header.TextXAlignment = Enum.TextXAlignment.Left
header.TextColor3 = Color3.fromRGB(220, 225, 255)

-- STATUS
local status = Instance.new("TextLabel", frame)
status.Position = UDim2.new(0, 0, 0, 50)
status.Size = UDim2.new(1, 0, 0, 26)
status.BackgroundTransparency = 1
status.Text = "Status : OFF"
status.Font = Enum.Font.SourceSans
status.TextSize = 16
status.TextColor3 = Color3.fromRGB(230, 230, 230)

-- TOGGLE BUTTON
local toggle = Instance.new("TextButton", frame)
toggle.Position = UDim2.new(0.2, 0, 1, -45)
toggle.Size = UDim2.new(0.6, 0, 0, 32)
toggle.Text = "ENABLE"
toggle.Font = Enum.Font.SourceSansBold
toggle.TextSize = 17
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BackgroundColor3 = Color3.fromRGB(90, 90, 110)

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		status.Text = "Status : ON"
		toggle.Text = "DISABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(80, 150, 110)
	else
		status.Text = "Status : OFF"
		toggle.Text = "ENABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(90, 90, 110)
	end
end)

-- ANTI AFK CORE
player.Idled:Connect(function()
	if enabled then
		VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		task.wait(1)
		VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	end
end)
