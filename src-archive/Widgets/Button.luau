local Vide = require("../../Vide")
local Theme = require("../Theme")
local Types = require("../Types")

local create = Vide.create

type Props = {
	Text: Types.Prop<string>,
	Rich: Types.Prop<boolean>?,
	Activated: ((inputObject: InputObject, clickCount: number) -> ())?,
}

return function(props: Props)
	--selene:allow(mixed_table)
	return create("TextButton") {
		Name = "VitreButtonWidget",
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Theme.COLOR.WIDGET,
		FontFace = Theme.FONT.CONTENT,
		RichText = props.Rich,
		Text = props.Text,
		TextColor3 = Theme.COLOR.TEXT,
		TextSize = Theme.TEXT_SIZE,

		Activated = props.Activated,

		create("UIPadding") {
			PaddingRight = UDim.new(0, Theme.WIDGET_PADDING),
			PaddingTop = UDim.new(0, Theme.WIDGET_PADDING),
			PaddingBottom = UDim.new(0, Theme.WIDGET_PADDING),
			PaddingLeft = UDim.new(0, Theme.WIDGET_PADDING),
		},
	}
end
