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
const derive = Vide.derive

const DEFAULT_SIZE = Vector2.new(400, 450)
const DEFAULT_POSITION = Vector2.new(Theme().StrokeThickness, Theme().StrokeThickness)
const DEFAULT_TITLE = "Window"
const DEFAULT_VISIBLE = true
const DEFAULT_FILL_HEIGHT = false
const DEFAULT_FILL_WIDTH = false

local zIndex = 0

type Props = {
	Size: Types.Prop<Vector2>?,
	Position: Vector2?,
	Title: Types.Prop<string>?,
	Visible: Vide.Source<boolean>?,
	CanCollapse: Types.Prop<boolean>?,
	CanDrag: Types.Prop<boolean>?,
	NoHeader: Types.Prop<boolean>?,
	FillHeight: Types.Prop<boolean>?,
	FillWidth: Types.Prop<boolean>?,
	Children: { [any]: any },
}

return function(props: Props)
	local instanceRef: Types.Window

	local dragging = false
	local initialPointerPoisiton = Internal.PointerPosition()
	local initialFramePosition = (function()
		if props.Position ~= nil then
			return UDim2.fromOffset(props.Position.X, props.Position.Y)
		else
			return UDim2.fromOffset(DEFAULT_POSITION.X, DEFAULT_POSITION.Y)
		end
	end)()
	local framePosition = source(initialFramePosition)
	local absoluteFrameSize = source(Vector2.zero)

	local collapsed = source(false)

	local headerHeight = derive(function()
		return Theme().TextSize + 5
	end)

	local cornerRadius = derive(function()
		return UDim.new(0, Theme().CornerRadius)
	end)

	local padding = derive(function()
		return UDim.new(0, Theme().Padding.WidgetContainer)
	end)

	local connection1 = Internal.StartDrag:Connect(function(window: Types.Window)
		const canDrag = read(props.CanDrag) :: boolean

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
		const canDrag = read(props.CanDrag) :: boolean

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
		const strokeThickness = Theme().StrokeThickness
		local maxX = parent.AbsoluteSize.X - absoluteFrameSize().X - strokeThickness
		local maxY = parent.AbsoluteSize.Y - absoluteFrameSize().Y - strokeThickness

		maxX = math.max(strokeThickness, maxX)
		maxY = math.max(strokeThickness, maxY)

		const newX = math.clamp(initialFramePosition.X.Offset + diffX, strokeThickness, maxX)
		const newY = math.clamp(initialFramePosition.Y.Offset + diffY, strokeThickness, maxY)

		framePosition(UDim2.fromOffset(newX, newY))
	end)

	effect(function()
		const noHeader = read(props.NoHeader) :: boolean

		if noHeader == true then
			DraggingHandler:unregisterWindow(instanceRef)
		else
			DraggingHandler:registerWindow(instanceRef)
		end
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
				const size = read(props.Size) :: Vector2 or DEFAULT_SIZE
				const fillHeight = read(props.FillHeight) :: boolean or DEFAULT_FILL_HEIGHT
				const fillWidth = read(props.FillWidth) :: boolean or DEFAULT_FILL_WIDTH

				local newSize: UDim2

				if fillHeight == true then
					newSize = UDim2.new(0, 0, 1, -Theme().StrokeThickness * 2)
				else
					newSize = UDim2.fromOffset(0, size.Y)
				end

				if fillWidth == true then
					newSize = UDim2.new(1, -Theme().StrokeThickness * 2, newSize.Y.Scale, newSize.Y.Offset)
				else
					newSize = UDim2.new(0, size.X, newSize.Y.Scale, newSize.Y.Offset)
				end

				if collapsed() == true then
					if fillWidth == true then
						return UDim2.new(1, newSize.X.Offset, 0, 20)
					else
						return UDim2.fromOffset(size.X, 20)
					end
				else
					return newSize
				end
			end,
			Position = framePosition,
			BackgroundColor3 = function()
				return Theme().Color.WidgetContainer
			end,
			ZIndex = zIndex,

			action(function(instance)
				instanceRef = instance :: Types.Window

				const noHeader = read(props.NoHeader) :: boolean

				if noHeader == true then
					return
				end

				DraggingHandler:registerWindow(instance :: Types.Window)
			end),

			changed("Position", framePosition :: any),

			changed("AbsoluteSize", absoluteFrameSize :: any),

			create("UICorner") {
				CornerRadius = cornerRadius,
			},

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
				Visible = function()
					const noHeader = read(props.NoHeader) :: boolean
					return noHeader ~= true
				end,

				create("UICorner") {
					CornerRadius = cornerRadius,
				},

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

						if canCollapse == false or dragging == true then
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
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(),
				ScrollBarThickness = 10,

				create("UICorner") {
					CornerRadius = cornerRadius,
				},

				create("UIFlexItem") {
					FlexMode = Enum.UIFlexMode.Fill,
				},

				create("UIPadding") {
					PaddingTop = padding,
					PaddingBottom = padding,
					PaddingLeft = padding,
					PaddingRight = function()
						return UDim.new(0, Theme().Padding.WidgetContainer + 10)
					end,
				},

				create("UIListLayout") {
					Padding = padding,
				},

				props.Children,
			},
		}
	end)
end
