local Vide = require("../../Vide")
local Theme = require("../Theme")
local Types = require("../Types")

local create = Vide.create

type Props = {
	Text: Types.Prop<string>,
	Color: Types.Prop<Color3>?,
	Rich: Types.Prop<boolean>?,
	Wrapped: Types.Prop<boolean>?,
}

return function(props: Props)
	return create("TextLabel") {
		Name = "VitreTextWidget",
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		FontFace = Theme.FONT.CONTENT,
		RichText = props.Rich,
		Text = props.Text,
		TextColor3 = props.Color or Theme.COLOR.TEXT,
		TextSize = Theme.TEXT_SIZE,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextWrapped = props.Wrapped or false,
	}
end
