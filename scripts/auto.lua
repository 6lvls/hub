-- holy bad
local player = game.Players.LocalPlayer
local resetTime = 120
local paused = false

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ResetTimer"
screenGui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0,250,0,50)
label.Position = UDim2.new(0.5,-125,0,20)
label.BackgroundTransparency = 0.3
label.TextScaled = true
label.TextColor3 = Color3.new(1,1,1)
label.Parent = screenGui

local pauseButton = Instance.new("TextButton")
pauseButton.Size = UDim2.new(0,120,0,40)
pauseButton.Position = UDim2.new(0.5,-60,0,80)
pauseButton.Text = "Pause"
pauseButton.Parent = screenGui

pauseButton.MouseButton1Click:Connect(function()
	paused = not paused
	if paused then
		pauseButton.Text = "Resume"
	else
		pauseButton.Text = "Pause"
	end
end)

local function startTimer(character)
	local humanoid = character:WaitForChild("Humanoid")
	local timeLeft = resetTime

	while character.Parent do
		while timeLeft > 0 do
			if not paused then
				label.Text = "Resetting in: "..timeLeft.."s"

				if timeLeft <= 10 then
					label.TextColor3 = Color3.fromRGB(255,0,0)
				else
					label.TextColor3 = Color3.fromRGB(255,255,255)
				end

				timeLeft -= 1
			end
			wait(1)
		end

		if humanoid and humanoid.Health > 0 then
			humanoid.Health = 0
		end

		timeLeft = resetTime
	end
end

player.CharacterAdded:Connect(function(character)
	startTimer(character)
end)

if player.Character then
	startTimer(player.Character)
end
