local Internal = require("@self/Internal")

local Vitre = {}

--- Sets up Vitre.
function Vitre.setup() end

--- Overwrites the UserInputService used internally to use a custom one.
--- Useful when using plugins like `UILabs`.
---
--- @param service UserInputService --- custom service to use
function Vitre.overwriteUserInputService(service: UserInputService)
	Internal.UserInputService = service
end

--- Overwrites the container windows get rendered in.
--- Useful when using plugins like `UILabs`.
---
--- @param guiObject GuiObject --- new container to render windows in
function Vitre.overwriteWindowContainer(guiObject: GuiObject)
	Internal.WindowContainer(guiObject)
end

return Vitre
