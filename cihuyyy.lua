-- NN ANTI AFK | DELTA ULTRA SAFE

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer

local enabled = true

-- ROOT
local gui = Instance.new("ScreenGui")
gui.Name = "NN_SafeUI"
pcall(function()
	gui.Parent = gethui and gethui() or CoreGui
end)

-- MAIN FRAME
local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0,260,0,140)
main.Position = UDim2.new(0.5,-130,0.5,-70)
main.BackgroundColor3 = Color3.fromRGB(35,35,35)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

-- HEADER
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0,30)
header.BackgroundColor3 = Color3.fromRGB(50,50,50)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1,-60,1,0)
title.Position = UDim2.new(0,10,0,0)
title.BackgroundTransparency = 1
title.Text = "NN Anti AFK"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.new(1,1,1)

-- MINIMIZE
local min = Instance.new("TextButton", header)
min.Size = UDim2.new(0,30,1,0)
min.Position = UDim2.new(1,-60,0,0)
min.Text = "-"
min.Font = Enum.Font.SourceSansBold
min.TextSize = 18
min.BackgroundColor3 = Color3.fromRGB(70,70,70)
min.TextColor3 = Color3.new(1,1,1)

-- CLOSE
local close = Instance.new("TextButton", header)
close.Size = UDim2.new(0,30,1,0)
close.Position = UDim2.new(1,-30,0,0)
close.Text = "X"
close.Font = Enum.Font.SourceSansBold
close.TextSize = 16
close.BackgroundColor3 = Color3.fromRGB(120,60,60)
close.TextColor3 = Color3.new(1,1,1)

-- STATUS
local status = Instance.new("TextLabel", main)
status.Position = UDim2.new(0,0,0,45)
status.Size = UDim2.new(1,0,0,30)
status.BackgroundTransparency = 1
status.Text = "Status : ON (Anti AFK aktif)"
status.Font = Enum.Font.SourceSans
status.TextSize = 14
status.TextColor3 = Color3.new(1,1,1)

-- TOGGLE
local toggle = Instance.new("TextButton", main)
toggle.Size = UDim2.new(0.6,0,0,30)
toggle.Position = UDim2.new(0.2,0,1,-40)
toggle.Text = "DISABLE"
toggle.Font = Enum.Font.SourceSansBold
toggle.TextSize = 14
toggle.BackgroundColor3 = Color3.fromRGB(80,140,90)
toggle.TextColor3 = Color3.new(1,1,1)

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		status.Text = "Status : ON (Anti AFK aktif)"
		toggle.Text = "DISABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(80,140,90)
	else
		status.Text = "Status : OFF"
		toggle.Text = "ENABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(90,90,90)
	end
end)

-- LOGO MINIMIZED
local logo = Instance.new("TextButton", gui)
logo.Size = UDim2.new(0,40,0,40)
logo.Position = UDim2.new(0,15,0.5,-20)
logo.Text = "NN"
logo.Font = Enum.Font.SourceSansBold
logo.TextSize = 16
logo.Visible = false
logo.BackgroundColor3 = Color3.fromRGB(50,50,50)
logo.TextColor3 = Color3.new(1,1,1)

min.MouseButton1Click:Connect(function()
	main.Visible = false
	logo.Visible = true
end)

logo.MouseButton1Click:Connect(function()
	main.Visible = true
	logo.Visible = false
end)

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- ANTI AFK CORE
player.Idled:Connect(function()
	if enabled then
		VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		task.wait(1)
		VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	end
end)
