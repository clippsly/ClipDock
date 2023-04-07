-- Get reference to the Dock frame
local dock = script.Parent.Parent.DockShelf.Dock

-- Define the jump scale for the buttons
local jumpScale = 1.2

-- Define the jump duration
local jumpDuration = 0.1

-- Set up the click event handlers for each button
for _, button in ipairs(dock:GetChildren()) do
	if button:IsA("ImageButton") then
		button.MouseButton1Click:Connect(function()
			-- Create the jump tween
			local jumpTweenInfo = TweenInfo.new(jumpDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local jumpTween = game:GetService("TweenService"):Create(button, jumpTweenInfo, {
				Size = UDim2.new(button.Size.X.Scale * jumpScale, button.Size.X.Offset,
					button.Size.Y.Scale * jumpScale, button.Size.Y.Offset),
				Position = UDim2.new(button.Position.X.Scale - ((jumpScale - 1) / 2),
					button.Position.X.Offset, button.Position.Y.Scale - ((jumpScale - 1) / 2),
					button.Position.Y.Offset)
			})

			-- Play the jump tween
			jumpTween:Play()

			-- Reset the button's size and position after the jump is complete
			jumpTween.Completed:Connect(function()
				button.Size = UDim2.new(button.Size.X.Scale / jumpScale, button.Size.X.Offset,
					button.Size.Y.Scale / jumpScale, button.Size.Y.Offset)
				button.Position = UDim2.new(button.Position.X.Scale + ((jumpScale - 1) / 2),
					button.Position.X.Offset, button.Position.Y.Scale + ((jumpScale - 1) / 2),
					button.Position.Y.Offset)
			end)
		end)
	end
end
