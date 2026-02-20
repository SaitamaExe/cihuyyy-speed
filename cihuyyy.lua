-- NN ANTI AFK (DELTA SAFE / NO BLANK)
-- Simple UI, stable render

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local player = Players.LocalPlayer

-- ================= STATE =================
local enabled = false
local running = true

-- ================= GUI ROOT =================
local gui = Instance.new("ScreenGui")
gui.Name = "NN_AntiAFK"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

-- ================= MAIN FRAME =================
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 260, 0, 140)
frame.Position = UDim2.new(0, 40, 0.5, -70)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- ================= HEADER =================
local header = Instance.new("Frame")
header.Parent = frame
header.Size = UDim2.new(1, 0, 0, 32)
header.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
header.BorderSizePixel = 0

local title = Instance.new("TextLabel")
title.Parent = header
title.Size = UDim2.new(1, -64, 1, 0)
title.Position = UDim2.new(0, 8, 0, 0)
title.BackgroundTransparency = 1
title.Text = "NN • ANTI AFK"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(180, 220, 255)
title.TextXAlignment = Enum.TextXAlignment.Left

local minBtn = Instance.new("TextButton")
minBtn.Parent = header
minBtn.Size = UDim2.new(0, 32, 1, 0)
minBtn.Position = UDim2.new(1, -64, 0, 0)
minBtn.Text = "-"
minBtn.Font = Enum.Font.SourceSansBold
minBtn.TextSize = 22
minBtn.TextColor3 = Color3.new(1,1,1)
minBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

local exitBtn = Instance.new("TextButton")
exitBtn.Parent = header
exitBtn.Size = UDim2.new(0, 32, 1, 0)
exitBtn.Position = UDim2.new(1, -32, 0, 0)
exitBtn.Text = "X"
exitBtn.Font = Enum.Font.SourceSansBold
exitBtn.TextSize = 18
exitBtn.TextColor3 = Color3.fromRGB(255, 150, 150)
exitBtn.BackgroundColor3 = Color3.fromRGB(80, 40, 40)

-- ================= CONTENT =================
local status = Instance.new("TextLabel")
status.Parent = frame
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0, 40)
status.BackgroundTransparency = 1
status.Text = "Status : OFF"
status.Font = Enum.Font.SourceSans
status.TextSize = 16
status.TextColor3 = Color3.fromRGB(230, 230, 230)

local toggle = Instance.new("TextButton")
toggle.Parent = frame
toggle.Size = UDim2.new(0.6, 0, 0, 36)
toggle.Position = UDim2.new(0.2, 0, 0, 80)
toggle.Text = "ENABLE"
toggle.Font = Enum.Font.SourceSansBold
toggle.TextSize = 18
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

-- ================= LOGO NN =================
local logo = Instance.new("TextButton")
logo.Parent = gui
logo.Size = UDim2.new(0, 48, 0, 48)
logo.Position = UDim2.new(0, 20, 0.5, -24)
logo.Text = "NN"
logo.Font = Enum.Font.SourceSansBold
logo.TextSize = 20
logo.TextColor3 = Color3.fromRGB(180, 220, 255)
logo.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
logo.Visible = false
logo.Active = true
logo.Draggable = true

-- ================= LOGIC =================
local function updateUI()
	if enabled then
		status.Text = "Status : ON (Anti AFK)"
		toggle.Text = "DISABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(70, 140, 90)
	else
		status.Text = "Status : OFF"
		toggle.Text = "ENABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	end
end

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	updateUI()
end)

minBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
	logo.Visible = true
end)

logo.MouseButton1Click:Connect(function()
	frame.Visible = true
	logo.Visible = false
end)

exitBtn.MouseButton1Click:Connect(function()
	running = false
	enabled = false
	gui:Destroy()
end)

-- ================= ANTI AFK CORE =================
player.Idled:Connect(function()
	if enabled then
		VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		task.wait(0.5)
		VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	end
end)
