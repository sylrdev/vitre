const Vide = require("../../Packages/Vide")
const Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,
	story = function()
		return Vitre.Widget.Tree {
			Text = "Tree Widget",
			Children = {
				Vitre.Widget.Text {
					Text = "Text",
				},
			},
		}
	end,
}
