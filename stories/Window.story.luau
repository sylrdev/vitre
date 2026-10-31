local UILabs = require("../DevPackages/UILabs")
local Vide = require("../Packages/Vide")
local Vitre = require("../Packages/Vitre")

return {
	vide = Vide,
	story = function()
		Vitre:overrideUserInput(UILabs.Environment.UserInput)

		return Vitre.Window {}
	end,
}
