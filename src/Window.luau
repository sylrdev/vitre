local UserInputService = game:GetService("UserInputService")

local Tailwind = require("../Tailwind")
local Vide = require("../Vide")
local Internal = require("./Internal")
local Types = require("./Types")

local create = Vide.create
local read = Vide.read
local cleanup = Vide.cleanup
local source = Vide.source
local changed = Vide.changed
local effect = Vide.effect

local DEFAULT_PROPS = {
	SIZE = Vector2.new(400, 450),
	USER_INPUT_SERVICE = UserInputService,
}

type Props = {
	Size: Types.Prop<Vector2>?,
}

return function(props: Props)
	--selene:allow(shadowing)
	local mouseHovering = false
	local dragging = false

	local initialMousePosition = Vector2.zero
	local mousePosition = source(initialMousePosition)

	local initialFramePosition = UDim2.new()
	local framePosition = source(initialFramePosition)
	local absoluteFrameSize = source(Vector2.zero)

	local connection1 = Internal.UserInputService.InputBegan:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end

		dragging = mouseHovering

		if dragging == true then
			initialMousePosition = Internal.UserInputService:GetMouseLocation()
			mousePosition(initialMousePosition)
			initialFramePosition = framePosition()
		end
	end)

	local connection2 = Internal.UserInputService.InputEnded:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end

		dragging = false

		-- this somehow fixes the weird snapping
		-- it works, why? no clue
		initialMousePosition = Internal.UserInputService:GetMouseLocation()
		mousePosition(initialMousePosition)
		initialFramePosition = framePosition()
	end)

	local connection3 = Internal.UserInputService.InputChanged:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseMovement then
			return
		end

		if dragging == false then
			return
		end

		mousePosition(Internal.UserInputService:GetMouseLocation())
	end)

	local calculatedFramePosition = source(initialFramePosition)

	effect(function()
		--selene:allow(shadowing)
		local mousePosition = mousePosition()

		local diffX = mousePosition.X - initialMousePosition.X
		local diffY = mousePosition.Y - initialMousePosition.Y

		local newX = initialFramePosition.X.Offset + diffX
		local newY = initialFramePosition.Y.Offset + diffY

		calculatedFramePosition(UDim2.fromOffset(newX, newY))
	end)

	cleanup(function()
		connection1:Disconnect()
		connection2:Disconnect()
		connection3:Disconnect()
	end)

	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "VitreWindow",
		Size = function()
			local size = read(props.Size) :: Vector2 or DEFAULT_PROPS.SIZE
			return UDim2.fromOffset(size.X, size.Y)
		end,
		Position = calculatedFramePosition,

		changed("Position", framePosition :: any),
		changed("AbsoluteSize", absoluteFrameSize :: any),

		create("UIListLayout") {
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
		},

		create("Frame") {
			Name = "Header",
			Size = UDim2.fromOffset(0, 20),
			BackgroundColor3 = Tailwind.rose[400],

			MouseEnter = function()
				mouseHovering = true
			end,

			MouseLeave = function()
				mouseHovering = false
			end,
		},

		create("ScrollingFrame") {
			Name = "WidgetContainer",

			create("UIFlexItem") {
				FlexMode = Enum.UIFlexMode.Fill,
			},
		},
	}
end
