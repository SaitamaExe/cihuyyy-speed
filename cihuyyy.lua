-- CIHUYYY SPEED - Fish Style Game (DELTA FIX)
-- Executor: DELTA
-- Client-side | Anti Blank | No Error

-- ===== SERVICES =====
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- ===== STATE =====
local running = false
local minimized = false
local clickConnection = nil

-- ===== GUI =====
local gui = Instance.new("ScreenGui")
gui.Name = "CIHUYYY_SPEED_DELTA"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.fromOffset(320, 180)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

-- ===== TITLE =====
local title = Instance.new("TextLabel")
title.Parent = main
title.Size = UDim2.new(1, -70, 0, 40)
title.Position = UDim2.fromOffset(10, 5)
title.BackgroundTransparency = 1
title.Text = "🔥 CIHUYYY SPEED (DELTA)"
title.TextColor3 = Color3.fromRGB(0, 255, 120)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextYAlignment = Enum.TextYAlignment.Center

-- ===== BUTTONS =====
local close = Instance.new("TextButton", main)
close.Size = UDim2.fromOffset(30, 30)
close.Position = UDim2.fromOffset(280, 5)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.TextColor3 = Color3.fromRGB(255, 80, 80)
close.BackgroundTransparency = 1

local mini = Instance.new("TextButton", main)
mini.Size = UDim2.fromOffset(30, 30)
mini.Position = UDim2.fromOffset(245, 5)
mini.Text = "-"
mini.Font = Enum.Font.GothamBold
mini.TextSize = 22
mini.TextColor3 = Color3.fromRGB(200, 200, 200)
mini.BackgroundTransparency = 1

-- ===== STATUS =====
local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, -20, 0, 30)
status.Position = UDim2.fromOffset(10, 50)
status.BackgroundTransparency = 1
status.Text = "STATUS: OFF"
status.TextColor3 = Color3.fromRGB(255, 80, 80)
status.Font = Enum.Font.GothamBold
status.TextSize = 14
status.TextXAlignment = Enum.TextXAlignment.Left

-- ===== START BUTTON =====
local start = Instance.new("TextButton", main)
start.Size = UDim2.new(1, -40, 0, 45)
start.Position = UDim2.fromOffset(20, 95)
start.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
start.Text = "START SPEED"
start.TextColor3 = Color3.new(1,1,1)
start.Font = Enum.Font.GothamBold
start.TextSize = 16
Instance.new("UICorner", start).CornerRadius = UDim.new(0, 8)

-- ===== FUNCTIONS =====

-- AUTO CLICK (DELTA SUPPORT)
local function startAutoClick()
	if clickConnection then return end
	clickConnection = RunService.RenderStepped:Connect(function()
		pcall(function()
			mouse1press()
			mouse1release()
		end)
	end)
end

local function stopAutoClick()
	if clickConnection then
		clickConnection:Disconnect()
		clickConnection = nil
	end
end

-- SPEED ANIMATION (AMAN)
local function speedAnimation(mult)
	local char = player.Character
	if not char then return end

	for _, obj in ipairs(char:GetDescendants()) do
		if obj:IsA("Animator") then
			for _, track in ipairs(obj:GetPlayingAnimationTracks()) do
				pcall(function()
					track:AdjustSpeed(mult)
				end)
			end
		end
	end
end

-- ===== LOGIC =====
start.MouseButton1Click:Connect(function()
	running = not running

	if running then
		status.Text = "STATUS: ON (AUTO TAP)"
		status.TextColor3 = Color3.fromRGB(0, 255, 120)
		start.Text = "STOP SPEED"
		start.BackgroundColor3 = Color3.fromRGB(40, 160, 90)

		startAutoClick()
		speedAnimation(3)
	else
		status.Text = "STATUS: OFF"
		status.TextColor3 = Color3.fromRGB(255, 80, 80)
		start.Text = "START SPEED"
		start.BackgroundColor3 = Color3.fromRGB(180, 40, 40)

		stopAutoClick()
		speedAnimation(1)
	end
end)

mini.MouseButton1Click:Connect(function()
	minimized = not minimized
	main.Size = minimized and UDim2.fromOffset(200, 40) or UDim2.fromOffset(320, 180)
	start.Visible = not minimized
	status.Visible = not minimized
end)

close.MouseButton1Click:Connect(function()
	stopAutoClick()
	gui:Destroy()
end)

print("✅ CIHUYYY SPEED DELTA LOADED (NO BLANK)")
