-- NN ANTI AFK - CLEAN PANEL UI (DELTA SAFE)
-- Layout inspired by modern sidebar hub

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer

local enabled = false

-- ===== GUI ROOT (COREGUI) =====
local gui = Instance.new("ScreenGui")
gui.Name = "NN_AntiAFK_UI"
pcall(function()
	gui.Parent = gethui and gethui() or CoreGui
end)

-- ===== MAIN PANEL =====
local panel = Instance.new("Frame")
panel.Parent = gui
panel.Size = UDim2.new(0, 420, 0, 220)
panel.Position = UDim2.new(0.5, -210, 0.5, -110)
panel.BackgroundColor3 = Color3.fromRGB(20,20,20)
panel.BorderSizePixel = 0
panel.Active = true
panel.Draggable = true

-- ===== HEADER =====
local header = Instance.new("Frame", panel)
header.Size = UDim2.new(1,0,0,38)
header.BackgroundColor3 = Color3.fromRGB(28,28,28)
header.BorderSizePixel = 0

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1,-80,1,0)
title.Position = UDim2.new(0,12,0,0)
title.BackgroundTransparency = 1
title.Text = "NN HUB"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(140,200,255)
title.TextXAlignment = Left

local minBtn = Instance.new("TextButton", header)
minBtn.Size = UDim2.new(0,32,1,0)
minBtn.Position = UDim2.new(1,-64,0,0)
minBtn.Text = "-"
minBtn.Font = Enum.Font.SourceSansBold
minBtn.TextSize = 22
minBtn.BackgroundColor3 = Color3.fromRGB(55,55,55)
minBtn.TextColor3 = Color3.new(1,1,1)

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0,32,1,0)
closeBtn.Position = UDim2.new(1,-32,0,0)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 18
closeBtn.BackgroundColor3 = Color3.fromRGB(80,40,40)
closeBtn.TextColor3 = Color3.fromRGB(255,150,150)

-- ===== SIDEBAR =====
local sidebar = Instance.new("Frame", panel)
sidebar.Position = UDim2.new(0,0,0,38)
sidebar.Size = UDim2.new(0,100,1,-38)
sidebar.BackgroundColor3 = Color3.fromRGB(24,24,24)
sidebar.BorderSizePixel = 0

local infoBtn = Instance.new("TextButton", sidebar)
infoBtn.Size = UDim2.new(1,0,0,42)
infoBtn.Text = "INFO"
infoBtn.Font = Enum.Font.SourceSansBold
infoBtn.TextSize = 15
infoBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
infoBtn.TextColor3 = Color3.fromRGB(200,200,200)

local afkBtn = Instance.new("TextButton", sidebar)
afkBtn.Position = UDim2.new(0,0,0,42)
afkBtn.Size = UDim2.new(1,0,0,42)
afkBtn.Text = "ANTI AFK"
afkBtn.Font = Enum.Font.SourceSansBold
afkBtn.TextSize = 15
afkBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
afkBtn.TextColor3 = Color3.fromRGB(200,200,200)

-- ===== CONTENT =====
local content = Instance.new("Frame", panel)
content.Position = UDim2.new(0,100,0,38)
content.Size = UDim2.new(1,-100,1,-38)
content.BackgroundTransparency = 1

-- INFO PAGE
local infoPage = Instance.new("TextLabel", content)
infoPage.Size = UDim2.new(1,-20,1,-20)
infoPage.Position = UDim2.new(0,10,0,10)
infoPage.BackgroundTransparency = 1
infoPage.TextWrapped = true
infoPage.TextXAlignment = Left
infoPage.TextYAlignment = Top
infoPage.Font = Enum.Font.SourceSans
infoPage.TextSize = 15
infoPage.TextColor3 = Color3.fromRGB(220,220,220)
infoPage.Text =
[[NN Anti-AFK
• Aman AFK lama
• Tidak auto click
• Tidak ganggu UI game
• Delta-safe]]

-- AFK PAGE
local afkPage = Instance.new("Frame", content)
afkPage.Visible = false
afkPage.BackgroundTransparency = 1

local status = Instance.new("TextLabel", afkPage)
status.Size = UDim2.new(1,0,0,40)
status.Position = UDim2.new(0,0,0,20)
status.BackgroundTransparency = 1
status.Font = Enum.Font.SourceSansBold
status.TextSize = 18
status.TextColor3 = Color3.fromRGB(220,220,220)
status.Text = "Status : OFF"

local toggle = Instance.new("TextButton", afkPage)
toggle.Size = UDim2.new(0.6,0,0,42)
toggle.Position = UDim2.new(0.2,0,0,80)
toggle.Font = Enum.Font.SourceSansBold
toggle.TextSize = 18
toggle.Text = "ENABLE"
toggle.BackgroundColor3 = Color3.fromRGB(70,70,70)
toggle.TextColor3 = Color3.new(1,1,1)

-- ===== TAB LOGIC =====
infoBtn.MouseButton1Click:Connect(function()
	infoPage.Visible = true
	afkPage.Visible = false
end)

afkBtn.MouseButton1Click:Connect(function()
	infoPage.Visible = false
	afkPage.Visible = true
end)

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		status.Text = "Status : ON"
		toggle.Text = "DISABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(70,140,90)
	else
		status.Text = "Status : OFF"
		toggle.Text = "ENABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(70,70,70)
	end
end)

-- ===== MINIMIZE TO LOGO =====
local logo = Instance.new("TextButton", gui)
logo.Size = UDim2.new(0,48,0,48)
logo.Position = UDim2.new(0,20,0.5,-24)
logo.Text = "NN"
logo.Font = Enum.Font.SourceSansBold
logo.TextSize = 20
logo.BackgroundColor3 = Color3.fromRGB(20,20,20)
logo.TextColor3 = Color3.fromRGB(140,200,255)
logo.Visible = false
logo.Active = true
logo.Draggable = true

minBtn.MouseButton1Click:Connect(function()
	panel.Visible = false
	logo.Visible = true
end)

logo.MouseButton1Click:Connect(function()
	panel.Visible = true
	logo.Visible = false
end)

closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- ===== ANTI AFK CORE =====
player.Idled:Connect(function()
	if enabled then
		VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		task.wait(1)
		VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	end
end)
