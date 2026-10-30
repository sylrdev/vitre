local Vide = require("../../Packages/Vide")
local Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,
	story = function()
		return Vitre.Widget.SameLine {
			Children = {
				Vitre.Widget.Text { Text = "Same Line Vitre Widget" },
				Vitre.Widget.Text { Text = "Hello Wolrd!" },
			},
		}
	end,
}
