const Vide = require("../../Vide")
const useKey = require("../Hooks/useKey")
const Theme = require("../Theme")
const Types = require("../Types")

const create = Vide.create
const derive = Vide.derive
const changed = Vide.changed
const read = Vide.read

const DEFAULT_PLACEHOLDER_TEXT = "..."
const DEFAULT_WIDTH = 100
const DEFAULT_WRAPPED = false

type Props = {
	PlaceholderText: Types.Prop<string>?,
	Text: Vide.Source<string>,
	Width: Types.Prop<number>?,
	Wrapped: Types.Prop<boolean>?,
}

return function(props: Props)
	local widgetPadding = derive(function()
		return UDim.new(0, Theme().Padding.Widget)
	end)

	--selene:allow(mixed_table)
	return create("TextBox") {
		Name = "TextBoxWidget",
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = function()
			local width = read(props.Width) :: number or DEFAULT_WIDTH
			return UDim2.fromOffset(width, 0)
		end,
		BackgroundColor3 = useKey(Theme().Color.Widget),
		FontFace = useKey(Theme().Font.Content),
		PlaceholderText = props.PlaceholderText or DEFAULT_PLACEHOLDER_TEXT,
		PlaceholderColor3 = useKey(Theme().Color.PlaceholderText),
		TextColor3 = useKey(Theme().Color.Text),
		Text = props.Text,
		TextSize = useKey(Theme().TextSize),
		TextWrapped = props.Wrapped or DEFAULT_WRAPPED,
		TextXAlignment = Enum.TextXAlignment.Left,

		changed("Text", props.Text :: any),

		create("UICorner") {
			CornerRadius = function()
				return UDim.new(0, Theme().CornerRadius)
			end,
		},

		create("UIPadding") {
			PaddingRight = widgetPadding,
			PaddingTop = widgetPadding,
			PaddingBottom = widgetPadding,
			PaddingLeft = widgetPadding,
		},
	}
end
