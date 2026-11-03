const Vide = require("../../Packages/Vide")
const Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,
	story = function()
		return Vitre.Widget.Indent {
			Vitre.Widget.Text {
				Text = "Hello World!",
			},

			Vitre.Widget.Text {
				Text = "Hello World!",
			},
		}
	end,
}
