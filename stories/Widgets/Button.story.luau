local Vide = require("../../Packages/Vide")
local Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,
	story = function()
		return Vitre.Widget.Button {
			Text = "Vitre Button Widget",

			Activated = function()
				print("Hello World!")
			end,
		}
	end,
}
