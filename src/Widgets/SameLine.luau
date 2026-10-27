local Vide = require("../../Vide")
local Theme = require("../Theme")

local create = Vide.create

type Props = {
	Children: { [any]: any },
}

return function(props: Props)
	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "VitreSameLineWidget",
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,

		create("UIListLayout") {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, Theme.WINDOW_CHILDREN_PADDING),
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Wraps = true,
		},

		props.Children,
	}
end
