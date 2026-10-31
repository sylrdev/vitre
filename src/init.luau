const Internal = require("@self/Internal")
const Window = require("@self/Window")

const Vitre = {}

Vitre.Window = Window

--[[
	Overrides the default user input service to use a custom one.

	Note: Call this when rendering a window in a storybook plugin like UI Labs.

	@param uis: UserInputService - New user input service to use.
]]
function Vitre:overrideUserInput(uis: UserInputService)
	Internal.UserInput = uis
end

return Vitre
