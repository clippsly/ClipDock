local DockShelf = script.Parent.Parent.DockShelf
local TweenService = game:GetService("TweenService")

local buttons = {DockShelf.CSafari, DockShelf.FMusic, DockShelf.FTerminal, DockShelf.EBrush} -- add your buttons to this table

local function updateDockSize()
	local dockSize, dockPos
	local visibleCount = 0
	for i = 1, #buttons do
		if buttons[i].Visible then
			visibleCount += 1
		end
	end
	if visibleCount == 4 then
		dockSize = UDim2.new(0.636, 0, 0.111, 0)
		dockPos = UDim2.new(0.817, 0, 0.992, 0)
	elseif visibleCount == 3 then
		dockSize = UDim2.new(0.578, 0, 0.111, 0)
		dockPos = UDim2.new(0.789, 0, 0.992, 0)
	elseif visibleCount == 2 then
		dockSize = UDim2.new(0.521, 0, 0.111, 0)
		dockPos = UDim2.new(0.76, 0, 0.992, 0)
	elseif visibleCount == 1 then
		dockSize = UDim2.new(0.464, 0, 0.111, 0)
		dockPos = UDim2.new(0.731, 0, 0.992, 0)
	else
		dockSize = UDim2.new(0.409, 0, 0.111, 0)
		dockPos = UDim2.new(0.705, 0, 0.992, 0)
	end

	local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	TweenService:Create(DockShelf, tweenInfo, {Position = dockPos, Size = dockSize}):Play()
end

-- initially set the dock size based on the button visibility
updateDockSize()

-- connect to button visibility changed events to update the dock size
for i = 1, #buttons do
	buttons[i].Changed:Connect(updateDockSize)
end
