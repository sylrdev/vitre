const Vide = require("../../Vide")
const Theme = require("../Theme")
const Types = require("../Types")

const create = Vide.create

type Props = {
	Text: Types.Prop<string>,
}

return function(props: Props)
	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "DividerTextWidget",
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,

		create("UIListLayout") {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = function()
				return UDim.new(0, Theme().Padding.WidgetContainer)
			end,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		},

		create("Frame") {
			Name = "DividerLeft",
			Size = function()
				return UDim2.fromOffset(Theme().Padding.WidgetContainer * 2, Theme().StrokeThickness)
			end,
			BackgroundColor3 = function()
				return Theme().Color.Stroke
			end,
		},

		create("TextLabel") {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			FontFace = function()
				return Theme().Font.Header
			end,
			Text = props.Text,
			TextColor3 = function()
				return Theme().Color.Text
			end,
			TextSize = function()
				return Theme().TextSize
			end,
		},

		create("Frame") {
			Name = "DividerRight",
			Size = function()
				return UDim2.fromOffset(0, Theme().StrokeThickness)
			end,
			BackgroundColor3 = function()
				return Theme().Color.Stroke
			end,

			create("UIFlexItem") {
				FlexMode = Enum.UIFlexMode.Fill,
			},
		},
	}
end
