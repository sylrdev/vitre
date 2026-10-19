local UserInputService = game:GetService("UserInputService")

local Vide = require("../Vide")

local create = Vide.create
local cleanup = Vide.cleanup
local source = Vide.source
local changed = Vide.changed

type Props = {
	_UserInputService: UserInputService?,
}

return function(props: Props)
	--selene:allow(shadowing)
	local UserInputService = props._UserInputService or UserInputService

	local mouseHovering = false
	local mouseDown = false
	local dragging = false
	local initialMousePosition = Vector2.zero
	local initialFramePosition = UDim2.new()
	local mousePosition = source(Vector2.zero)
	local absoluteFramePosition = source(UDim2.new())

	local c1 = UserInputService.InputBegan:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end

		mouseDown = mouseHovering
		dragging = mouseHovering and mouseDown

		if dragging == true then
			initialMousePosition = UserInputService:GetMouseLocation()
			initialFramePosition = absoluteFramePosition()
			mousePosition(initialMousePosition)
		end
	end)

	local c2 = UserInputService.InputEnded:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end

		mouseDown = false
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

	local framePosition = function()
		local mousePos = mousePosition()

		local deltaX = mousePos.X - initialMousePosition.X
		local deltaY = mousePos.Y - initialMousePosition.Y

		local newX = initialFramePosition.X.Offset + deltaX
		local newY = initialFramePosition.Y.Offset + deltaY

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
		Position = framePosition,

		changed("Position", absoluteFramePosition :: any),

		MouseEnter = function()
			mouseHovering = true
		end,

		MouseLeave = function()
			mouseHovering = false
		end,
	}
end
