const Vide = require("../../Vide")
const Theme = require("../Theme")
const Types = require("../Types")

const create = Vide.create
const read = Vide.read
const show = Vide.show

type Props = {
	Index: number,
	CurrentIndex: Vide.Source<number>,
	Text: Types.Prop<string>?,
}

return function(props: Props)
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
			Size = function()
				return UDim2.fromOffset(Theme().TextSize, Theme().TextSize)
			end,
			BackgroundColor3 = function()
				return Theme().Color.WidgetDark
			end,

			Activated = function()
				props.CurrentIndex(props.Index)
			end,

			create("UICorner") {
				CornerRadius = UDim.new(1),
			},

			create("Frame") {
				Size = UDim2.fromScale(0.6, 0.6),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = function()
					return Theme().Color.WidgetLight
				end,
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
				FontFace = function()
					return Theme().Font.Content
				end,
				Text = props.Text,
				TextColor3 = function()
					return Theme().Color.Text
				end,
				TextSize = function()
					return Theme().TextSize
				end,
			}
		end),
	}
end
