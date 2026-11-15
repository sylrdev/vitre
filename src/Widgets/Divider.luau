const Vide = require("../../Vide")
const Theme = require("../Theme")
const Types = require("../Types")

const create = Vide.create

type Props = {
	LayoutOrder: Types.Prop<number>?,
}

return function(props: Props)
	return create("Frame") {
		Name = "DividerWidget",
		Size = function()
			return UDim2.new(1, 0, 0, Theme().StrokeThickness)
		end,
		BackgroundColor3 = function()
			return Theme().Color.Stroke
		end,
		LayoutOrder = props.LayoutOrder,
	}
end
