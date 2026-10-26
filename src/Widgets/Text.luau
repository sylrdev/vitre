local Vide = require("../../Vide")
local Theme = require("../Theme")
local Types = require("../Types")

local create = Vide.create

type Props = {
	Text: Types.Prop<string>,
}

return function(props: Props)
	return create("TextLabel") {
		Name = "VitreTextWidget",
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		FontFace = Theme.FONT.CONTENT,
		Text = props.Text,
		TextColor3 = Theme.COLOR.TEXT,
		TextSize = Theme.TEXT_SIZE,
	}
end
