local Vide = require("../../Packages/Vide")
local Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,
	story = function()
		return Vitre.Widget.Indent {
			Children = {
				Vitre.Widget.Text { Text = "Vitre Indent Widget" },
				Vitre.Widget.Text { Text = "Hello World!" },
			},
		}
	end,
}
