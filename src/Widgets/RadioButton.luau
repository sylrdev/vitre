const Vide = require("../../Vide")
const useKey = require("../Hooks/useKey")
const Theme = require("../Theme")
const Types = require("../Types")

const create = Vide.create
const derive = Vide.derive
const read = Vide.read
const show = Vide.show

type Props = {
	Index: number,
	CurrentIndex: Vide.Source<number>,
	Text: Types.Prop<string>?,
}

return function(props: Props)
	local padding = derive(function()
		return UDim.new(0, Theme().Padding.Widget)
	end)

	local hasTextProp = function()
		return read(props.Text) ~= nil
	end

	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "RadioButtonWidget",
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,

		create("UIListLayout") {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = function()
				return UDim.new(0, Theme().Padding.WidgetContainer)
			end,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		},

		create("TextButton") {
			Name = "RadioButton",
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = useKey(Theme().Color.Widget),

			Activated = function()
				props.CurrentIndex(props.Index)
			end,

			create("UICorner") {
				CornerRadius = UDim.new(1),
			},

			create("UIPadding") {
				PaddingRight = padding,
				PaddingTop = padding,
				PaddingBottom = padding,
				PaddingLeft = padding,
			},

			create("Frame") {
				Size = function()
					return UDim2.fromOffset(Theme().TextSize, Theme().TextSize)
				end,
				BackgroundColor3 = useKey(Theme().Color.Text),
				BackgroundTransparency = function()
					if props.CurrentIndex() == props.Index then
						return 0
					else
						return 1
					end
				end,

				create("UICorner") {
					CornerRadius = UDim.new(1),
				},
			},
		},

		show(hasTextProp, function()
			return create("TextLabel") {
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				FontFace = useKey(Theme().Font.Content),
				Text = props.Text,
				TextColor3 = useKey(Theme().Color.Text),
				TextSize = useKey(Theme().TextSize),
			}
		end),
	}
end
