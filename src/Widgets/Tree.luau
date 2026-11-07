const Vide = require("../../Vide")
const Images = require("../Images")
const Theme = require("../Theme")
const Types = require("../Types")

const create = Vide.create
const source = Vide.source
const derive = Vide.derive
const read = Vide.read
const show = Vide.show

const DEFAULT_TEXT = "Tree"
const DEFAULT_COLLAPSED = false
const DEFAULT_IS_TITLE = false

type Props = {
	Text: Types.Prop<string>?,
	Collapsed: boolean?,
	IsTitle: Types.Prop<boolean>?,
	Children: { [any]: any },
}

return function(props: Props)
	local isTitle = derive(function()
		return read(props.IsTitle) :: boolean or DEFAULT_IS_TITLE
	end)
	local collapsed = source(props.Collapsed or DEFAULT_COLLAPSED)

	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "TreeWidget",
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,

		create("UIListLayout") {
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
			Padding = function()
				return UDim.new(0, Theme().Padding.WidgetContainer)
			end,
		},

		create("TextButton") {
			Name = "Header",
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = function()
				return Theme().Color.WidgetLight
			end,
			BackgroundTransparency = function()
				if isTitle() == true then
					return 0
				else
					return 1
				end
			end,

			Activated = function()
				collapsed(not collapsed())
			end,

			create("UICorner") {
				CornerRadius = function()
					return UDim.new(0, Theme().CornerRadius)
				end,
			},

			show(isTitle, function()
				local padding = derive(function()
					return UDim.new(0, Theme().Padding.Widget)
				end)

				return create("UIPadding") {
					PaddingRight = padding,
					PaddingTop = padding,
					PaddingBottom = padding,
					PaddingLeft = padding,
				}
			end),

			create("UIListLayout") {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = function()
					return UDim.new(0, Theme().Padding.WidgetContainer)
				end,
			},

			create("ImageLabel") {
				Size = function()
					return UDim2.fromOffset(Theme().TextSize, Theme().TextSize)
				end,
				BackgroundTransparency = 1,
				Image = function()
					if collapsed() == true then
						return Images.ArrowRight
					else
						return Images.ArrowDown
					end
				end,
			},

			create("TextLabel") {
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				FontFace = function()
					if isTitle() == true then
						return Theme().Font.Header
					else
						return Theme().Font.Content
					end
				end,
				Text = props.Text or DEFAULT_TEXT,
				TextColor3 = function()
					return Theme().Color.Text
				end,
				TextSize = function()
					return Theme().TextSize
				end,
			},
		},

		create("Frame") {
			Name = "ChildrenContainer",
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Visible = function()
				return collapsed() == false
			end,

			create("UIPadding") {
				PaddingLeft = function()
					return UDim.new(0, Theme().Padding.WidgetContainer * 4)
				end,
			},

			create("UIListLayout") {
				Padding = function()
					return UDim.new(0, Theme().Padding.WidgetContainer)
				end,
			},

			props.Children,
		},
	}
end
