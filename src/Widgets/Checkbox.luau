const Vide = require("../../Vide")
const useKey = require("../Hooks/useKey")
const Images = require("../Images")
const Theme = require("../Theme")
const Types = require("../Types")

const create = Vide.create
const derive = Vide.derive
const read = Vide.read
const show = Vide.show

type Props = {
	Checked: Vide.Source<boolean>,
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
		Name = "CheckboxWidget",
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
			Name = "Checkbox",
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = useKey(Theme().Color.Widget),

			Activated = function()
				props.Checked(not props.Checked())
			end,

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

			create("ImageLabel") {
				Size = function()
					return UDim2.fromOffset(Theme().TextSize, Theme().TextSize)
				end,
				BackgroundTransparency = 1,
				Image = function()
					if props.Checked() == true then
						return Images.Check
					else
						return ""
					end
				end,
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
