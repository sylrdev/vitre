local Vide = require("../../Vide")
local Theme = require("../Theme")
local Types = require("../Types")

local create = Vide.create

type Props = {
	Text: Types.Prop<string>,
	Index: number,
	CurrentIndex: Vide.Source<number>,
}

return function(props: Props)
	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "VitreRadioButtonWidget",
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,

		create("UIListLayout") {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, Theme.WINDOW_CHILDREN_PADDING),
			VerticalAlignment = Enum.VerticalAlignment.Center,
		},

		create("TextButton") {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = Theme.COLOR.WIDGET,

			Activated = function()
				props.CurrentIndex(props.Index)
			end,

			create("UIPadding") {
				PaddingRight = UDim.new(0, Theme.WIDGET_PADDING),
				PaddingTop = UDim.new(0, Theme.WIDGET_PADDING),
				PaddingBottom = UDim.new(0, Theme.WIDGET_PADDING),
				PaddingLeft = UDim.new(0, Theme.WIDGET_PADDING),
			},

			create("Frame") {
				Size = UDim2.fromOffset(Theme.TEXT_SIZE, Theme.TEXT_SIZE),
				BackgroundColor3 = Theme.COLOR.TEXT,
				BackgroundTransparency = function()
					if props.CurrentIndex() == props.Index then
						return 0
					else
						return 1
					end
				end,
			},
		},

		create("TextLabel") {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			FontFace = Theme.FONT.CONTENT,
			Text = props.Text,
			TextColor3 = Theme.COLOR.TEXT,
			TextSize = Theme.TEXT_SIZE,
		},
	}
end
