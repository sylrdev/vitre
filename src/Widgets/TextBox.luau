local Vide = require("../../Vide")
local Theme = require("../Theme")
local Types = require("../Types")

local create = Vide.create
local changed = Vide.changed

local DEFAULT_PLACEHOLDER_TEXT = "..."
local DEFAULT_WIDTH = 100
local TEXT_BOX_PADDING = 3

type Props = {
	Text: Vide.Source<string>,
	PlaceholderText: Types.Prop<string>?,
	Width: number?,
	Wrapped: Types.Prop<boolean>?,
}

return function(props: Props)
	--selene:allow(mixed_table)
	return create("TextBox") {
		Name = "VitreTextBoxWidget",
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.fromOffset(props.Width or DEFAULT_WIDTH, 0),
		BackgroundColor3 = Theme.COLOR.WIDGET,
		FontFace = Theme.FONT.CONTENT,
		PlaceholderText = props.PlaceholderText or DEFAULT_PLACEHOLDER_TEXT,
		PlaceholderColor3 = Theme.COLOR.STROKE,
		Text = props.Text,
		TextColor3 = Theme.COLOR.TEXT,
		TextSize = Theme.TEXT_SIZE,
		TextWrapped = props.Wrapped,
		TextXAlignment = Enum.TextXAlignment.Left,

		changed("Text", props.Text :: any),

		create("UIPadding") {
			PaddingRight = UDim.new(0, TEXT_BOX_PADDING),
			PaddingTop = UDim.new(0, TEXT_BOX_PADDING),
			PaddingBottom = UDim.new(0, TEXT_BOX_PADDING),
			PaddingLeft = UDim.new(0, TEXT_BOX_PADDING),
		},
	}
end
