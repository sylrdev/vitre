local Vide = require("../../Vide")
local Theme = require("../Theme")
local Types = require("../Types")

local create = Vide.create

type Props = {
	Text: Types.Prop<string>,
}

return function(props: Props)
	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "VitreDividerTextWidget",
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,

		create("UIListLayout") {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, Theme.WINDOW_CHILDREN_PADDING),
			VerticalAlignment = Enum.VerticalAlignment.Center,
		},

		create("Frame") {
			Name = "LeftDivider",
			Size = UDim2.fromOffset(Theme.WINDOW_CHILDREN_PADDING * 2, Theme.STROKE_THICKNESS),
			BackgroundColor3 = Theme.COLOR.STROKE,
		},

		create("TextLabel") {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			FontFace = Theme.FONT.HEADER,
			Text = props.Text,
			TextColor3 = Theme.COLOR.TEXT,
			TextSize = Theme.TEXT_SIZE,
		},

		create("Frame") {
			Name = "RightDivider",
			Size = UDim2.fromOffset(Theme.WINDOW_CHILDREN_PADDING, Theme.STROKE_THICKNESS),
			BackgroundColor3 = Theme.COLOR.STROKE,

			create("UIFlexItem") {
				FlexMode = Enum.UIFlexMode.Fill,
			},
		},
	}
end
