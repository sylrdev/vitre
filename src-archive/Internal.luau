local UserInputService = game:GetService("UserInputService")

local Vide = require("../Vide")

local source = Vide.source

return {
	UserInputService = UserInputService,
	WindowContainer = source() :: Vide.Source<GuiObject>,
}
