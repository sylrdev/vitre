local UserInputService = game:GetService("UserInputService")

local Vide = require("../Vide")

local source = Vide.source

return {
	UserInputService = UserInputService,
	Parent = source() :: Vide.Source<GuiObject>,
}
