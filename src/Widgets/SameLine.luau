const Vide = require("../../Vide")
const Theme = require("../Theme")
const Types = require("../Types")

const create = Vide.create

type Props = {
	LayoutOrder: Types.Prop<number>?,
	[any]: any,
}

return function(props: Props)
	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "SameLineWidget",
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		LayoutOrder = props.LayoutOrder,

		create("UIListLayout") {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = function()
				return UDim.new(0, Theme().Padding.WidgetContainer)
			end,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Wraps = true,
		},

		props,
	}
end
