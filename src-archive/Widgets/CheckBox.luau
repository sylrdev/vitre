local Vide = require("../../Vide")
local Images = require("../Images")
local Theme = require("../Theme")
local Types = require("../Types")

local create = Vide.create

type Props = {
	Text: Types.Prop<string>,
	Checked: Vide.Source<boolean>,
}

return function(props: Props)
	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "VitreCheckBoxWidget",
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
				props.Checked(not props.Checked())
			end,

			create("ImageLabel") {
				Size = UDim2.fromOffset(Theme.TEXT_SIZE + 5, Theme.TEXT_SIZE + 5),
				BackgroundTransparency = 1,
				Image = function()
					if props.Checked() == true then
						return Images.Check
					else
						return ""
					end
				end,
				ImageColor3 = Theme.COLOR.TEXT,
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
