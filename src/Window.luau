const Vide = require("../Vide")
const DraggingHandler = require("./DraggingHandler")
const Images = require("./Images")
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
const DEFAULT_TITLE = "Window"
const DEFAULT_VISIBLE = true

local zIndex = 0

type Props = Types.WindowProps

return function(props: Props)
	local instanceRef: Types.Window

	local dragging = false
	local initialPointerPoisiton = Internal.PointerPosition()
	local initialFramePosition = UDim2.fromOffset(Theme().StrokeThickness, Theme().StrokeThickness)
	local framePosition = source(initialFramePosition)
	local absoluteFrameSize = source(Vector2.zero)

	local collapsed = source(false)

	local headerHeight = function()
		return Theme().TextSize + 5
	end

	local connection1 = Internal.StartDrag:Connect(function(window: Types.Window)
		local canDrag = read(props.CanDrag) :: boolean

		if canDrag == false then
			return
		end

		if window ~= instanceRef then
			return
		end

		dragging = true
		initialPointerPoisiton = Internal.PointerPosition()
		initialFramePosition = framePosition()
	end)

	local connection2 = Internal.StopDrag:Connect(function(window: Types.Window)
		local canDrag = read(props.CanDrag) :: boolean

		if canDrag == false then
			return
		end

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
		local strokeThickness = Theme().StrokeThickness
		local maxX = parent.AbsoluteSize.X - absoluteFrameSize().X - strokeThickness
		local maxY = parent.AbsoluteSize.Y - absoluteFrameSize().Y - strokeThickness

		maxX = math.max(strokeThickness, maxX)
		maxY = math.max(strokeThickness, maxY)

		const newX = math.clamp(initialFramePosition.X.Offset + diffX, strokeThickness, maxX)
		const newY = math.clamp(initialFramePosition.Y.Offset + diffY, strokeThickness, maxY)

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

				if collapsed() == true then
					return UDim2.fromOffset(size.X, 20)
				else
					return UDim2.fromOffset(size.X, size.Y)
				end
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
				Size = function()
					return UDim2.fromOffset(0, headerHeight())
				end,
				BackgroundColor3 = function()
					return Theme().Color.Header
				end,

				create("UIListLayout") {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
					VerticalAlignment = Enum.VerticalAlignment.Center,
				},

				create("ImageButton") {
					Name = "CollapseButton",
					Size = function()
						return UDim2.fromOffset(headerHeight(), headerHeight())
					end,
					BackgroundTransparency = 1,
					Image = function()
						local canCollapse = read(props.CanCollapse) :: boolean

						if canCollapse == false then
							return ""
						end

						if collapsed() == true then
							return Images.ArrowRight
						else
							return Images.ArrowDown
						end
					end,

					Activated = function()
						local canCollapse = read(props.CanCollapse) :: boolean

						if canCollapse == false then
							return
						end

						collapsed(not collapsed())
					end,
				},

				create("TextLabel") {
					Name = "TitleLabel",
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					FontFace = function()
						return Theme().Font.Header
					end,
					Text = props.Title or DEFAULT_TITLE,
					TextColor3 = function()
						return Theme().Color.Text
					end,
					TextSize = function()
						return Theme().TextSize
					end,
				},

				create("Frame") {
					Name = "_",
					Size = function()
						return UDim2.fromOffset(headerHeight(), headerHeight())
					end,
					BackgroundTransparency = 1,
				},
			},

			create("ScrollingFrame") {
				Name = "WidgetContainer",
				BackgroundColor3 = function()
					return Theme().Color.WidgetContainer
				end,
				Visible = function()
					return collapsed() == false
				end,
				ScrollBarThickness = 10,

				create("UIFlexItem") {
					FlexMode = Enum.UIFlexMode.Fill,
				},
			},
		}
	end)
end
