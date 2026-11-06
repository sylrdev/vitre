const Vide = require("../../Vide")
const Theme = require("../Theme")
const Types = require("../Types")

const create = Vide.create
const read = Vide.read

const DEFAULT_RICH = false
const DEFAULT_WRAPPED = false

type Props = {
	Text: Types.Prop<string>,
	Color: Types.Prop<Color3>?,
	Rich: Types.Prop<boolean>?,
	Wrapped: Types.Prop<boolean>?,
}

return function(props: Props)
	return create("TextLabel") {
		Name = "TextWidget",
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		FontFace = function()
			return Theme().Font.Content
		end,
		RichText = props.Rich or DEFAULT_RICH,
		Text = props.Text,
		TextColor3 = function()
			local color = read(props.Color) :: Color3
			return color or Theme().Color.Text
		end,
		TextSize = function()
			return Theme().TextSize
		end,
		TextWrapped = props.Wrapped or DEFAULT_WRAPPED,
		TextXAlignment = Enum.TextXAlignment.Left,
	}
end
