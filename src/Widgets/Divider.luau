const Vide = require("../../Vide")
const Theme = require("../Theme")

const create = Vide.create

type Props = {}

return function(_: Props)
	return create("Frame") {
		Name = "DividerWidget",
		Size = function()
			return UDim2.new(1, 0, 0, Theme().StrokeThickness)
		end,
		BackgroundColor3 = function()
			return Theme().Color.Stroke
		end,
	}
end
