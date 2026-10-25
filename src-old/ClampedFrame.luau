local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local Vide = require("../Vide")

local create = Vide.create
local cleanup = Vide.cleanup
local source = Vide.source
local changed = Vide.changed

type Props = {
	_UserInputService: UserInputService?,
	_Parent: GuiObject?,
}

return function(props: Props)
	--selene:allow(shadowing)
	local UserInputService = props._UserInputService or UserInputService

	local mouseHovering = false
	local dragging = false

	local initialMousePosition = Vector2.zero
	local mousePosition = source(initialMousePosition)

	local initialFramePosition = UDim2.new()
	local framePosition = source(initialFramePosition)
	local frameAbsoluteSize = source(Vector2.zero)

	local c1 = UserInputService.InputBegan:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end

		dragging = mouseHovering

		if dragging == true then
			initialMousePosition = UserInputService:GetMouseLocation()
			mousePosition(initialMousePosition)
			initialFramePosition = framePosition()
		end
	end)

	local c2 = UserInputService.InputEnded:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end

		dragging = false
	end)

	local c3 = UserInputService.InputChanged:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseMovement then
			return
		end

		if dragging == false then
			return
		end

		mousePosition(UserInputService:GetMouseLocation())
	end)

	local calculatedFramePosition = function()
		local mousePos = mousePosition()

		-- calculating how much the mouse has moved
		local deltaX = mousePos.X - initialMousePosition.X
		local deltaY = mousePos.Y - initialMousePosition.Y

		-- applying the movement
		local newX = initialFramePosition.X.Offset + deltaX
		local newY = initialFramePosition.Y.Offset + deltaY

		-- clamping within viewport bounds
		local viewportSize
		do
			if props._Parent ~= nil then
				viewportSize = props._Parent.AbsoluteSize
			else
				local camera = Workspace.CurrentCamera
				viewportSize = camera.ViewportSize
			end
		end

		local maxX = viewportSize.X - frameAbsoluteSize().X
		local maxY = viewportSize.Y - frameAbsoluteSize().Y

		newX = math.clamp(newX, 0, maxX)
		newY = math.clamp(newY, 0, maxY)

		return UDim2.fromOffset(newX, newY)
	end

	cleanup(function()
		c1:Disconnect()
		c2:Disconnect()
		c3:Disconnect()
	end)

	--selene:allow(mixed_table)
	return create("Frame") {
		Size = UDim2.fromOffset(200, 200),
		Position = calculatedFramePosition,

		changed("Position", framePosition :: any),
		changed("AbsoluteSize", frameAbsoluteSize :: any),

		MouseEnter = function()
			mouseHovering = true
		end,

		MouseLeave = function()
			mouseHovering = false
		end,
	}
end
