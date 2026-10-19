local Vide = require("../Vide")
local Theme = require("./Theme")
local Types = require("./Types")

local create = Vide.create
local read = Vide.read

local DEFAULT_PROPS = {
	SIZE = Vector2.new(400, 450),
	POSITION = Vector2.new(Theme.STROKE_THICKNESS, Theme.STROKE_THICKNESS),
	TITLE = "Window",
}

type Props = {
	Size: Types.Prop<Vector2>?,
	Position: Types.Prop<Vector2>?,
	Title: string?,
}

return function(props: Props)
	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "VitreWindow",
		Size = function()
			local size = read(props.Size) :: Vector2 or DEFAULT_PROPS.SIZE
			return UDim2.fromOffset(size.X, size.Y)
		end,
		Position = function()
			local position = read(props.Position) :: Vector2 or DEFAULT_PROPS.POSITION
			return UDim2.fromOffset(position.X, position.Y)
		end,
		BackgroundTransparency = 1,

		create("UIStroke") {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Theme.COLOR.STROKE,
			LineJoinMode = Enum.LineJoinMode.Miter,
			Thickness = Theme.STROKE_THICKNESS,
		},

		create("UIListLayout") {
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
		},

		create("Frame") {
			Name = "Header",
			Size = UDim2.fromOffset(0, 20),
			BackgroundColor3 = Theme.COLOR.HEADER,

			create("UIListLayout") {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			},

			create("ImageButton") {
				Size = UDim2.fromOffset(20, 20),
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
				Size = UDim2.fromOffset(20, 20),
				BackgroundTransparency = 1,
			},
		},

		create("ScrollingFrame") {
			Name = "WidgetContainer",
			BackgroundColor3 = Theme.COLOR.WINDOW_BACKGROUND,
			ScrollBarThickness = 8,

			create("UIFlexItem") {
				FlexMode = Enum.UIFlexMode.Fill,
			},
		},
	}
end
