-- NN ANTI AFK
-- Executor: DELTA
-- Mode: Anti Kick AFK (no auto click)

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
gui.Parent = player:WaitForChild("PlayerGui")

-- ================= MAIN PANEL =================
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 340, 0, 190)
panel.Position = UDim2.new(0, 40, 0.5, -95)
panel.BackgroundColor3 = Color3.fromRGB(18,18,18)
panel.BorderSizePixel = 0
panel.Active = true
panel.Draggable = true
Instance.new("UICorner", panel).CornerRadius = UDim.new(0,14)

-- ================= HEADER =================
local header = Instance.new("Frame", panel)
header.Size = UDim2.new(1,0,0,42)
header.BackgroundColor3 = Color3.fromRGB(26,26,26)
header.BorderSizePixel = 0
Instance.new("UICorner", header).CornerRadius = UDim.new(0,14)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1,-90,1,0)
title.Position = UDim2.new(0,14,0,0)
title.BackgroundTransparency = 1
title.Text = "NN • ANTI AFK"
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextColor3 = Color3.fromRGB(120,200,255)
title.TextXAlignment = Left

-- Minimize
local minBtn = Instance.new("TextButton", header)
minBtn.Size = UDim2.new(0,28,0,28)
minBtn.Position = UDim2.new(1,-64,0.5,-14)
minBtn.Text = "—"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 18
minBtn.BackgroundColor3 = Color3.fromRGB(55,55,55)
minBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0,8)

-- Exit
local exitBtn = Instance.new("TextButton", header)
exitBtn.Size = UDim2.new(0,28,0,28)
exitBtn.Position = UDim2.new(1,-32,0.5,-14)
exitBtn.Text = "X"
exitBtn.Font = Enum.Font.GothamBold
exitBtn.TextSize = 14
exitBtn.BackgroundColor3 = Color3.fromRGB(70,40,40)
exitBtn.TextColor3 = Color3.fromRGB(255,120,120)
Instance.new("UICorner", exitBtn).CornerRadius = UDim.new(0,8)

-- ================= CONTENT =================
local content = Instance.new("Frame", panel)
content.Position = UDim2.new(0,0,0,42)
content.Size = UDim2.new(1,0,1,-42)
content.BackgroundTransparency = 1

local status = Instance.new("TextLabel", content)
status.Position = UDim2.new(0,0,0,20)
status.Size = UDim2.new(1,0,0,26)
status.BackgroundTransparency = 1
status.Text = "Status : OFF ❌"
status.Font = Enum.Font.Gotham
status.TextSize = 13
status.TextColor3 = Color3.fromRGB(220,220,220)

local toggle = Instance.new("TextButton", content)
toggle.Position = UDim2.new(0.2,0,0,65)
toggle.Size = UDim2.new(0.6,0,0,40)
toggle.Text = "ENABLE"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 14
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0,10)

local info = Instance.new("TextLabel", content)
info.Position = UDim2.new(0,16,0,115)
info.Size = UDim2.new(1,-32,0,50)
info.BackgroundTransparency = 1
info.TextWrapped = true
info.TextXAlignment = Left
info.TextYAlignment = Top
info.Font = Enum.Font.Gotham
info.TextSize = 11
info.TextColor3 = Color3.fromRGB(160,160,160)
info.Text =
[[• Mencegah kick AFK
• Tidak auto click
• Aman buka tas / shop
• Stabil & ringan]]

-- ================= LOGO NN =================
local logo = Instance.new("TextButton", gui)
logo.Size = UDim2.new(0,48,0,48)
logo.Position = UDim2.new(0,20,0.5,-24)
logo.Text = "NN"
logo.Font = Enum.Font.GothamBlack
logo.TextSize = 18
logo.TextColor3 = Color3.fromRGB(120,200,255)
logo.BackgroundColor3 = Color3.fromRGB(18,18,18)
logo.Visible = false
logo.Active = true
logo.Draggable = true
Instance.new("UICorner", logo).CornerRadius = UDim.new(1,0)

-- ================= LOGIC =================
local function updateUI()
	if enabled then
		status.Text = "Status : ON 🛡️"
		toggle.Text = "DISABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(70,140,90)
	else
		status.Text = "Status : OFF ❌"
		toggle.Text = "ENABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
	end
end

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	updateUI()
end)

minBtn.MouseButton1Click:Connect(function()
	panel.Visible = false
	logo.Visible = true
end)

logo.MouseButton1Click:Connect(function()
	panel.Visible = true
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
		task.wait(1)
		VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	end
end)
