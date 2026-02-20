-- NN ANTI AFK | MODERN UI | DELTA SAFE

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer

local enabled = false

-- ROOT GUI
local gui = Instance.new("ScreenGui")
gui.Name = "NN_UI"
pcall(function()
	gui.Parent = gethui and gethui() or CoreGui
end)

-- MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 320, 0, 180)
main.Position = UDim2.new(0.5, -160, 0.5, -90)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

-- TOP BAR
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,36)
top.BackgroundColor3 = Color3.fromRGB(35,35,35)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,-80,1,0)
title.Position = UDim2.new(0,12,0,0)
title.BackgroundTransparency = 1
title.Text = "NN • Anti AFK"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Left
title.TextColor3 = Color3.fromRGB(220,220,255)

-- MINIMIZE
local min = Instance.new("TextButton", top)
min.Size = UDim2.new(0,36,1,0)
min.Position = UDim2.new(1,-72,0,0)
min.Text = "—"
min.Font = Enum.Font.GothamBold
min.TextSize = 20
min.BackgroundColor3 = Color3.fromRGB(45,45,45)
min.TextColor3 = Color3.new(1,1,1)

-- EXIT
local close = Instance.new("TextButton", top)
close.Size = UDim2.new(0,36,1,0)
close.Position = UDim2.new(1,-36,0,0)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.BackgroundColor3 = Color3.fromRGB(120,60,60)
close.TextColor3 = Color3.new(1,1,1)

-- CONTENT
local info = Instance.new("TextLabel", main)
info.Position = UDim2.new(0,0,0,50)
info.Size = UDim2.new(1,0,0,40)
info.BackgroundTransparency = 1
info.Text = "Status : OFF\nAnti AFK berjalan di background"
info.Font = Enum.Font.Gotham
info.TextSize = 14
info.TextColor3 = Color3.fromRGB(200,200,200)

-- TOGGLE
local toggle = Instance.new("TextButton", main)
toggle.Size = UDim2.new(0.7,0,0,36)
toggle.Position = UDim2.new(0.15,0,1,-50)
toggle.Text = "ENABLE"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 16
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BackgroundColor3 = Color3.fromRGB(70,70,70)

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		toggle.Text = "DISABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(80,150,100)
		info.Text = "Status : ON\nAnti AFK berjalan di background"
	else
		toggle.Text = "ENABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(70,70,70)
		info.Text = "Status : OFF\nAnti AFK berjalan di background"
	end
end)

-- MINIMIZE TO LOGO
local logo = Instance.new("TextButton", gui)
logo.Size = UDim2.new(0,50,0,50)
logo.Position = UDim2.new(0,20,0.5,-25)
logo.Text = "NN"
logo.Font = Enum.Font.GothamBlack
logo.TextSize = 18
logo.Visible = false
logo.BackgroundColor3 = Color3.fromRGB(40,40,40)
logo.TextColor3 = Color3.fromRGB(200,200,255)

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
