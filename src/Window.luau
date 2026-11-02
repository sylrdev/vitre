const Tailwind = require("../Tailwind")
const Vide = require("../Vide")
const DraggingHandler = require("./DraggingHandler")
const Internal = require("./Internal")
const Theme = require("./Theme")
const Types = require("./Types")

const create = Vide.create
const read = Vide.read
const action = Vide.action
const cleanup = Vide.cleanup
const source = Vide.source
const effect = Vide.effect
const changed = Vide.changed
const show = Vide.show

const DEFAULT_SIZE = Vector2.new(400, 450)
const DEFAULT_VISIBLE = true

local zIndex = 0

type Props = {
	Size: Types.Prop<Vector2>?,
	Visible: Vide.Source<boolean>?,
}

return function(props: Props)
	local instanceRef: Types.Window

	local dragging = false
	local initialPointerPoisiton = Internal.PointerPosition()
	local initialFramePosition = UDim2.new()
	local framePosition = source(initialFramePosition)
	local absoluteFrameSize = source(Vector2.zero)

	local connection1 = Internal.StartDrag:Connect(function(window: Types.Window)
		if window ~= instanceRef then
			return
		end

		dragging = true
		initialPointerPoisiton = Internal.PointerPosition()
		initialFramePosition = framePosition()
	end)

	local connection2 = Internal.StopDrag:Connect(function(window: Types.Window)
		if window ~= instanceRef then
			return
		end

		dragging = false
		initialPointerPoisiton = Internal.PointerPosition()
		initialFramePosition = framePosition()
	end)

	zIndex += 1

	effect(function()
		const pointerPosition = Internal.PointerPosition()

		if dragging == false then
			return
		end

		const diffX = pointerPosition.X - initialPointerPoisiton.X
		const diffY = pointerPosition.Y - initialPointerPoisiton.Y

		const parent = instanceRef.Parent :: GuiObject
		local maxX = parent.AbsoluteSize.X - absoluteFrameSize().X
		local maxY = parent.AbsoluteSize.Y - absoluteFrameSize().Y

		maxX = math.max(0, maxX)
		maxY = math.max(0, maxY)

		const newX = math.clamp(initialFramePosition.X.Offset + diffX, 0, maxX)
		const newY = math.clamp(initialFramePosition.Y.Offset + diffY, 0, maxY)

		framePosition(UDim2.fromOffset(newX, newY))
	end)

	cleanup(function()
		DraggingHandler:unregisterWindow(instanceRef)
		connection1:Disconnect()
		connection2:Disconnect()
	end)

	--selene:allow(mixed_table)
	return show(props.Visible or source(DEFAULT_VISIBLE), function()
		return create("Frame") {
			Name = "Window",
			Size = function()
				local size = read(props.Size) :: Vector2 or DEFAULT_SIZE
				return UDim2.fromOffset(size.X, size.Y)
			end,
			Position = framePosition,
			ZIndex = zIndex,

			action(function(instance)
				instanceRef = instance :: Types.Window

				DraggingHandler:registerWindow(instance :: Types.Window)
			end),

			changed("Position", framePosition :: any),
			changed("AbsoluteSize", absoluteFrameSize :: any),

			create("UIStroke") {
				Color = function()
					return Theme().Color.Stroke
				end,
				Thickness = function()
					return Theme().StrokeThickness
				end,
			},

			create("UIListLayout") {
				HorizontalFlex = Enum.UIFlexAlignment.Fill,
			},

			create("Frame") {
				Name = "Header",
				Size = UDim2.fromOffset(0, 20),
				BackgroundColor3 = function()
					return Theme().Color.Header
				end,
			},

			create("ScrollingFrame") {
				Name = "WidgetContainer",
				BackgroundColor3 = function()
					return Theme().Color.WidgetContainer
				end,

				create("UIFlexItem") {
					FlexMode = Enum.UIFlexMode.Fill,
				},
			},
		}
	end)
end
