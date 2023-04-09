-- Get references to the Dock frame and its children
local dock = script.Parent.Parent.DockShelf.Dock
local click = script.Click
local buttons = {}

for _, child in ipairs(dock:GetChildren()) do
	if child:IsA("ImageButton") then
		table.insert(buttons, child)
	end
end


-- Define the magnification scale for the buttons
local magnificationScale = 1.2

-- Define the duration of the tween animation
local tweenDuration = 0.2

-- Define the original size and position of each button
local originalSizes = {}
local originalPositions = {}

for _, button in pairs(buttons) do
	originalSizes[button] = button.Size
	originalPositions[button] = button.Position
end

-- Set up the mouse enter and leave event handlers for each button
local function onButtonEnter(button)
	local sizeTweenInfo = TweenInfo.new(tweenDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local sizeTween = game:GetService("TweenService"):Create(button, sizeTweenInfo, {
		Size = UDim2.new(button.Size.X.Scale * magnificationScale, button.Size.X.Offset, 
			button.Size.Y.Scale * magnificationScale, button.Size.Y.Offset)
	})
	click:Play()
	sizeTween:Play()

	local positionTweenInfo = TweenInfo.new(tweenDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local positionTween = game:GetService("TweenService"):Create(button, positionTweenInfo, {
		Position = UDim2.new(button.Position.X.Scale - ((magnificationScale - 1) / 2), 
			button.Position.X.Offset, button.Position.Y.Scale - ((magnificationScale - 1) / 2), 
			button.Position.Y.Offset)
	})
	positionTween:Play()
end

local function onButtonLeave(button)
	local sizeTweenInfo = TweenInfo.new(tweenDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local sizeTween = game:GetService("TweenService"):Create(button, sizeTweenInfo, {
		Size = originalSizes[button]
	})
	sizeTween:Play()

	local positionTweenInfo = TweenInfo.new(tweenDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local positionTween = game:GetService("TweenService"):Create(button, positionTweenInfo, {
		Position = originalPositions[button]
	})
	positionTween:Play()
end

-- Set up the event handlers for each button
for _, button in ipairs(buttons) do
	button.MouseEnter:Connect(function() onButtonEnter(button) end)
	button.MouseLeave:Connect(function() onButtonLeave(button) end)
end
