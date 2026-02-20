-- AUTO CLICKER WORLD LOCK + CLEAN UI
-- Executor : DELTA
-- By : cihuyyy

local Players = game:GetService("Players")
local VIM = game:GetService("VirtualInputManager")
local UIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local player = Players.LocalPlayer

-- ================= STATE =================
local aktif = false
local running = true
local minimized = false
local delay = 0 -- 0 = super cepat

-- ================= UI ROOT =================
local gui = Instance.new("ScreenGui")
gui.Name = "CihuyyyAutoClickUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ================= MAIN FRAME =================
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 260, 0, 160)
frame.Position = UDim2.new(0.5, -130, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(22,22,22)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

-- ================= TOP BAR =================
local top = Instance.new("Frame", frame)
top.Size = UDim2.new(1,0,0,36)
top.BackgroundColor3 = Color3.fromRGB(30,30,30)
top.BorderSizePixel = 0
Instance.new("UICorner", top).CornerRadius = UDim.new(0,14)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,-90,1,0)
title.Position = UDim2.new(0,12,0,0)
title.BackgroundTransparency = 1
title.Text = "⚡ CIHUYYY AUTO CLICK"
title.Font = Enum.Font.GothamBold
title.TextSize = 13
title.TextColor3 = Color3.fromRGB(255,90,90)
title.TextXAlignment = Left

-- Minimize Button
local minBtn = Instance.new("TextButton", top)
minBtn.Size = UDim2.new(0,28,0,28)
minBtn.Position = UDim2.new(1,-64,0.5,-14)
minBtn.Text = "—"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 18
minBtn.TextColor3 = Color3.fromRGB(220,220,220)
minBtn.BackgroundColor3 = Color3.fromRGB(55,55,55)
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0,8)

-- Exit Button
local exitBtn = Instance.new("TextButton", top)
exitBtn.Size = UDim2.new(0,28,0,28)
exitBtn.Position = UDim2.new(1,-32,0.5,-14)
exitBtn.Text = "X"
exitBtn.Font = Enum.Font.GothamBold
exitBtn.TextSize = 14
exitBtn.TextColor3 = Color3.fromRGB(255,120,120)
exitBtn.BackgroundColor3 = Color3.fromRGB(70,40,40)
Instance.new("UICorner", exitBtn).CornerRadius = UDim.new(0,8)

-- ================= CONTENT =================
local content = Instance.new("Frame", frame)
content.Position = UDim2.new(0,0,0,40)
content.Size = UDim2.new(1,0,1,-40)
content.BackgroundTransparency = 1

local status = Instance.new("TextLabel", content)
status.Size = UDim2.new(1,0,0,28)
status.Position = UDim2.new(0,0,0,6)
status.BackgroundTransparency = 1
status.Text = "Status : OFF ❌"
status.Font = Enum.Font.Gotham
status.TextSize = 12
status.TextColor3 = Color3.fromRGB(210,210,210)

local toggle = Instance.new("TextButton", content)
toggle.Size = UDim2.new(0.8,0,0,40)
toggle.Position = UDim2.new(0.1,0,0,44)
toggle.Text = "AKTIFKAN"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 14
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0,10)

local info = Instance.new("TextLabel", content)
info.Size = UDim2.new(1,-20,0,40)
info.Position = UDim2.new(0,10,0,92)
info.BackgroundTransparency = 1
info.TextWrapped = true
info.Text = "Klik dikunci ke TENGAH layar.\nUI game tetap aman."
info.Font = Enum.Font.Gotham
info.TextSize = 11
info.TextColor3 = Color3.fromRGB(160,160,160)

-- ================= LOGIC =================
local function updateUI()
	if aktif then
		status.Text = "Status : ON 🔥"
		toggle.Text = "MATIKAN"
		toggle.BackgroundColor3 = Color3.fromRGB(170,55,55)
	else
		status.Text = "Status : OFF ❌"
		toggle.Text = "AKTIFKAN"
		toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
	end
end

toggle.MouseButton1Click:Connect(function()
	aktif = not aktif
	updateUI()
end)

-- Keyboard toggle (F)
UIS.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.F then
		aktif = not aktif
		updateUI()
	end
end)

-- Minimize
minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	content.Visible = not minimized
	frame.Size = minimized and UDim2.new(0,260,0,40) or UDim2.new(0,260,0,160)
end)

-- Exit (kill all)
exitBtn.MouseButton1Click:Connect(function()
	running = false
	aktif = false
	gui:Destroy()
end)

-- ================= AUTO CLICK LOOP =================
task.spawn(function()
	while running do
		if aktif then
			local vp = Camera.ViewportSize
			local x, y = vp.X/2, vp.Y/2
			VIM:SendMouseButtonEvent(x, y, 0, true, game, 0)
			VIM:SendMouseButtonEvent(x, y, 0, false, game, 0)
		end
		task.wait(delay)
	end
end)
