const Tailwind = require("../Tailwind")
const Vide = require("../Vide")
const DraggingHandler = require("./DraggingHandler")
const Types = require("./Types")

const create = Vide.create
const read = Vide.read
const action = Vide.action
const cleanup = Vide.cleanup

const defaultSize = Vector2.new(400, 450)

local zIndex = 1

type Props = {
	Size: Types.Prop<Vector2>?,
}

return function(props: Props)
	local instanceRef: Types.Window

	zIndex += 1

	cleanup(function()
		DraggingHandler:unregisterWindow(instanceRef)
	end)

	--selene:allow(mixed_table)
	return create("Frame") {
		Name = "Window",
		Size = function()
			local size = read(props.Size) :: Vector2 or defaultSize
			return UDim2.fromOffset(size.X, size.Y)
		end,
		ZIndex = zIndex,

		action(function(instance)
			instanceRef = instance :: Types.Window

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
