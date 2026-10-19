local UILabs = require("../DevPackages/UILabs")
local Vide = require("../Packages/Vide")
local DraggableFrame = require("../Packages/Vitre/DraggableFrame")

return {
	vide = Vide,
	story = function()
		return DraggableFrame {
			_UserInputService = UILabs.Environment.UserInput,
		}
	end,
}
