local Vide = require("../../Vide")
local Theme = require("../Theme")

local create = Vide.create

return function()
	return create("Frame") {
		Name = "VitreDividerWidget",
		Size = UDim2.new(1, 0, 0, Theme.STROKE_THICKNESS),
		BackgroundColor3 = Theme.COLOR.STROKE,
	}
end
