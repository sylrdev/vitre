local Vide = require("../../Vide")
local Theme = require("../Theme")

local create = Vide.create

type Props = {
	Children: { [any]: any },
}

return function(props: Props)
	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "VitreIndentWidget",
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,

		create("UIPadding") {
			PaddingLeft = UDim.new(0, Theme.WINDOW_CHILDREN_PADDING * 2),
		},

		create("UIListLayout") {
			Padding = UDim.new(0, Theme.WINDOW_CHILDREN_PADDING),
		},

		props.Children,
	}
end
