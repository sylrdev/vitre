const Tailwind = require("../Tailwind")
const Vide = require("../Vide")
const DraggingHandler = require("./DraggingHandler")
const Types = require("./Types")

const create = Vide.create
const read = Vide.read
const action = Vide.action

const DEFAULT_SIZE = Vector2.new(400, 450)

type Props = {
	Size: Types.Prop<Vector2>?,
}

return function(props: Props)
	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "Window",
		Size = function()
			local size = read(props.Size) :: Vector2 or DEFAULT_SIZE
			return UDim2.fromOffset(size.X, size.Y)
		end,

		action(function(instance)
			DraggingHandler:registerWindow(instance :: Types.Window)
		end),

		create("UIListLayout") {
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
		},

		create("Frame") {
			Name = "Header",
			Size = UDim2.fromOffset(0, 20),
			BackgroundColor3 = Tailwind.amber[500],
		},

		create("ScrollingFrame") {
			Name = "WidgetContainer",

			create("UIFlexItem") {
				FlexMode = Enum.UIFlexMode.Fill,
			},
		},
	}
end
