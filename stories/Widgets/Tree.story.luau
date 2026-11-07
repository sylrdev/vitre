const UILabs = require("../../DevPackages/UILabs")
const Vide = require("../../Packages/Vide")
const Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,
	controls = {
		IsTitle = false,
	},
	story = function(props: UILabs.VideProps)
		return Vitre.Widget.Tree {
			Text = "Tree Widget",
			IsTitle = props.controls["IsTitle"],
			Children = {
				Vitre.Widget.Text {
					Text = "Text",
				},
			},
		}
	end,
}
