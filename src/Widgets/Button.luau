const Vide = require("../../Vide")
const useKey = require("../Hooks/useKey")
const Theme = require("../Theme")
const Types = require("../Types")

const create = Vide.create
const derive = Vide.derive

type Props = {
	Text: Types.Prop<string>,
	Activated: (InputObject, number) -> (),
}

return function(props: Props)
	local padding = derive(function()
		return UDim.new(0, Theme().Padding.Widget)
	end)

	--selene:allow(mixed_table)
	return create("TextButton") {
		Name = "ButtonWidget",
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = useKey(Theme().Color.Widget),
		FontFace = useKey(Theme().Font.Content),
		Text = props.Text,
		TextColor3 = useKey(Theme().Color.Text),
		TextSize = useKey(Theme().TextSize),

		Activated = props.Activated,

		create("UICorner") {
			CornerRadius = function()
				return UDim.new(0, Theme().CornerRadius)
			end,
		},

		create("UIPadding") {
			PaddingRight = padding,
			PaddingTop = padding,
			PaddingBottom = padding,
			PaddingLeft = padding,
		},
	}
end
