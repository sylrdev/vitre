local Vide = require("../Vide")
local Images = require("./Images")
local Internal = require("./Internal")
local Theme = require("./Theme")
local Types = require("./Types")

local create = Vide.create
local read = Vide.read
local cleanup = Vide.cleanup
local source = Vide.source
local changed = Vide.changed
local effect = Vide.effect

local DEFAULT_PROPS = {
	SIZE = Vector2.new(400, 450),
	TITLE = "Window",
}
local HEADER_HEIGHT = 20

type Props = {
	Size: Types.Prop<Vector2>?,
	Title: Types.Prop<string>?,
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

	local collapsed = source(false)

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
		--selene:allow(shadowing)
		local absoluteFrameSize = absoluteFrameSize()
		local parent = Internal.Parent()

		local diffX = mousePosition.X - initialMousePosition.X
		local diffY = mousePosition.Y - initialMousePosition.Y

		local maxX = parent.AbsoluteSize.X - absoluteFrameSize.X
		local maxY = parent.AbsoluteSize.Y - absoluteFrameSize.Y

		local newX = math.clamp(initialFramePosition.X.Offset + diffX, 0, maxX)
		local newY = math.clamp(initialFramePosition.Y.Offset + diffY, 0, maxY)

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

			if collapsed() == true then
				return UDim2.fromOffset(size.X, HEADER_HEIGHT)
			else
				return UDim2.fromOffset(size.X, size.Y)
			end
		end,
		Position = calculatedFramePosition,
		BackgroundTransparency = 1,

		changed("Position", framePosition :: any),
		changed("AbsoluteSize", absoluteFrameSize :: any),

		create("UIStroke") {
			Color = Theme.COLOR.STROKE,
			LineJoinMode = Enum.LineJoinMode.Miter,
			Thickness = Theme.STROKE_THICKNESS,
		},

		create("UIListLayout") {
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
		},

		create("Frame") {
			Name = "Header",
			Size = UDim2.fromOffset(0, HEADER_HEIGHT),
			BackgroundColor3 = Theme.COLOR.HEADER,

			MouseEnter = function()
				mouseHovering = true
			end,

			MouseLeave = function()
				mouseHovering = false
			end,

			create("UIListLayout") {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			},

			create("ImageButton") {
				Size = UDim2.fromOffset(HEADER_HEIGHT, HEADER_HEIGHT),
				BackgroundTransparency = 1,
				Image = function()
					if collapsed() == true then
						return Images.ArrowRight
					else
						return Images.ArrowDown
					end
				end,

				Activated = function()
					collapsed(not collapsed())
				end,
			},

			create("TextLabel") {
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				FontFace = Theme.FONT.HEADER,
				Text = props.Title or DEFAULT_PROPS.TITLE,
				TextColor3 = Theme.COLOR.TEXT,
				TextSize = 15,
			},

			create("Frame") {
				Name = "_",
				Size = UDim2.fromOffset(HEADER_HEIGHT, HEADER_HEIGHT),
				BackgroundTransparency = 1,
			},
		},

		create("ScrollingFrame") {
			Name = "WidgetContainer",
			BackgroundColor3 = Theme.COLOR.WINDOW_BACKGROUND,
			Visible = function()
				return collapsed() == false
			end,

			create("UIFlexItem") {
				FlexMode = Enum.UIFlexMode.Fill,
			},
		},
	}
end
