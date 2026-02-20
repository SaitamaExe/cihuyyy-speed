-- CIHUYYY SPEED - Fish Style Game (DELTA PRO)
-- Executor: DELTA
-- Auto Tap Center Screen | Super Fast | Clean UI

-- ===== SERVICES =====
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- ===== STATE =====
local running = false
local minimized = false
local clickConnection = nil

-- ===== GUI ROOT =====
local gui = Instance.new("ScreenGui")
gui.Name = "CIHUYYY_SPEED_DELTA_PRO"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

-- ===== SHADOW =====
local shadow = Instance.new("Frame", gui)
shadow.Size = UDim2.fromOffset(340, 200)
shadow.Position = UDim2.fromScale(0.5, 0.5)
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.6
shadow.BorderSizePixel = 0
Instance.new("UICorner", shadow).CornerRadius = UDim.new(0, 16)

-- ===== MAIN FRAME =====
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromOffset(320, 180)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)

-- ===== GRADIENT =====
local grad = Instance.new("UIGradient", main)
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 120, 90)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 30))
}
grad.Rotation = 45

-- ===== TITLE =====
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -90, 0, 40)
title.Position = UDim2.fromOffset(16, 8)
title.BackgroundTransparency = 1
title.Text = "🔥 CIHUYYY SPEED"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(0, 255, 160)

-- ===== BUTTONS =====
local close = Instance.new("TextButton", main)
close.Size = UDim2.fromOffset(28, 28)
close.Position = UDim2.fromOffset(280, 10)
close.Text = "✕"
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.TextColor3 = Color3.fromRGB(255, 90, 90)
close.BackgroundTransparency = 1

local mini = Instance.new("TextButton", main)
mini.Size = UDim2.fromOffset(28, 28)
mini.Position = UDim2.fromOffset(245, 10)
mini.Text = "—"
mini.Font = Enum.Font.GothamBold
mini.TextSize = 22
mini.TextColor3 = Color3.fromRGB(220, 220, 220)
mini.BackgroundTransparency = 1

-- ===== STATUS =====
local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, -32, 0, 28)
status.Position = UDim2.fromOffset(16, 56)
status.BackgroundTransparency = 1
status.Text = "STATUS : OFF"
status.Font = Enum.Font.GothamBold
status.TextSize = 14
status.TextXAlignment = Enum.TextXAlignment.Left
status.TextColor3 = Color3.fromRGB(255, 90, 90)

-- ===== START BUTTON =====
local start = Instance.new("TextButton", main)
start.Size = UDim2.new(1, -48, 0, 48)
start.Position = UDim2.fromOffset(24, 104)
start.Text = "START AUTO TAP"
start.Font = Enum.Font.GothamBold
start.TextSize = 16
start.TextColor3 = Color3.new(1,1,1)
start.BackgroundColor3 = Color3.fromRGB(40, 160, 110)
Instance.new("UICorner", start).CornerRadius = UDim.new(0, 12)

-- ===== FUNCTIONS =====

-- AUTO TAP CENTER SCREEN (SUPER FAST)
local function startAutoClick()
	if clickConnection then return end
	clickConnection = RunService.RenderStepped:Connect(function()
		pcall(function()
			local vp = camera.ViewportSize
			mousemoveabs(vp.X / 2, vp.Y / 2)
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

-- SPEED ANIMATION (OPTIONAL, AMAN)
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
		status.Text = "STATUS : ON (CENTER TAP)"
		status.TextColor3 = Color3.fromRGB(0, 255, 160)
		start.Text = "STOP AUTO TAP"
		start.BackgroundColor3 = Color3.fromRGB(200, 70, 70)
		startAutoClick()
		speedAnimation(3)
	else
		status.Text = "STATUS : OFF"
		status.TextColor3 = Color3.fromRGB(255, 90, 90)
		start.Text = "START AUTO TAP"
		start.BackgroundColor3 = Color3.fromRGB(40, 160, 110)
		stopAutoClick()
		speedAnimation(1)
	end
end)

-- MINIMIZE SMOOTH
mini.MouseButton1Click:Connect(function()
	minimized = not minimized

	local targetSize = minimized and UDim2.fromOffset(220, 48) or UDim2.fromOffset(320, 180)
	TweenService:Create(main, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
		Size = targetSize
	}):Play()

	status.Visible = not minimized
	start.Visible = not minimized
end)

-- CLOSE
close.MouseButton1Click:Connect(function()
	stopAutoClick()
	gui:Destroy()
end)

print("✅ CIHUYYY SPEED DELTA PRO LOADED")
