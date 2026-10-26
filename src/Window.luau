local Vide = require("../Vide")
local Images = require("./Images")
local Internal = require("./Internal")
local Theme = require("./Theme")
local Types = require("./Types")

local create = Vide.create
local read = Vide.read
local source = Vide.source
local cleanup = Vide.cleanup
local effect = Vide.effect
local changed = Vide.changed

local DEFAULT_SIZE = Vector2.new(500, 550)
local DEFAULT_TITLE = "Window"
local HEADER_HEIGHT = 20

type Props = {
	Size: Types.Prop<Vector2>?,
	Title: string?,
	CanCollapse: boolean?,
}

-- Returns the mouse's position on the screen.
--
-- @return Vector2 --- mouse's position
local function getMousePosition(): Vector2
	return Internal.UserInputService:GetMouseLocation()
end

return function(props: Props)
	local collapsed = source(false)

	local mouseHovering = false
	local dragging = mouseHovering

	local initialMousePosition = getMousePosition()
	local mousePosition = source(initialMousePosition)

	local initialFramePosition = UDim2.new()
	local framePosition = source(initialFramePosition)
	local absoluteFrameSize = source(read(props.Size) :: Vector2 or DEFAULT_SIZE)

	effect(function()
		--selene:allow(shadowing)
		local mousePosition = mousePosition()
		--selene:allow(shadowing)
		local absoluteFrameSize = absoluteFrameSize()
		local parent = Internal.WindowContainer()

		local diffX = mousePosition.X - initialMousePosition.X
		local diffY = mousePosition.Y - initialMousePosition.Y

		local maxX = parent.AbsoluteSize.X - absoluteFrameSize.X - Theme.STROKE_THICKNESS
		local maxY = parent.AbsoluteSize.Y - absoluteFrameSize.Y - Theme.STROKE_THICKNESS

		-- fixes the ui being unable to render when the window size is greater than the parent size
		maxX = math.max(maxX, Theme.STROKE_THICKNESS)
		maxY = math.max(maxY, Theme.STROKE_THICKNESS)

		local newX = math.clamp(initialFramePosition.X.Offset + diffX, Theme.STROKE_THICKNESS, maxX)
		local newY = math.clamp(initialFramePosition.Y.Offset + diffY, Theme.STROKE_THICKNESS, maxY)

		framePosition(UDim2.fromOffset(newX, newY))
	end)

	local connection1 = Internal.UserInputService.InputBegan:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end

		dragging = mouseHovering

		if dragging == true then
			initialMousePosition = getMousePosition()
			mousePosition(initialMousePosition)
			initialFramePosition = framePosition()
		end
	end)

	local connection2 = Internal.UserInputService.InputEnded:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end

		dragging = false

		initialMousePosition = getMousePosition()
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

		mousePosition(getMousePosition())
	end)

	cleanup(function()
		connection1:Disconnect()
		connection2:Disconnect()
		connection3:Disconnect()
	end)

	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "VitreWindow",
		Parent = Internal.WindowContainer,
		Size = function()
			local size = read(props.Size) :: Vector2 or DEFAULT_SIZE
			return UDim2.fromOffset(size.X, size.Y)
		end,
		Position = framePosition,
		BackgroundTransparency = 1,

		changed("AbsoluteSize", absoluteFrameSize :: any),
		changed("Position", framePosition :: any),

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
					if props.CanCollapse == false then
						return ""
					elseif collapsed() == true then
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
				Text = props.Title or DEFAULT_TITLE,
				TextColor3 = Theme.COLOR.TEXT,
				TextSize = HEADER_HEIGHT - 5,
			},

			create("Frame") {
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
