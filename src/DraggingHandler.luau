const Internal = require("./Internal")
const Types = require("./Types")

local initialized = false
local connections: { RBXScriptConnection } = {}
local windows: { Types.Window } = {}

const DraggingHandler = {}

type DraggingHandler = typeof(DraggingHandler)

--[[
	Initializes the dragging handler.
]]
function DraggingHandler.init(self: DraggingHandler)
	if initialized == true then
		return
	end

	local connection1 = Internal.UserInput.InputBegan:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
	end)

	local connection2 = Internal.UserInput.InputEnded:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
	end)

	local connection3 = Internal.UserInput.InputChanged:Connect(function(inputObject: InputObject)
		if inputObject.UserInputType ~= Enum.UserInputType.MouseMovement then
			return
		end

		const pointerPosition = Internal.UserInput:GetMouseLocation()
		const target = self:_findPointerTarget(pointerPosition)

		if target == nil then
			return
		end
	end)

	table.insert(connections, connection1)
	table.insert(connections, connection2)
	table.insert(connections, connection3)

	initialized = true
end

--[[
	Finds the window targeted by the pointer among the registered windows.

	@param pointerPosition: Vector2 - Pointer's position on the screen.
	@return Window? - Targeted window or nil if none are targeted.
]]
function DraggingHandler:_findPointerTarget(pointerPosition: Vector2): Types.Window?
	local target: Types.Window

	for _, window in ipairs(windows) do
		const header = window.Header
		const minX = header.AbsolutePosition.X
		const maxX = header.AbsolutePosition.X + header.AbsoluteSize.X
		const minY = header.AbsolutePosition.Y
		const maxY = header.AbsolutePosition.Y + header.AbsoluteSize.Y

		if
			(pointerPosition.X >= minX)
			and (pointerPosition.X <= maxX)
			and (pointerPosition.Y >= minY)
			and (pointerPosition.Y <= maxY)
		then
			target = window
		end
	end

	return target
end

--[[
	Registers a window to be handled and applies the dragging behavior to.

	Note: Initializes the handler if not already done.

	@param window: Window - Window to register.
]]
function DraggingHandler.registerWindow(self: DraggingHandler, window: Types.Window)
	self:init()
	table.insert(windows, window)
end

--[[
	Unregisters a window and removes the dragging behavior.

	@param window: Window - Window to unregister.
]]
function DraggingHandler:unregisterWindow(window: Types.Window)
	local index = table.find(windows, window)

	if index ~= nil then
		table.remove(windows, index)
	end
end

--[[
	Deinitializes the dragging handler.
]]
function DraggingHandler:deinit()
	for _, connection in ipairs(connections) do
		connection:Disconnect()
	end
end

return DraggingHandler
