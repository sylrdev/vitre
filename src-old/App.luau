local Vide = require("../Vide")
local Internal = require("./Internal")

local create = Vide.create
local action = Vide.action

return function()
	--selene:allow(mixed_table)
	return create("ScreenGui") {
		Name = "Vitre",

		create("Frame") {
			Name = "Container",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,

			action(function(instance)
				Internal.Parent(instance :: Frame)
			end),
		},
	}
end
