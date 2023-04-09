-- Get reference to the Dock frame
local dock = script.Parent.Parent.DockShelf.Dock

-- Define the jump scale for the buttons
local jumpScale = 1.2

-- Define the jump duration
local jumpDuration = 0.1

-- Set up the click event handlers for each button
for _, button in ipairs(dock:GetChildren()) do
	if button:IsA("ImageButton") then
		local appName = button.AppName
		appName.Visible = false

		button.MouseEnter:Connect(function()
			-- Show the AppName frame
			appName.Visible = true
		end)

		button.MouseLeave:Connect(function()
			-- Hide the AppName frame
			appName.Visible = false
		end)
	end
end
