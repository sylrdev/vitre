local Vide = require("../../Packages/Vide")
local Vitre = require("../../Packages/Vitre")
return {
	vide = Vide,
	story = function()
		return Vitre.Widget.Divider {}
	end,
}
