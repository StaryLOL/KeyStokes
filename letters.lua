local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local keystrokesLabel = Instance.new("TextLabel")
keystrokesLabel.Size = UDim2.new(0, 200, 0, 40)
keystrokesLabel.Position = UDim2.new(0, 10, 1, -50)
keystrokesLabel.BackgroundTransparency = 1
keystrokesLabel.TextColor3 = Color3.new(1, 1, 1)
keystrokesLabel.Font = Enum.Font.SourceSansBold
keystrokesLabel.TextSize = 24
keystrokesLabel.TextXAlignment = Enum.TextXAlignment.Left
keystrokesLabel.Parent = gui

local function updateKeystrokes(input)
	local keystrokes = ""
	local keys = {
		[Enum.KeyCode.W] = "W",
		[Enum.KeyCode.A] = "A",
		[Enum.KeyCode.S] = "S",
		[Enum.KeyCode.D] = "D",
		[Enum.KeyCode.Space] = " ",
	}

	if input.KeyCode == Enum.KeyCode.Space then
		keystrokes = "SPACE "
	else
		for key, value in pairs(keys) do
			if input.KeyCode == key then
				keystrokes = keystrokes .. value .. " "
			end
		end
	end

	keystrokesLabel.Text = keystrokes

	if keystrokes == "" then
		keystrokesLabel.Visible = false
	else
		keystrokesLabel.Visible = true
	end
end

game:GetService("UserInputService").InputBegan:Connect(updateKeystrokes)
game:GetService("UserInputService").InputEnded:Connect(updateKeystrokes)
