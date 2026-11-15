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
		Name = "IndentWidget",
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		LayoutOrder = props.LayoutOrder,

		create("UIPadding") {
			PaddingLeft = function()
				return UDim.new(0, Theme().Padding.WidgetContainer * 4)
			end,
		},

		create("UIListLayout") {
			Padding = function()
				return UDim.new(0, Theme().Padding.WidgetContainer)
			end,
		},

		props,
	}
end
